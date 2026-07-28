# Ethics Protocol

**Project:** Autonomous Threat Hunting Based on Deep Learning for the Optimization of Incident Response Playbooks in a SOC

## 1. Does this research involve human participants or personal data?

No. This study does not collect data from human subjects (no interviews, no surveys, no biometric data). It uses a public, pre-existing network-traffic dataset (CSE-CIC-IDS2018, file `02-15-2018.csv`) that describes network flow behavior, not individual people. No formal Institutional Review Board (IRB) review is legally required for this reason, but the ethical questions below still matter because the model's output (a playbook decision) affects people — SOC analysts and, indirectly, whoever operates the flagged host.

## 2. Belmont principles, applied to this project

### 2.1 Respect for persons

- **Who is affected by this model's decisions?** Two groups: (1) the SOC analyst who receives the playbook recommendation, and (2) the (unknown) person or system behind the flagged network flow.
- **How is their autonomy respected?** The model is designed as a **decision-support** tool, not an autonomous responder. Every playbook tier (`Alto`/`Medio`/`Bajo`) produced by `playbook_automation.ipynb` results in a recommended action list and an SLA, not an automatic irreversible action (e.g., it does not auto-block a host by itself in this thesis's scope). A human analyst remains the one who executes containment actions like "Isolate/quarantine the host."
- **Informed consent:** Not applicable to the dataset's original subjects at this stage (public, already-anonymized research dataset). If this framework were deployed inside a real SOC in a future stage, the organization's monitoring policy and employee notice requirements would need to cover it explicitly — this is flagged as future work, not solved by this thesis.

### 2.2 Beneficence (maximize benefit, minimize harm)

- **Benefit:** faster, more consistent triage of high-volume alerts, which is the real problem this thesis targets (analyst fatigue and alert overload in SOCs).
- **Harm 1 — false negatives:** the champion model (`MLP_seed43`) has recall = 0.9954 on the test set, meaning ≈0.5% of real attacks in this test batch are missed. In a live SOC this is the most dangerous error type (an undetected breach), and it must be reported to stakeholders as a residual risk, not hidden behind the high headline F1 score.
- **Harm 2 — false positives:** every flow flagged "Alto" triggers "isolate/quarantine the host" with a 15-minute SLA (see `PLAYBOOK_CATALOG` in `playbook_automation.ipynb`). A false positive at this tier could disconnect a legitimate business system. This is a direct, real-world cost of the automation and must be weighed against the benefit of faster response.
- **Mitigation already in place:** the decision threshold (0.9991) is chosen to *maximize F1 on validation data*, which balances precision and recall rather than optimizing recall alone — this is a deliberate, documented trade-off, not an accident.

### 2.3 Justice (fair distribution of benefits and burdens)

- **Concern:** could the model perform worse for some parts of the network than others, creating "blind spots" that get less protection? This is the subject of the Bias Audit (`11_bias_audit/bias_audit_report.md`), which checks the model's error rates across different traffic-service groups (using the excluded `Dst Port` field only as a post-hoc grouping variable, never as a training feature).
- Only two attack types are represented in the training data (DoS GoldenEye, DoS Slowloris). Segments of a network that mostly see *other* kinds of attacks would not be fairly protected by this specific model — this limitation must be stated clearly to any future SOC that considers adopting it.

## 3. Data handling

- Public dataset only; no re-identification attempts are made or needed.
- Raw data and trained model weights are kept out of Git and versioned with DVC (see Data Management Plan), reducing accidental exposure through the code repository.

## 4. CONCYTEC / UNMSM and Peru Ley 29733 relevance

- This project does not process personal data as defined by Peru's Ley de Protección de Datos Personales (Ley 29733), since the dataset contains flow-level network metadata, not personal identifiers. If a future version of this research incorporates real organizational traffic (with real IP-to-employee mappings), Ley 29733 and the organization's own data policies would apply directly, and a separate data processing agreement would be required before any such stage begins.
- CONCYTEC's general research-ethics guidance on responsible AI research (transparency about limitations, avoiding overstated claims) is followed by explicitly documenting known limitations (Autoencoder instability, single-capture-day scope, two attack types only) rather than only reporting best-case metrics.

## 5. Human oversight statement

This framework is designed to **support**, not replace, SOC analysts. Every automated severity tier maps to a human-executed action with a time budget (SLA), not a fully autonomous response. Any future move toward more autonomous action (e.g., automatic host isolation without human confirmation) would need a separate, more extensive ethics review, given the higher potential for harm from false positives.
