# Systematic Literature Review

**Project:** Autonomous Threat Hunting Based on Deep Learning for the Optimization of Incident Response Playbooks in a Security Operations Center (SOC)
**Method:** PRISMA 2020 (Preferred Reporting Items for Systematic Reviews and Meta-Analyses)

## 1. Objective

Find and study existing research that connects two topics that are usually studied apart: (1) AI/Deep Learning-based threat hunting, and (2) incident response playbook automation/optimization. The goal is to confirm the research gap already stated in `Protocol.md`: most studies improve threat *detection* OR playbook *automation*, but very few connect both together.

## 2. Search strategy

- **Databases searched:** Scopus, IEEE Xplore, Web of Science.
- **Search terms (title-level):** combinations of *Autonomous Threat Hunting*, *Incident Response Playbooks*, *AI*, *Deep Learning*, *ML*, *Security Automation*, *SOAR*, *MITRE ATT&CK*, *CACAO*, *Workflow Optimization*.
- **Records identified:** 646 total — Scopus: 201, IEEE Xplore: 162, Web of Science: 283.

### 2.1 Boolean search strings (as executed)

**Scopus** — 201 records

```
((incident response) OR (("incident response") AND (playbook OR workflow OR "course of action" OR CACAO))
OR (("incident response") AND (SOAR OR "security orchestration" OR "security automation" OR "response automation"))
OR (("incident response") AND ("deep learning" OR transformer* OR LSTM OR autoencoder*))
OR (("threat hunting" OR "cyber threat hunting"))
OR (("threat hunting") AND ("deep learning" OR "artificial intelligence"))
OR ((ATT&CK OR "MITRE ATT&CK"))
OR (CACAO OR "Collaborative Automated Course of Action Operations"))
```

**Web of Science** — 283 records (Topic search, `TS=`)

```
TS=(("incident response")
OR (("incident response") AND (playbook* OR workflow* OR "course of action" OR CACAO))
OR (("incident response") AND (SOAR OR "security orchestration" OR "security automation" OR "response automation"))
OR (("incident response") AND ("deep learning" OR transformer* OR LSTM OR autoencoder*))
OR ("threat hunting" OR "cyber threat hunting")
OR (("threat hunting") AND ("deep learning" OR "artificial intelligence"))
OR (ATT&CK OR "MITRE ATT&CK")
OR (CACAO OR "Collaborative Automated Course of Action Operations"))
```

**IEEE Xplore** — 162 records (after filters)

```
("incident response"
OR ("incident response" AND (playbook* OR workflow* OR "course of action" OR CACAO))
OR ("incident response" AND (SOAR OR "security orchestration" OR "security automation" OR "response automation"))
OR ("incident response" AND ("deep learning" OR transformer* OR LSTM OR autoencoder*))
OR ("threat hunting" OR "cyber threat hunting")
OR ("threat hunting" AND ("deep learning" OR "artificial intelligence"))
OR (ATT&CK OR "MITRE ATT&CK")
OR (CACAO OR "Collaborative Automated Course of Action Operations"))
```

*Filters applied on IEEE Xplore:* Document type = Conferences, Journals, Early Access Articles, Magazines; Year range = 2020–2026.

### 2.2 Search vocabulary by concept

The three queries above were built by combining terms from the following concept groups (used consistently to keep the three databases comparable):

| Concept | Terms |
|---|---|
| Threat Hunting | threat hunting, cyber threat hunting, proactive threat hunting |
| Incident Response | incident response, response playbook, playbook, workflow, response automation, course of action, CACAO |
| Artificial Intelligence / Deep Learning | deep learning, machine learning, artificial intelligence, transformer, LSTM, autoencoder, neural network, graph neural network, reinforcement learning |
| Security Automation | SOAR, security orchestration, security automation, orchestration, automation |
| Supporting Standards | MITRE ATT&CK, ATT&CK, detection engineering, threat intelligence, cyber threat intelligence |

### 2.3 Topic-based exclusion keywords

During screening, records whose title/abstract centered on the following out-of-domain application areas were flagged for exclusion under **EC1/EC2** (see Section 3): medical, medicine, brain, breast cancer, covid, agriculture, crop, plant disease, wireless sensor, traffic prediction, image segmentation, sentiment analysis, recommendation system, e-learning, education, financial forecasting, stock market, healthcare, clinical.

## 3. Eligibility criteria (Decision Tree)

A study moves forward only if it passes **every** gate below, in this order (see `Decision_Tree.md` for the full flowchart):

1. Written in **English**.
2. Published between **2020 and 2026**.
3. **Peer-reviewed** (journal, conference, or early access) — not a blog post, vendor whitepaper, or non-reviewed preprint.
4. **Title** contains at least one primary concept: Autonomous Threat Hunting, Incident Response Playbooks, AI, Deep Learning, ML, Security Automation, SOAR, MITRE ATT&CK, CACAO, or Workflow Optimization.
5. **Abstract** confirms the study is applied to cybersecurity.
6. The study presents a **technical contribution** (framework, algorithm, architecture, model, or evaluation) — not only opinion or commentary.
7. The study contributes to at least one research question, using this concept map:
   - **Core:** Deep Learning, Threat Hunting, SOAR, MITRE ATT&CK, Playbook Optimization
   - **Supporting:** SOC, SIEM, Incident Response, CACAO, Security Automation, Enterprise Security
   - **Context:** Workflow, Security
8. **Full text** has a sufficiently described methodology.
9. The study provides **empirical validation** (if not, marked "MAYBE" for a second-pass review, not automatically excluded).
10. The study can realistically **support the proposed doctoral framework** → **FINAL INCLUDE**.

### 3.1 Inclusion Criteria (IC)

| Code | Criterion |
|---|---|
| IC1 | The study is written in English. |
| IC2 | Published between 2020 and 2026. |
| IC3 | Peer-reviewed journal article, conference paper, or early access article. |
| IC4 | The study addresses at least one of the primary or supporting research concepts defined in this review (see Section 2.2). |
| IC5 | The proposed method is applied to cybersecurity. |
| IC6 | The study presents a technical contribution (framework, algorithm, architecture, model, or evaluation). |
| IC7 | The study contributes to at least one research question of this review. |

### 3.2 Exclusion Criteria (EC)

| Code | Criterion |
|---|---|
| EC1 | Out of scope (does not address threat hunting, incident response, or security automation). |
| EC2 | Non-cybersecurity application (e.g., the topic-based exclusion keywords in Section 2.3). |
| EC3 | No technical contribution. |
| EC4 | Editorial, book chapter, opinion paper, or tutorial. |
| EC5 | Published before 2020. |
| EC6 | Duplicate publication. |
| EC7 | Full text unavailable. |

*Correspondence with the PRISMA flow (Section 4):* the "Records excluded at screening" and "Reports not retrieved" counts were driven mainly by EC1, EC2, EC4, and EC5; "Reports assessed for eligibility but excluded" (No playbooks / No Deep Learning / No Threat Hunting) reflects failures of IC4 and IC7 specifically.

## 4. PRISMA 2020 flow

*(See `PRISMA_2020_flow_diagram.png` for the visual version of this table.)*

| Stage | n |
|---|---|
| Records identified (Scopus 201 + IEEE Xplore 162 + Web of Science 283) | 646 |
| Duplicate records removed | 16 |
| Records screened | 630 |
| Records excluded at screening | 529 |
| Reports sought for retrieval | 101 |
| Reports not retrieved | 44 |
| Reports assessed for eligibility (full text) | 57 |
| Excluded — No playbooks | 15 |
| Excluded — No Deep Learning | 12 |
| Excluded — No Threat Hunting | 9 |
| **Studies included in review** | **21** |

## 5. Included studies (n = 21) — now with confirmed authors

All 21 citations below were pulled directly from each publisher's own "Cite this" export (IEEE Xplore, MDPI, Elsevier, Hindawi/Wiley, Frontiers), pasted by the author with zero manual retyping -- the safest way to guarantee no transcription error in a document graded partly on integrity. Full formatted citations for every entry are in **Section 8 -- Full Reference List**, numbered to match the `#` column below.

### Cluster A -- Agentic AI / Autonomous & LLM-driven Threat Hunting

| # | Title | Authors | Venue / Year |
|---|---|---|---|
| 1 | Adaptive Zero-Knowledge Threat Hunting Framework (AZTH): A Novel Approach to Secure Threat Detection and Mitigation | Hussein, Hlail, Hussein, Ahmed, Hassan, Satar | IEEE ICBATS 2025 |
| 3 | Agentic AI for Autonomous Cyber Threat Hunting and Adaptive Defense in Dynamic Security Environments | Sheth, Patel, Upadhyay, Ragothaman, Patil, Udayakumar | IEEE eIT 2025 |
| 6 | BTH: Behavior-Based Structured Threat Hunting Framework to Analyze and Detect Advanced Adversaries | Bhardwaj, Kaushik, Alomari, Alsirhani, Alshahrani, Bharany | MDPI *Electronics*, 2022 |
| 13 | Offensive Security: Towards Proactive Threat Hunting via Adversary Emulation | Ajmal, Shah, Maple, Asghar, Islam | IEEE Access, 2021 |
| 16 | iThelma: An Autonomous LLM Agent for Cyber Threat Hunting via Playbook-Driven Intelligence | Chen, Lin, Xie, Lin, Chen | IEEE CNS 2025 |
| 21 | Proactive Threat Hunting in Critical Infrastructure Protection through Hybrid Machine Learning Algorithm Application | Shan, Myeong | MDPI *Sensors*, 2024 |

*This cluster is the closest to this thesis's own topic. Item 16 (iThelma) is the single most directly overlapping paper found -- it explicitly combines an autonomous agent, threat hunting, AND playbook-driven logic in one system, which is exactly the gap this thesis targets. It should be read first and cited prominently in the Related Work section.*

### Cluster B -- LLM / Generative AI for SOC and Security Automation

| # | Title | Authors | Venue / Year |
|---|---|---|---|
| 4 | AI-Augmented SOC: A Survey of LLMs and Agents for Security Automation | Srinivas, Kirk, Zendejas, Espino, Boskovich, Bari, Dajani, Alzahrani | MDPI *J. Cybersecur. Priv.*, 2025 |
| 7 | ChatGPT's Security Risks and Benefits: Offensive and Defensive Use-Cases, Mitigation Measures, and Future Implications | Charfeddine, Kammoun, Hamdaoui, Guizani | IEEE Access, 2024 |
| 10 | Empowering Security Operation Center with Artificial Intelligence and Machine Learning -- A Systematic Literature Review | Khayat, Barka, Adel Serhani, Sallabi, Shuaib, Khater | IEEE Access, 2025 |
| 14 | From ChatGPT to ThreatGPT: Impact of Generative AI in Cybersecurity and Privacy | Gupta, Akiri, Aryal, Parker, Praharaj | IEEE Access, 2023 |
| 17 | Large Language Models for Security Operations Centers: A Comprehensive Survey | Habibzadeh, Feyzi, Atani | Hindawi/Wiley *J. Electrical and Computer Eng.*, 2026 |
| 19 | LLMs for Cybersecurity in the Big Data Era: A Comprehensive Review of Applications, Challenges, and Future Directions | Karras, Theodorakopoulos, Karras, Theodoropoulou, Kalliampakou, Kalogeratos | MDPI *Information*, 2025 |
| 20 | Possibilities and Limitations of Using Large Language Models (LLMs) for Alert Classification and Prioritisation in SOCs | Rieger, Shah, Alam, Hossain | Elsevier *Expert Systems with Applications*, 2026 |

*This is the largest cluster (7 of 21). It shows that most recent literature (2023-2026) has shifted toward LLM/generative-AI-based SOC support, rather than the "classic" supervised Deep Learning (MLP/LSTM/Autoencoder) approach used in this thesis. This is a useful contrast to state explicitly in the thesis discussion: this work stays with classic, interpretable supervised DL, while acknowledging LLM-based agents as a fast-growing, partly overlapping research direction (see especially item 16, iThelma, which bridges both worlds).*

### Cluster C -- Playbooks and Human / Organizational Factors

| # | Title | Authors | Venue / Year |
|---|---|---|---|
| 2 | Adaptive Incident Escalation in SOCs via AI-Driven Skill-Aware Assignment and Tier Optimization | Abuaziz, Celiktas | IEEE Access, 2026 |
| 9 | Do You Play It by the Books? A Study on Incident Response Playbooks and Influencing Factors | Schlette, Empl, Caselli, Schreck, Pernul | IEEE S&P 2024, pp. 3625-3643 |
| 15 | Humans and Automation: Augmenting Security Operation Centers | Tilbury, Flowerday | MDPI *J. Cybersecur. Priv.*, 2024 |

*Item 9 is the most rigorous empirical study in the whole set (1,217 real playbooks analyzed, 147-participant survey, 9 expert interviews). It is direct evidence for a claim already made in `Paradigm.md` and `Protocol.md`: real-world playbooks are inconsistent and organization-specific, which is exactly the problem this thesis's optimization approach is meant to address. Item 2's confirmed keywords ("AI-driven tier optimization," "skill-aware incident assignment," "workload balancing") are conceptually very close to this thesis's own severity-tier playbook design (`playbook_automation.ipynb`) and should also be read closely.*

### Cluster D -- ML/DL Foundations, Explainability, and General AI Cyber Defense

| # | Title | Authors | Venue / Year |
|---|---|---|---|
| 5 | Artificial Intelligence as the Next Frontier in Cyber Defense: Opportunities and Risks | Afolalu, Tsoeu | MDPI *Electronics*, 2025 |
| 8 | Design and Computational Modeling of an AI-Based Automated Cybersecurity Incident Response System | Zhang, Li, Huang, Jing, Zhang, Xia | IEEE Access, 2025 |
| 11 | Enhancing Cybersecurity with Artificial Immune Systems and General Intelligence: A New Frontier in Threat Detection and Response | Falowo, Edinam Botsyoe, Koshoedo, Ozer | IEEE Access, 2024 |
| 12 | Explainable AI: Enhancing Decision-Making in the Detection of Cyber Threats | Prasad, Sayeed, Nguyen, Hutabarat, Mohiuddin | *Frontiers in Computer Science*, 2026 |
| 18 | Leveraging Machine Learning for Cybersecurity Resilience in Industry 4.0: Challenges and Future Directions | Yu, Shvetsov, Hamood Alsamhi | IEEE Access, 2024 |

*Item 12 (Explainable AI) is directly relevant to a limitation already flagged in this thesis's Model Card (`07_model_card/model_card.md`): the MLP/LSTM models used here are not inherently explainable. Item 8's confirmed keywords ("security orchestration (SOAR)," "deep reinforcement learning (DRL)," "LSTM-attention networks") confirm it is specifically about an automated incident-response *system* (not just detection), making it a close comparison point for `playbook_automation.ipynb`.*

## 6. Synthesis: the research gap, confirmed

Across all four clusters, no single paper in this set of 21 does **both** of the following at once:

1. Uses a Deep Learning model trained and evaluated with standard ML metrics (F1, ROC-AUC, multi-seed variance) for autonomous threat hunting, **and**
2. Uses that model's output to drive a structured, tiered **incident response playbook** with defined severity levels and SLAs (the way `playbook_automation.ipynb` does in this thesis).

The closest match, item 16 (iThelma), combines an LLM **agent** with playbook-driven logic, but does not report the kind of quantitative, multi-seed DL benchmarking (MLP vs. LSTM vs. Autoencoder) that this thesis performs. This confirms, with real literature evidence, the gap statement already written in `Protocol.md` Section 4 ("these two research areas are usually studied separately").

## 7. Limitations of this review

- This document reports the search and screening process as executed; it does not certify that every "MAYBE" case in step 9 of the Decision Tree was resolved identically by a second independent reviewer, which PRISMA recommends for full rigor (dual independent screening) -- this is a valid limitation to state in the thesis methodology chapter.
- Citation styles below are mixed (IEEE plain-text for most, MDPI/APA-style for MDPI journals, an Elsevier export for item 20) because each was copied directly from its own publisher's export, exactly as recommended in Section 5.1 of the earlier draft of this document, to avoid transcription errors. Before final thesis submission, run the whole list through a single reference manager (Zotero/Mendeley) to normalize everything into one consistent citation style (APA, IEEE, or whatever the thesis format requires).

## 8. Full Reference List (as exported by each publisher, numbered 1-21)

**[1]** M. I. Hussein, O. S. Hlail, A. I. Hussein, A. A. Ahmed, M. R. Hassan and N. S. M. Satar, "Adaptive Zero-Knowledge Threat Hunting Framework (Azth): a Novel Approach to Secure Threat Detection and Mitigation," 2025 3rd International Conference on Business Analytics for Technology and Security (ICBATS), Dubai, United Arab Emirates, 2025, pp. 1-6, doi: 10.1109/ICBATS66542.2025.11258243.

**[2]** A. Abuaziz and B. Celiktas, "Adaptive Incident Escalation in SOCs via AI-Driven Skill-Aware Assignment and Tier Optimization," in IEEE Access, vol. 14, pp. 56611-56638, 2026, doi: 10.1109/ACCESS.2026.3682449.
keywords: {Payloads;Feeds;Antennas;System-on-chip;Feedback;Application specific integrated circuits;Circuits;Filtering;Recommender systems;Filters;Security operations center (SOC);incident escalation;AI-driven tier optimization;skill-aware incident assignment;workload balancing;large language models},

**[3]** A. Sheth, A. Patel, C. Upadhyay, H. Ragothaman, B. Patil and S. K. Udayakumar, "Agentic AI for Autonomous Cyber Threat Hunting and Adaptive Defense in Dynamic Security Environments," 2025 IEEE International Conference on Electro Information Technology (eIT), Valparaiso, IN, USA, 2025, pp. 316-321, doi: 10.1109/eIT64391.2025.11103697. keywords: {Ethics;Analytical models;Costs;Automation;Telecommunication traffic;Deep reinforcement learning;Threat assessment;Real-time systems;Computer security;Information technology;Machine Learning;Cybersecurity Automation;Agentic AI;Real Time Threat Detection;Deep Reinforcement Learning;Autonomous Threat Hunting},

**[4]** Srinivas, S.; Kirk, B.; Zendejas, J.; Espino, M.; Boskovich, M.; Bari, A.; Dajani, K.; Alzahrani, N. AI-Augmented SOC: A Survey of LLMs and Agents for Security Automation. J. Cybersecur. Priv. 2025, 5, 95. https://doi.org/10.3390/jcp5040095

**[5]** Afolalu, O.; Tsoeu, M.S. Artificial Intelligence as the Next Frontier in Cyber Defense: Opportunities and Risks. Electronics 2025, 14, 4853. https://doi.org/10.3390/electronics14244853

**[6]** Bhardwaj, A.; Kaushik, K.; Alomari, A.; Alsirhani, A.; Alshahrani, M.M.; Bharany, S. BTH: Behavior-Based Structured Threat Hunting Framework to Analyze and Detect Advanced Adversaries. Electronics 2022, 11, 2992. https://doi.org/10.3390/electronics11192992

**[7]** M. Charfeddine, H. M. Kammoun, B. Hamdaoui and M. Guizani, "ChatGPT’s Security Risks and Benefits: Offensive and Defensive Use-Cases, Mitigation Measures, and Future Implications," in IEEE Access, vol. 12, pp. 30263-30310, 2024, doi: 10.1109/ACCESS.2024.3367792. keywords: {Chatbots;Security;Artificial intelligence;Computer security;Ethics;Guidelines;Privacy;Cyberattack;NIST Standards;Watermarking;Artificial intelligence;ChatGPT;computer crime;cyberattack;cyberethics;cybersecurity;defense industry;NLP;privacy},

**[8]** J. Zhang, S. Li, W. Huang, H. Jing, Q. Zhang and X. Xia, "Design and Computational Modeling of an AI-Based Automated Cybersecurity Incident Response System," in IEEE Access, vol. 13, pp. 154383-154394, 2025, doi: 10.1109/ACCESS.2025.3603975.
keywords: {Security;Threat assessment;Computer architecture;Long short term memory;Bayes methods;Real-time systems;Vectors;Protocols;Pipelines;Optimization;Automated incident response;security orchestration (SOAR);deep reinforcement learning (DRL);game-theoretic cybersecurity;LSTM-attention networks},

**[9]** D. Schlette, P. Empl, M. Caselli, T. Schreck and G. Pernul, "Do You Play It by the Books? A Study on Incident Response Playbooks and Influencing Factors," 2024 IEEE Symposium on Security and Privacy (SP), San Francisco, CA, USA, 2024, pp. 3625-3643, doi: 10.1109/SP54263.2024.00060. keywords: {Privacy;Systematics;Shape;Generative AI;Data integrity;Merging;Organizations;Incident Response;Playbook;Security Operations;Threat Intelligence},

**[10]** M. Khayat, E. Barka, M. Adel Serhani, F. Sallabi, K. Shuaib and H. M. Khater, "Empowering Security Operation Center With Artificial Intelligence and Machine Learning—A Systematic Literature Review," in IEEE Access, vol. 13, pp. 19162-19197, 2025, doi: 10.1109/ACCESS.2025.3532951.
keywords: {Artificial intelligence;Computer security;Threat assessment;Systematic literature review;Complexity theory;Organizations;Natural language processing;Medical services;Next generation networking;Monitoring;Artificial intelligence;cybersecurity;cyber threats;healthcare security;incident response;machine learning;neural networks;next-generation SOC;security operation center;threat detection},

**[11]** O. I. Falowo, L. Edinam Botsyoe, K. Koshoedo and M. Ozer, "Enhancing Cybersecurity With Artificial Immune Systems and General Intelligence: A New Frontier in Threat Detection and Response," in IEEE Access, vol. 12, pp. 123811-123822, 2024, doi: 10.1109/ACCESS.2024.3454543.
keywords: {Artificial intelligence;Immune system;Computer security;Artificial general intelligence;Adaptation models;Biological system modeling;Regulation;Artificial general intelligence (AGI);artificial immune system (AIS);cybersecurity;security operations center (SOC);threat detection;incident response;true positives;false positives;cost savings;operational efficiency;government regulation},

**[12]** Prasad PWC, Sayeed MS, Nguyen D-M, Hutabarat DP and Mohiuddin GM (2026) Explainable AI: enhancing decision-making in the detection of cyber threats. Front. Comput. Sci. 8:1762332. doi: 10.3389/fcomp.2026.1762332

**[13]** A. B. Ajmal, M. A. Shah, C. Maple, M. N. Asghar and S. U. Islam, "Offensive Security: Towards Proactive Threat Hunting via Adversary Emulation," in IEEE Access, vol. 9, pp. 126023-126033, 2021, doi: 10.1109/ACCESS.2021.3104260.
keywords: {Security;Emulation;Organizations;Penetration testing;Weapons;Tools;Testing;Offensive security;threat hunting;proactive defense;red teaming;adversary emulation;mitre ATT&CK;threat analysis},

**[14]** M. Gupta, C. Akiri, K. Aryal, E. Parker and L. Praharaj, "From ChatGPT to ThreatGPT: Impact of Generative AI in Cybersecurity and Privacy," in IEEE Access, vol. 11, pp. 80218-80245, 2023, doi: 10.1109/ACCESS.2023.3300381.
keywords: {Chatbots;Artificial intelligence;Computer security;Hidden Markov models;Privacy;Ethics;Switches;Generative adversarial networks;Generative AI;GenAI and cybersecurity;ChatGPT;Google bard;cyber offense;cyber defense;ethical GenAI;privacy;artificial intelligence;cybersecurity;jailbreaking},

**[15]** Tilbury, J.; Flowerday, S. Humans and Automation: Augmenting Security Operation Centers. J. Cybersecur. Priv. 2024, 4, 388-409. https://doi.org/10.3390/jcp4030020

**[16]** N. Chen, R. Lin, D. Xie, H. Lin and S. Chen, "iThelma: An Autonomous LLM Agent for Cyber Threat Hunting via Playbook-Driven Intelligence," 2025 IEEE Conference on Communications and Network Security (CNS), Avignon, France, 2025, pp. 1-6, doi: 10.1109/CNS66487.2025.11195050. keywords: {Adaptation models;Large language models;Natural languages;Buildings;Reinforcement learning;Network security;Cognition;Human in the loop;Autonomous agents},

**[17]** Habibzadeh, Ali, Feyzi, Farid, Atani, Reza Ebrahimi, Large Language Models for Security Operations Centers: A Comprehensive Survey, Journal of Electrical and Computer Engineering, 2026, 3383674, 38 pages, 2026. https://doi.org/10.1155/jece/3383674

**[18]** J. Yu, A. V. Shvetsov and S. Hamood Alsamhi, "Leveraging Machine Learning for Cybersecurity Resilience in Industry 4.0: Challenges and Future Directions," in IEEE Access, vol. 12, pp. 159579-159596, 2024, doi: 10.1109/ACCESS.2024.3482987.
keywords: {Computer security;Fourth Industrial Revolution;Security;Internet of Things;Machine learning;Resilience;Surveys;Unsupervised learning;Neural networks;Industries;ML;cybersecurity;Industry 4.0;cyber resilience;intrusion detection;adversarial attacks},

**[19]** Karras, A.; Theodorakopoulos, L.; Karras, C.; Theodoropoulou, A.; Kalliampakou, I.; Kalogeratos, G. LLMs for Cybersecurity in the Big Data Era: A Comprehensive Review of Applications, Challenges, and Future Directions. Information 2025, 16, 957. https://doi.org/10.3390/info16110957

**[20]** Matthias Rieger, Atif Shah, Abu Alam, Md. Jakir Hossain,
Possibilities and limitations of using large language models (LLMs) for alert classification and prioritisation in security operations centers (SOCs),
Expert Systems with Applications,
Volume 331, Part C,
2026,
133194,
ISSN 0957-4174,
https://doi.org/10.1016/j.eswa.2026.133194.
(https://www.sciencedirect.com/science/article/pii/S0957417426021032)

**[21]** Shan, A.; Myeong, S. Proactive Threat Hunting in Critical Infrastructure Protection through Hybrid Machine Learning Algorithm Application. Sensors 2024, 24, 4888. https://doi.org/10.3390/s24154888
