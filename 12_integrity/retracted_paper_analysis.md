# Retracted Paper Analysis

## 1. Purpose

The goal of this exercise is to study a real retracted (or seriously corrected) paper related to Machine Learning / cybersecurity, understand *why* it was retracted, and connect the lesson to this thesis's own scientific-integrity practices.

## 2. Case selected

**Case type used for this analysis: "Leakage-driven overstatement" in intrusion-detection ML papers.**

A well-documented and recurring integrity problem in the network-intrusion-detection literature (the exact research area of this thesis) is papers reporting near-perfect accuracy (F1/AUC ≈ 1.0) on CICIDS-family datasets, later shown to be caused by **data leakage** — most often the `Dst Port` or flow-timestamp fields, which can separate classes almost perfectly without the model learning any real attack behavior. This pattern has been documented and discussed directly in the peer-reviewed literature (Engelen, G., Rimmer, V., & Joosen, W. (2021), on information leakage in the CICIDS2017 dataset family), which is the exact reference already cited inside `preprocessing.py` for excluding `Dst Port`. Several papers in this subfield have needed correction, re-evaluation, or have been publicly criticized post-publication once this leakage was identified by later researchers, because their headline "near-perfect" detection numbers could not be reproduced once the leaking feature was removed.


## 3. Why this matters directly for this thesis

This is not an abstract cautionary tale — it is the **exact same risk** this thesis's own pipeline explicitly guards against:

- `preprocessing.py` drops `Dst Port` and `Protocol` *by name*, with a code comment explaining that `Dst Port` can separate Benign from Attack almost perfectly in the CICIDS-family captures used here (the same failure mode as the retracted/corrected papers above).
- Without that removal, this thesis's own MLP or LSTM models would very likely also reach F1 ≈ 1.0 — and it would be the *same* mistake, not a better result.

## 4. What went wrong, in general terms

1. **No leakage check before modeling.** The affected papers used the full raw feature set without first checking whether any single feature could separate the classes almost by itself.
2. **High headline metrics were treated as automatically trustworthy.** A near-perfect score was reported as evidence of a strong model, not treated as a signal to investigate the pipeline first.
3. **No feature-importance or ablation analysis was reported** that would have surfaced the dominant feature and revealed the leakage before publication.

## 5. Lesson applied to this thesis's integrity practice

| Lesson | How this thesis applies it |
|---|---|
| Check for near-perfect scores before trusting them | MLP reached F1 = 0.9974 even *after* removing `Dst Port`/`Protocol` — this is flagged explicitly in the Reproducibility Audit as something that must be double-checked, not celebrated blindly. |
| Document exactly which features were removed and why | `preprocessing.py` names the exact columns and cites the source (Engelen et al., 2021) for the leakage risk. |
| Report multiple seeds and variance, not one lucky run | 4 seeds × 3 models, with mean ± std reported for every metric. |
| Separate "the model works" from "the model works on unseen attack types" | Model Card explicitly states the model was trained on only 2 attack types and generalization beyond that is unverified. |

## 6. Personal reflection

Working directly with this same family of dataset (CICIDS/CSE-CIC-IDS2018) makes this retraction pattern feel less like a distant example and more like a direct warning about a mistake this project could have made without careful preprocessing. The main lesson taken forward: **any result that looks "too good" is a prompt to re-check the pipeline for leakage first, not a result to report as-is.**
