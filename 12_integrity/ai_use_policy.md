# Personal AI Use Policy

**Aligned with the course's Green / Amber / Red AI Tool Use Policy.**

## 1. Purpose

This document states, in advance and in writing, how AI assistance was and will be used across this project, so the commit history and this policy together make that use auditable — as required by §4 of the Capstone Project Brief.

## 2. Classification used in this project

### 🟢 Green — always allowed, acknowledged in a footnote

- Fixing grammar, spelling, and English phrasing in already-written text (the student writes the ideas; AI improves the wording).
- Formatting help: converting notes into Markdown tables, cleaning up code comments, generating boilerplate document structure (headings, checklists).
- Explaining an error message or a library function's syntax (e.g., "what does `nn.BCEWithLogitsLoss(pos_weight=...)` do").
- Summarizing the student's *own* already-executed notebook outputs into prose, without adding new claims not present in those outputs.

**Footnote used in documents:** *"AI assistance (Claude) was used for Green-tier support: language editing, formatting, and summarizing the author's own executed results, per the course AI Use Policy."*

### 🟡 Amber — requires prior approval + a prompt log

- Using AI to help design the *structure* of an analysis (e.g., "what checklist should a reproducibility audit use?") before applying it to this project's own results.
- Using AI to draft a first version of a document like this one, which the student then reviews, corrects, and takes ownership of.
- Getting a second opinion on a methodology choice already decided by the student (e.g., asking whether a chosen bias-audit proxy variable is defensible), without letting the AI make the decision.

**Practice for this tier:** the student keeps a short prompt log (what was asked, what was kept, what was changed) and gets instructor sign-off before submitting content produced this way, per the course policy.

### 🔴 Red — not permitted under any circumstance

- Letting AI invent results, metrics, or citations not actually produced by the student's own pipeline or found in real, checked sources.
- Letting AI make the core methodological or paradigm decisions (e.g., choosing DSR over a case study) — those must be the student's own reasoned choice, as documented in `01_paradigm/paradigm_justification.md` and `02_method/method_fit_matrix.md`.
- Letting AI write the discussion/conclusions sections that interpret what the results *mean* for the research questions — that interpretation must be the student's own.
- Submitting AI output without reading, verifying, and personally standing behind every factual claim in it.

## 3. Concrete commitment for Sessions of this project

- All performance numbers (F1, ROC-AUC, thresholds, playbook severity counts) used in these documents come directly from the student's own executed notebooks (`train_pipeline.ipynb`, `playbook_automation.ipynb`) — not invented by AI. AI assistance was used at the Green/Amber tier to organize, format, and phrase these real numbers into the required document structures.
- Where AI was asked to reference an external paper, the specific paper and its verifiable bibliographic details were checked before being used, and it is flagged in-text if any specific detail could not be independently confirmed.
- Any methodological judgment call (e.g., which proxy variable to use for the bias audit) is stated as a proposal for the student's review and final decision, not as a finished, unquestionable answer.

## 4. Verification

This policy is verifiable through: (a) the Git commit history of this repository, (b) the Amber-tier prompt log kept alongside major drafts, and (c) direct comparison between the numbers reported in these documents and the raw outputs stored in `05_pipeline/` and MLflow.
