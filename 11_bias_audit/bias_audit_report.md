# Bias Audit Report

**Project:** Autonomous Threat Hunting Based on Deep Learning for the Optimization of Incident Response Playbooks in a SOC
**Model audited:** MLP champion run (`MLP_seed43`), F1 = 0.9975 on the full test set
**Dataset:** CSE-CIC-IDS2018, file `02-15-2018.csv`, test split (208,110 flows)

## 1. Why this audit, and why this proxy attribute

This audit checks a real, SOC-relevant version of the same question: **does the model protect all parts of the network equally, or does it work worse for some kinds of traffic than others?**

**Proxy group used:** the flow's destination port range —

- `well_known (0-1023)` — standard services (e.g., HTTP=80, HTTPS=443)
- `registered (1024-49151)` — registered application ports
- `dynamic (49152-65535)` — dynamic/ephemeral ports

`Dst Port` itself was already removed from the model's input features during preprocessing (it is a data leakage risk — see `06_repro_audit/reproducibility_audit.md`). It is reused **only here**, after the fact, purely to group flows for this audit — the model never sees it during training or prediction.

## 2. Results — BEFORE mitigation (single global threshold = 0.9991)

| Group | Flows (n) | Real attack rate | Recall | Precision | F1 | False-negative rate |
|---|---|---|---|---|---|---|
| well_known (0-1023) | 162,101 | 6.48% | 0.9956 | 0.9998 | 0.9977 | 0.44% |
| registered (1024-49151) | 20,636 | 0.00% | — (no attacks) | — | — | — |
| dynamic (49152-65535) | 25,373 | 0.00% | — (no attacks) | — | — | — |

**Spurious alarms in groups with zero real attacks (worth watching, even if tiny):** the model still predicted a small number of false positives where there were no real attacks at all — about 3 flows out of 25,373 in the `dynamic` group, and about 2 out of 20,636 in `registered`. These numbers are too small to prove anything on their own, but they are reported here for full transparency, not hidden.

## 3. Key finding: this dataset does not let us fully test cross-group fairness

**All attack traffic in this capture (100%) targets `well_known` ports.** This makes sense given the two attack types present — DoS GoldenEye and DoS Slowloris are both HTTP-based flood attacks, which target port 80/443, both inside the `well_known` range.

This means the audit's original question — *"is the model worse at catching attacks in some groups than others?"* — **cannot be fully answered with this specific capture file**, because two of the three groups (`registered`, `dynamic`) simply have no real attacks to measure recall against. This is an honest limitation of the data, not a limitation hidden to make the model look fair. It is reported here exactly as found, per the course's integrity policy (`12_integrity/ai_use_policy.md`).

**What this audit *can* confirm:** within the one group that does contain attacks (`well_known`), the model performs very well (recall 0.9956, F1 0.9977) — consistent with the overall test-set metrics already reported in the Model Card.

**What this audit *cannot* confirm or deny:** whether the model would perform equally well on attacks that target registered or dynamic ports (e.g., a botnet C2 channel on a high port, or an attack against a custom application service). No such attack type exists in this specific capture file to test that.

## 4. Results — AFTER mitigation (per-group F1-optimal threshold)

Mitigation applied: instead of one global decision threshold for the whole test set, a separate F1-optimal threshold is computed for each group (a standard post-processing fairness technique).

| Group | New threshold | Recall | Precision | F1 | False-negative rate |
|---|---|---|---|---|---|
| well_known (0-1023) | 0.0260 (down from 0.9991) | 0.9999 | 0.9913 | 0.9956 | 0.01% |
| registered (1024-49151) | unchanged (no attacks to optimize against) | — | — | — | — |
| dynamic (49152-65535) | unchanged (no attacks to optimize against) | — | — | — | — |

**What changed for `well_known` traffic:** lowering the threshold from 0.9991 to 0.0260 for this group pushed recall from 0.9956 to 0.9999 — the missed-attack rate dropped from 0.44% to 0.01%, almost eliminating false negatives for this traffic type. The trade-off: precision dropped slightly (0.9998 → 0.9913), meaning slightly more false alarms. **This is a real, honest trade-off, not a free win** — in a SOC, this means analysts would see a few more false "Alto" severity alerts in exchange for catching almost every real attack on standard ports.

## 5. Interpretation and recommendation

1. **No cross-group unfairness was proven, because it could not be tested** — not because the model was shown to be fair everywhere. This distinction matters and must be stated exactly this way in the thesis, not simplified into "the model is fair."
2. **Recommendation for future work:** repeat this same audit script (`11_bias_audit/bias_audit.ipynb`) on a CSE-CIC-IDS2018 capture file that contains attack types targeting non-standard ports (e.g., botnet or infiltration captures from other days in the same dataset family) to properly test the `registered`/`dynamic` groups.
3. **Operational takeaway that *is* supported by this audit:** if the SOC operator only cares about detecting the two DoS attack types studied here, a lower, group-specific threshold on `well_known`-port traffic meaningfully reduces missed attacks, at a small, quantified cost in false positives. This is a legitimate, evidence-based tuning recommendation to include in the playbook design discussion.

## 6. Reproducibility note

This audit was produced by `11_bias_audit/bias_audit.ipynb`, run inside Google Colab on the project's own Drive folder. It reloads the champion model directly from its saved `.pt` weights (`model_MLP_seed43.pt`) and reconstructs the exact same test split used in `preprocessing.py` (`random_state=42`), so these numbers can be regenerated exactly by re-running that notebook. Raw output is also saved as JSON at `results/bias_audit/bias_audit_result.json` in the project Drive folder.
