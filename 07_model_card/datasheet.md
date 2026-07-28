# Datasheet for the Dataset

*Format follows Gebru et al. (2021), "Datasheets for Datasets," simplified.*

## Motivation

- **Why was this dataset created?** CSE-CIC-IDS2018 was created by the Canadian Institute for Cybersecurity and the Communications Security Establishment to give researchers a modern, realistic, labeled dataset for testing intrusion detection systems, since older datasets (e.g., KDD99, from 1999) no longer reflect current network traffic or attack patterns.
- **Who created it?** Canadian Institute for Cybersecurity (CIC), University of New Brunswick, with the Communications Security Establishment (CSE).
- **Who is using it in this project?** This thesis uses one capture file from that dataset, `02-15-2018.csv`, to train and evaluate the threat-hunting models.

## Composition

- **What does one row represent?** One network flow (a sequence of packets between a source and destination over a session), summarized into 66+ numeric features by the CICFlowMeter tool (packet counts, byte counts, flow duration, inter-arrival times, TCP flags, etc.).
- **How many rows?** 1,048,575 rows in the raw file used.
- **Label distribution (raw):** Benign: 996,077 · DoS attacks-GoldenEye: 41,508 · DoS attacks-Slowloris: 10,990.
- **Is any information about people included?** No names, emails, or direct personal identifiers. The flows describe network traffic behavior (timing, size, protocol-level counters), not message content or user identity. Source/destination IP addresses are not present in the cleaned feature set used here.
- **Are there missing/invalid values?** Yes — a small number of rows contain `inf`/`-inf` values (from divisions by a flow duration close to 0). These rows are dropped during cleaning (`clean()` in `preprocessing.py`).

## Collection process

- The traffic was generated in a controlled testbed at the CIC, combining real background traffic profiles with simulated attacks (in this file: HTTP-based Denial-of-Service attacks — GoldenEye and Slowloris), then converted from raw packet captures (`.pcap`) into flow-level features using CICFlowMeter.
- This project did **not** collect any new data; it reuses the public file as-is.

## Preprocessing applied in this project

1. Drop `Timestamp` (the ~2h15min capture window has no reusable cyclical pattern).
2. Drop `Dst Port` and `Protocol` — both act as **leakage features**: `Dst Port` alone can separate Benign from Attack almost perfectly in this capture (e.g., a fixed attacked port), which would let a model reach F1 = 1.0 by "port fingerprinting" instead of learning real traffic behavior. This is a known issue in the IDS/ML literature (see Engelen et al., 2021, on information leakage in CICIDS-family datasets).
3. Drop 10 zero-variance columns that never change in this file (e.g., `Bwd PSH Flags`, `Fwd URG Flags`, `CWE Flag Count`) — they carry no signal.
4. Encode target: 1 = any non-Benign label (Attack), 0 = Benign.
5. Stratified split 60/20/20 (train/val/test), fixed seed 42, so class proportions are preserved across splits.
6. StandardScaler fit only on the training split, then applied to validation and test (prevents data leakage from val/test into the scaler).

## Uses

- **Intended uses:** academic research on network intrusion / threat detection, benchmark comparisons between DL architectures, playbook-automation research (this thesis).
- **Uses to avoid:** using this dataset alone as proof that a model will work on live production traffic. It reflects one lab-generated capture with only two attack types; it is not a substitute for testing on the target organization's real traffic.

## Distribution and maintenance

- Publicly available from the CIC (registration required); redistribution terms are set by the CIC, not by this thesis.
- This project does not modify or redistribute the raw file — only the derived, cleaned splits (and their DVC pointers) are versioned in the project repository, following the project's Data Management Plan (`10_data_mgmt/data_management_plan.md`).
