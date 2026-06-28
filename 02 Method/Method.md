# Refined Research Question and Method-Fit Matrix

**Title:** Autonomous Threat Hunting Based on Deep Learning for the Optimization of Incident Response Playbooks in a Security Operations Center

---

## Refined Research Question

*How can a Deep Learning-based autonomous threat hunting model be used to optimize incident response playbooks in a Security Operations Center, and how much better do those optimized playbooks perform compared to the traditional rule-based ones?*

I tried to make this one a little better than my first try. Before, I was just asking "how can a model be made and tested," which sounds okay, but it didn't really say what the actual goal was. The real point of this research isn't to build a fast model just for the sake of being fast — it's to use that model to optimize the playbooks themselves. The numbers are just how I prove the playbooks got better after the optimization, not the goal on their own. That distinction matters a lot for how I frame the whole method later on.

---

## Method-Fit Matrix

I looked at three possible methods for this research and scored each one, from 1 to 5, on the five criteria: Epistemological Fit (E), Data Availability (D), Feasibility (F), Contribution Type (C), and Venue Fit (V).

**Research question being tested against:** *How can a Deep Learning-based autonomous threat hunting model be used to optimize incident response playbooks in a Security Operations Center, and how much better do those optimized playbooks perform compared to the traditional rule-based ones?*

| Criterion | A. Design Science Research (build + evaluate the model) | B. Case Study (qualitative study of one SOC) | C. Survey (questionnaire to SOC analysts) |
|---|---|---|---|
| **E · Epistemological Fit**<br>*Pragmatist paradigm chosen earlier* | **5 / 5**<br>Lines up with pragmatism — you learn by building and testing something | **2 / 5**<br>Fits better under interpretivism, not really built to validate a model's performance | **1 / 5**<br>Surveys belong more to attitude/perception research, not artifact testing |
| **D · Data Availability**<br>*Open datasets + simulated SOC environments* | **4 / 5**<br>Open threat intel datasets and simulated SOC setups exist and are usable | **2 / 5**<br>Would need real access inside one SOC, and confidentiality makes that complicated | **2 / 5**<br>Would need a decent number of analysts willing to answer, which is tough on this timeline |
| **F · Feasibility**<br>*Single-author paper, limited timeline* | **5 / 5**<br>Doable on my own — train, test, and compare the model with the compute and data I can actually get | **2 / 5**<br>Only works if a SOC agrees to take part, and that's not something I can guarantee | **2 / 5**<br>Recruiting people, getting ethics clearance, analyzing responses — too much for the time I have |
| **C · Contribution Type**<br>*Optimized playbook, not just opinions* | **5 / 5**<br>Gives an actual optimized playbook plus measurable proof it works better, which is what the question is asking for | **2 / 5**<br>Gives descriptive findings about how one team works, not an optimized playbook | **1 / 5**<br>Gives opinions, not proof that the playbooks actually got better |
| **V · Venue Fit**<br>*Scopus-indexed cybersecurity/AI journals* | **5 / 5**<br>This is exactly what these journals expect — experimental, metrics-based work | **3 / 5**<br>Case studies get published, but they're less common in technical AI security journals | **1 / 5**<br>Survey papers usually end up in human-factors or social-science journals, not the kind I'm targeting |
| **TOTAL** | **★ 24 / 25** | 11 / 25 | 7 / 25 |

Design Science Research wins, and not by a small margin either. But like the matrix says — winning isn't really the point here. What matters is being able to defend each row on its own, not just point at the total and call it a day.

---

## Justified Selection

DSR wins, and not by a little. It's the only one that holds up well on every single criterion.

It fits because I'm not trying to understand feelings or opinions — I'm building something and proving, with numbers, that the playbooks work better because of it. A case study would mean asking people how they feel about their job, and a survey would just give me opinions, not actual proof the playbooks improved.

Data-wise, I can work with open datasets and simulated setups, while getting real SOC data or rounding up enough analysts for a survey just isn't realistic given my timeline. Same with feasibility — I can build and test this on my own, without depending on other people saying yes.

And since what I actually need to show is that the playbooks got better, not how a team feels or what people think, DSR is really the only one that delivers that. It also happens to be exactly the kind of work the journals I'm targeting expect to see.

So it's less that DSR is "the best option" and more that it's the only one without a problem somewhere.

