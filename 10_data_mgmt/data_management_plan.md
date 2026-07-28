# Data Management Plan (DMP)

**Project:** Autonomous Threat Hunting Based on Deep Learning for the Optimization of Incident Response Playbooks in a SOC
**Framework used:** FAIR principles (Findable, Accessible, Interoperable, Reusable)

## 1. Data overview

| Item | Description |
|---|---|
| Dataset | CSE-CIC-IDS2018, file `02-15-2018.csv` |
| Type | Network flow records (CICFlowMeter format), tabular, numeric |
| Size | 1,048,575 rows raw; 66 features + label after cleaning |
| Source | Canadian Institute for Cybersecurity (public research dataset) |
| Personal data present? | No direct personal identifiers (see `09_ethics/ethics_protocol.md`, §1) |
| Sensitive data present? | No (network telemetry, not user content) |

## 2. FAIR principles applied

### Findable
- The dataset is registered under a fixed, documented path pattern inside the project: `{PROJECT_DIR}/Data/02-15-2018.csv` (currently on Google Drive during development).
- The final GitHub repo will track this file with **DVC** (Data Version Control), not with Git directly — Git stores a small `.dvc` pointer file, and DVC stores/retrieves the actual data from a remote (e.g., Google Drive, S3).
- Every processed artifact (train/val/test splits, scaler, trained model weights, MLflow run) is named with a clear, consistent pattern: `model_{ModelName}_seed{N}.pt`, `all_runs.csv`, `summary_statistics.json`, so any file can be traced back to the exact run that produced it.

### Accessible
- Raw data: publicly available from the CIC directly (registration required, standard for this dataset family — this is the CIC's policy, not a restriction added by this thesis).
- Derived, non-sensitive artifacts (metrics tables, model cards, playbook JSON) are committed to the private course GitHub repository, accessible to the instructor as a collaborator.
- Large binary artifacts (raw CSV, `.pt` model weights) are pulled on demand via `dvc pull`, keeping the Git repo itself small and fast to clone.

### Interoperable
- Data is kept in standard, widely-supported formats: CSV for tabular data, JSON for structured metrics/playbook output, `.pt` (PyTorch state_dict) for model weights — all readable by common open-source tools, not a proprietary format.
- Feature names and the target encoding (0 = Benign, 1 = Attack) are documented once in `preprocessing.py` and reused consistently across `models.py`, `train_pipeline.py`, and `playbook_automation.ipynb`, avoiding silent mismatches between modules.

### Reusable
- Every processing step (leakage-column removal, zero-variance-column removal, scaling) is implemented in code (`preprocessing.py`), not done manually — so it can be re-run identically on a new capture file.
- The exact split seed (`SPLIT_SEED = 42`) and training seeds (`[42, 43, 44, 45]`) are fixed constants in code, not hidden defaults, so results are re-runnable.
- Known limitations (leakage columns, Autoencoder dominant-class behavior, two-attack-type scope) are documented in the Model Card and Reproducibility Audit so future reusers understand the boundaries of valid reuse.

## 3. Anonymization strategy

The dataset, as obtained from the CIC, does not include personally identifying fields in the feature set used here (no usernames, no packet payload/content, no direct source-host identity beyond flow statistics). No additional anonymization was required for this stage. If a future version of this research uses **real organizational traffic** instead of this public benchmark, the following would be required before any processing: strip or hash internal IP addresses and hostnames, remove any payload content, and apply k-anonymity or a similar technique to any grouping field used for analysis (e.g., subnet) before it leaves the SOC's network boundary.

## 4. Legal compliance checklist

| Requirement | Status | Notes |
|---|---|---|
| Peru Ley 29733 (Personal Data Protection Law) | Not applicable at this stage | No personal data processed; would apply directly if real organizational/user data is used in a later stage. |
| GDPR | Not applicable | No EU personal data involved; the dataset does not contain EU citizens' personal data. |
| CIC dataset usage terms | Followed | Dataset obtained through the CIC's standard registration/access process; not redistributed raw in the project repo. |
| Data minimization | Followed | Only the features needed for the classification task are kept; leakage and zero-variance columns are dropped early. |

## 5. Storage, backup, and retention

- **During development:** Google Drive (Colab-mounted), used for the raw CSV, intermediate results, and MLflow SQLite database (`mlflow.db`).
- **For submission:** raw data and model weights tracked via DVC with a configured remote; Git tracks only code, `.dvc` pointer files, and small text/JSON artifacts.
- **Retention:** kept for the duration of the doctoral program and any resulting publication process; no personal-data retention limits apply, since no personal data is stored.
- **Backup:** DVC remote storage acts as the backup for large binary artifacts; the GitHub repository itself is the backup for all code and small structured outputs.

## 6. Roles and responsibilities

Alberto (thesis author) is solely responsible for data handling, DVC configuration, and keeping this DMP updated as the project moves from a benchmark dataset toward any real SOC data in future work.
