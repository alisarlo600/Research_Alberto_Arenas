                                        START
                                           │
                                           ▼
                  Is the publication written in English?
                                           │
                          ┌────────────────┴────────────────┐
                          │                                 │
                         No                               Yes
                          │                                 │
                     EXCLUDE                               ▼
                                                      Published
                                                      2020–2026?
                                                           │
                                   ┌───────────────────────┴───────────────────────┐
                                   │                                               │
                                  No                                              Yes
                                   │                                               │
                              EXCLUDE                                              ▼
                                                                  Peer-reviewed publication?
                                                           (Journal / Conference / Early Access)
                                                                   │
                                           ┌───────────────────────┴────────────────────────┐
                                           │                                                │
                                          No                                               Yes
                                           │                                                │
                                      EXCLUDE                                               ▼
                           Does the TITLE contain at least one PRIMARY concept?
                                           │
 ┌────────────────────────────────────────────────────────────────────────────────────────────┐
 │ Autonomous Threat Hunting │ Incident Response │ Playbooks │ AI │ Deep Learning │ ML │
 │ Security Automation │ SOAR │ MITRE ATT&CK │ CACAO │ Workflow Optimization │
 └────────────────────────────────────────────────────────────────────────────────────────────┘
                                           │
                            ┌──────────────┴───────────────┐
                            │                              │
                           No                             Yes
                            │                              │
                       EXCLUDE                             ▼
                                                    Read ABSTRACT
                                                          │
                                                          ▼
                               Is the study applied to Cybersecurity?
                                                          │
                                   ┌──────────────────────┴───────────────────────┐
                                   │                                              │
                                  No                                             Yes
                                   │                                              │
                              EXCLUDE                                             ▼
                                   Does the study present a technical contribution?
                       (Framework / Algorithm / Architecture / Model / Evaluation)
                                                          │
                                   ┌──────────────────────┴───────────────────────┐
                                   │                                              │
                                  No                                             Yes
                                   │                                              │
                              EXCLUDE                                             ▼
                      Does the study contribute to at least one Research Question?
                                                          │
                    ┌─────────────────────────────────────┼────────────────────────────────────┐
                    │                                     │                                    │
                   Core                             Supporting                          Context
                    │                                     │                                    │
      DL / Threat Hunting /                  SOAR / MITRE ATT&CK /                 SOC / SIEM /
      Incident Response /                    CACAO / Security                      Enterprise
      Playbook Optimization                  Automation                            Security
                    │                                     │                                    │
                    └──────────────────────────────┬───────────────────────────────────────────┘
                                                   │
                                                   ▼
                                         Read FULL TEXT
                                                   │
                                                   ▼
                               Is the methodology sufficiently described?
                                                   │
                              ┌────────────────────┴────────────────────┐
                              │                                         │
                             No                                        Yes
                              │                                         │
                         EXCLUDE                                        ▼
                              Does the study provide empirical validation?
                                                   │
                              ┌────────────────────┴────────────────────┐
                              │                                         │
                             No                                        Yes
                              │                                         │
                           MAYBE                                        ▼
                             Can the study support the proposed
                                  doctoral framework?
                                                   │
                              ┌────────────────────┴────────────────────┐
                              │                                         │
                             No                                        Yes
                              │                                         │
                         EXCLUDE                                 FINAL INCLUDE