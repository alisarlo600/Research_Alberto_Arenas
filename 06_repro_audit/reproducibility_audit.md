# Reproducibility Audit

**Project:** Autonomous Threat Hunting Based on Deep Learning for the Optimization of Incident Response Playbooks in a SOC
**Author:** Alberto Arenas (UNMSM Doctoral Program)

---

## 1. Purpose

This document has two parts:

1. An audit of a **published paper** from the thesis bibliography, using a standard reproducibility checklist.
2. A **self-audit** of the student's own pipeline (`preprocessing.py`, `models.py`, `train_pipeline.py`), using the same checklist, so the two can be compared side by side.

The goal is not to judge the published paper's science. The goal is to check how easy it would be for another researcher, with only the paper (or only the repo), to reproduce the reported numbers.

---

## 2. Paper audited

**Kim, J., Kim, J., Thu, H. L. T., & Kim, H. (2016). Long Short Term Memory Recurrent Neural Network Classifier for Intrusion Detection.** 2016 International Conference on Platform Technology and Service (PlatCon), pp. 1–5. IEEE.

This paper was chosen because it is one of the earliest and most cited works applying LSTM to intrusion detection, and it is a direct methodological ancestor of the LSTM model used in this thesis. It is a short (5-page) conference paper, so some checklist items below could not be confirmed from the abstract/reference record alone; those are marked **"not verifiable from available record."**

### 2.1 Reproducibility checklist

| Item | Found in the paper? | Notes |
|---|---|---|
| Dataset publicly available | Yes | Uses the KDD Cup 99 benchmark dataset, a standard public dataset in IDS research. |
| Train/test split described | Partially | KDD99 ships with a predefined train/test split, which the paper appears to reuse, but the exact split procedure used inside training is not confirmed from the available record. |
| Multiple random seeds reported | Not verifiable from available record | Short conference papers from this period commonly report a single run; no explicit statement of seed count was found. |
| Confidence intervals / std. deviation | Not verifiable from available record | No indication that results are reported as mean ± std over multiple runs. |
| Statistical significance test | No | No hypothesis test (e.g., t-test) between models is mentioned in any secondary source reviewed. |
| Hyperparameters fully listed | Not verifiable from available record | Typical for this venue is a brief hyperparameter mention, not a full table. |
| Compute / hardware reported | Not verifiable from available record | Not mentioned in any citing source reviewed. |
| Code released | No | No public code repository is linked to this paper. |
| Random seed value(s) disclosed | No | Not found. |

### 2.2 Overall reproducibility score

**Score: 2 / 10**

**Justification:** The paper uses a public, well-known dataset (KDD99), which is a real strength. But almost everything needed to *exactly* reproduce the reported numbers is missing: no code, no seed(s), no confirmation of multiple runs, no confidence intervals, no significance testing, and no compute details. A reader could re-implement an LSTM classifier "in the spirit" of the paper, but could not reproduce the exact reported accuracy. This is common and largely expected for a 5-page conference paper from 2016, before reproducibility checklists (e.g., NeurIPS, ML Reproducibility Challenge) became standard in the field — it is a limitation of the venue and era, not a unique flaw of this specific paper.

---

## 3. Self-audit: this thesis pipeline

Same checklist, applied to `preprocessing.py` + `models.py` + `train_pipeline.py`, run on CSE-CIC-IDS2018 (file `02-15-2018.csv`).

| Item | Present in this pipeline? | Evidence |
|---|---|---|
| Dataset publicly available | Yes | CSE-CIC-IDS2018, a public benchmark dataset for network intrusion detection. |
| Train/test split described | Yes | Stratified 60/20/20 split, fixed `random_state=42` for the split, documented in `preprocessing.py`. |
| Same split reused across models/seeds | Yes | `SPLIT_SEED = 42` is fixed for all 12 runs (3 models × 4 seeds); only weight initialization and batch order change between seeds. |
| Multiple random seeds reported | Yes | 4 seeds per model: 42, 43, 44, 45. |
| Mean ± std over runs | Yes | `build_summary_table()` computes mean and std (ddof=1) for accuracy, precision, recall, F1, ROC-AUC, PR-AUC per model. |
| Statistical significance test | No | Not currently implemented — flagged as a limitation below. |
| Hyperparameters fully listed | Yes | Epochs, learning rate, batch size, optimizer, weight decay are fixed constants in `train_pipeline.py` and logged to MLflow per run (`mlflow.log_params`). |
| Compute / hardware reported | Partial | Training device (`cpu`/`cuda`) and per-run wall-clock time (`train_time_sec`) are logged; exact GPU/CPU model is not recorded. |
| Code released | Yes (intended) | `preprocessing.py`, `models.py`, `train_pipeline.py` are meant to be versioned in the GitHub repo (`05_pipeline/src/`). |
| Experiment tracking | Yes | MLflow experiment `SOC_Autonomous_Threat_Hunting_DL`, one run per (model, seed) combination, with metrics, params, and model artifact (`.pt`) logged. |
| Leakage control documented | Yes | `Dst Port` and `Protocol` are explicitly dropped and the reason is documented in code comments (near-perfect class separation via port fingerprinting). |

### 3.1 Overall reproducibility score

**Score: 8 / 10**

**Justification:** The pipeline fixes the data split seed, runs every model across 4 different training seeds, and reports mean ± std for every metric — this is exactly what is missing from the 2016 paper above. It also tracks every run in MLflow with logged parameters, metrics, and saved model weights, so any run can be reloaded exactly (`playbook_automation.ipynb` does this to reload the champion model). Two points are lost because: (1) no formal statistical significance test (e.g., paired t-test between MLP and LSTM) is run yet, only descriptive mean/std; (2) exact hardware specs are not pinned, and training on `cpu` (as recorded in the current run) versus a GPU could change wall-clock time, though not the reported metrics.

---

## 4. Real results used as evidence (from `train_pipeline.ipynb`, dataset `02-15-2018.csv`)

Data shape: 624,328 train / 208,110 val / 208,110 test rows, 66 features after cleaning. Target: 1 = Attack (DoS GoldenEye + DoS Slowloris), 0 = Benign.

| Model | Runs | Accuracy (mean ± std) | Precision | Recall | F1 (mean ± std) | ROC-AUC | PR-AUC |
|---|---|---|---|---|---|---|---|
| MLP | 4 | 0.9997 ± 0.0000 | 0.9994 ± 0.0000 | 0.9954 ± 0.0003 | **0.9974 ± 0.0001** | 1.0000 ± 0.0000 | 0.9998 ± 0.0000 |
| LSTM | 4 | 0.9993 ± 0.0007 | 0.9947 ± 0.0076 | 0.9913 ± 0.0060 | 0.9930 ± 0.0068 | 0.9999 ± 0.0001 | 0.9983 ± 0.0025 |
| Autoencoder | 4 | 0.9554 ± 0.0006 | 0.7203 ± 0.1178 | 0.3111 ± 0.3103 | 0.3550 ± 0.1905 | 0.9545 ± 0.0115 | 0.4516 ± 0.0776 |

**What the std column shows:** MLP is extremely stable across seeds (std ≈ 0). LSTM is stable but noisier (one seed, 43, dropped to F1 = 0.9828 while the others stayed above 0.995). The Autoencoder is highly unstable (F1 ranges from 0.25 to 0.64 across seeds) — this by itself is evidence that reporting a single seed for the Autoencoder, as most published anomaly-detection IDS papers do, would be misleading. This is direct proof, from the student's own experiment, of why multi-seed reporting matters.

---

## 5. Note on the Autoencoder's training class (checked against this run's real numbers)

The Autoencoder code (`train_autoencoder()`) trains only on the **dominant class of the training set**, whatever that turns out to be — it does not hard-code "benign." In earlier project notes this was flagged as a risk: *if* the dominant class in a given capture were the attack class, the Autoencoder would be learning "normal attack behavior" instead of "normal benign behavior," breaking the usual anomaly-detection assumption.

For this specific run, on `02-15-2018.csv`, the logged training class counts are **0 = Benign: 592,829 rows** vs. **1 = Attack: 31,499 rows**. So the dominant class here is actually **Benign**, and the Autoencoder trained the "textbook-correct" way for this file: it learned what normal traffic looks like and flagged attacks as reconstruction-error anomalies.

This means the Autoencoder's weak, unstable performance (F1 between 0.25 and 0.64 across seeds) is **not** explained by the dominant-class risk in this particular run — it is more likely explained by: (1) a 33-to-1 class imbalance making reconstruction error a noisy anomaly signal, (2) the F1-optimized threshold being tuned on a small positive class in validation, and (3) only 60 training epochs on a simple 3-layer bottleneck. The dominant-class risk remains a real, code-level limitation that must still be checked and reported for **every** capture file used in the final thesis (not every 2018 CIC-IDS file has the same class balance), and the thesis should state explicitly, per dataset, which class the Autoencoder actually trained on.
