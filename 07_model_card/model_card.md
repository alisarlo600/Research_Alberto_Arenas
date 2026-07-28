# Model Card

*Format follows Mitchell et al. (2019), "Model Cards for Model Reporting."*

## Model details

- **Name:** SOC-ThreatHunter-MLP
- **Version / run:** `MLP_seed43` (champion run selected automatically by `playbook_automation.ipynb`)
- **Type:** Feed-forward neural network (Multi-Layer Perceptron), binary classifier
- **Architecture:** 3 hidden layers (128 → 64 → 32 units), ReLU activation, BatchNorm, Dropout 0.3, single logit output
- **Framework:** PyTorch
- **Trained by:** Alberto, UNMSM Doctoral Program in Deep Technologies
- **Training date:** logged in MLflow experiment `SOC_Autonomous_Threat_Hunting_DL`
- **License:** research / academic use only (thesis artifact, not a production security product)
- **Contact:** thesis author, via UNMSM

## Intended use

- **Primary intended use:** Detect network-flow-level attack traffic (binary: Benign vs. Attack) to automatically trigger and prioritize incident response playbooks in a Security Operations Center (SOC).
- **Primary intended users:** Security analysts and SOC automation systems, as a decision-support tool.
- **Out-of-scope uses:** This model is **not** intended to replace analyst judgment, to be deployed unsupervised in production, or to classify attack types beyond the two seen in training (DoS GoldenEye, DoS Slowloris). It has not been evaluated on live/real-time traffic, only on a static, historical capture.

## Training data

- **Dataset:** CSE-CIC-IDS2018, file `02-15-2018.csv` (CICFlowMeter-format network flow features)
- **Size before cleaning:** 1,048,575 rows; 3 original labels — Benign (996,077), DoS attacks-GoldenEye (41,508), DoS attacks-Slowloris (10,990)
- **Target encoding:** binary — 0 = Benign, 1 = Attack (any non-Benign label)
- **Split:** stratified 60/20/20 (train/val/test), fixed `random_state=42`
- **Final train set:** 624,328 rows, 66 features; class balance 592,829 Benign vs. 31,499 Attack (≈95% / 5%)
- **Leakage columns removed:** `Dst Port`, `Protocol` — `Dst Port` alone can separate classes almost perfectly in this capture (port fingerprinting, not real attack behavior), so it is excluded to force genuine behavioral detection.
- **Also removed:** `Timestamp` and 10 zero-variance columns (e.g., `Bwd PSH Flags`, `Fwd URG Flags`) that carry no signal in this capture.
- **Scaling:** StandardScaler fit only on the training set, then applied to val/test.

## Evaluation data

Held-out test split from the same capture file (208,110 rows, same 66 features, same cleaning pipeline, scaler fit on train only — no leakage between splits).

## Metrics (test set, mean ± std over 4 seeds: 42, 43, 44, 45)

| Metric | MLP (this model) |
|---|---|
| Accuracy | 0.9997 ± 0.0000 |
| Precision | 0.9994 ± 0.0000 |
| Recall | 0.9954 ± 0.0003 |
| F1-score | 0.9974 ± 0.0001 |
| ROC-AUC | 1.0000 ± 0.0000 |
| PR-AUC | 0.9998 ± 0.0000 |

**Champion run used in production (`MLP_seed43`):** F1 = 0.9975, decision threshold = 0.9991 (F1-optimized on the validation split).

**Batch evaluated by the playbook module:** 208,110 flows → 10,460 flagged as attack (detection rate ≈ 5.03%), split into severity tiers: 3,752 High, 3,261 Medium, 3,447 Low, 197,650 Benign.

## Quantitative comparison with other candidate models (same test set, same 4 seeds)

| Model | F1 (mean ± std) | Recall (mean ± std) | Notes |
|---|---|---|---|
| **MLP (selected)** | 0.9974 ± 0.0001 | 0.9954 ± 0.0003 | Most stable, highest F1 |
| LSTM | 0.9930 ± 0.0068 | 0.9913 ± 0.0060 | Competitive, but one seed (43) dropped to F1 = 0.9828 |
| Autoencoder | 0.3550 ± 0.1905 | 0.3111 ± 0.3103 | Unsupervised; unstable across seeds; not selected |

## Ethical considerations

- **False negatives (missed attacks) are the highest-risk error type in a SOC.** At the champion threshold, recall = 0.9954, meaning roughly 0.5% of real attack flows in this test set are still missed. This should be stated as a residual risk, not hidden behind the high headline accuracy.
- **Class imbalance:** the training set is ~95% Benign. High accuracy alone would be misleading; F1, recall, and PR-AUC are reported for that reason.
- **Very high scores (F1 near 1.0) are also a reproducibility flag**, not only good news: it must be double-checked (and is checked in `06_repro_audit/reproducibility_audit.md`) that no leakage feature is left in the 66 features used for training.
- **Two attack types only:** DoS GoldenEye and DoS Slowloris. The model has not been trained or tested on other attack families (e.g., brute force, botnet, infiltration); performance on unseen attack types is unknown and should not be assumed.

## Caveats and recommendations

- This model was trained and evaluated on a **single capture day** (Feb 15, 2018). Its generalization to other days, other networks, or live traffic is untested and should not be assumed before further validation.
- The Autoencoder's dominant-class training logic (see `06_repro_audit/reproducibility_audit.md`, Section 5) must be re-checked for every new capture file before reuse, since class balance can differ between files.
- Recommended next step before any real-world use: re-evaluate on a second, independent capture day, and add a statistical significance test between MLP and LSTM (currently only descriptive mean/std is reported).
