# Paradigm Justification Statement

**Title:** Autonomous Threat Hunting Based on Deep Learning for the Optimization of Incident Response Playbooks in a Security Operations Center

---

## 1. Topic and Context

Most SOCs deal with way too many alerts every day, not enough analysts to check them all, and playbooks that barely change over time. Analysts spend most of their shift on repetitive triage, and real threats can slip through simply because they get lost among hundreds of false positives. This research is about building a Deep Learning model that can hunt threats on its own and help make incident response playbooks more useful and faster to apply.

## 2. Preliminary Research Question

*How can a Deep Learning-based autonomous threat hunting model be designed and evaluated to optimize incident response playbooks in a Security Operations Center, in terms of detection accuracy and response time?*

## 3. Chosen Paradigm and Justification

For this work I am following **Design Science Research (DSR)** (Hevner et al., 2004; Peffers et al., 2007). The reason is straightforward: I am not testing a hypothesis about something that already exists in the world, and I am not trying to understand how people feel or think either. What I am doing is building something — a Deep Learning model — and then checking if it actually works and if it makes incident response better. That is basically the logic behind DSR: design it, build it, test it, learn from it. Philosophically, this connects more with **pragmatism**, because what really matters is whether the solution is useful in practice, not whether it proves some abstract truth.

### Why not the other paradigms

- **Positivism** works with a fixed reality that you can measure and test through relationships that already exist. In my case there is nothing already there to measure — the model has to be built first before anything can be tested.
- **Interpretivism** is about understanding meaning from people's point of view, such as how analysts experience alert fatigue. That is not what I am after; my focus is technical, not about exploring perceptions.
- **Critical/socio-critical paradigm** looks at power relations and pushes for social change. This research stays in the technical side of things; it has nothing to do with ideology or social transformation.
- **Mixed methods**, taken as a paradigm by itself, usually means combining qualitative and quantitative parts together. There is no qualitative part in this study — no interviews, no analysis of discourse — just performance numbers, so calling it mixed methods would not really fit.

## 4. Implications

Using DSR, the study follows a fairly clear path: define the problem, set the objectives, design the model, build a working version of it, test it, and then write up the results (Peffers et al., 2007). What this research really gives, honestly, is the model itself and everything I picked up along the way while building and testing it, not some big theory about people or society. As for the evaluation, it's all numbers — comparing what the model does against the playbooks SOCs already use today, which is pretty much what anyone reviewing this kind of paper would expect to see.

## 5. One Doubt or Tension

The part I am still not fully sure about is **getting access to real data**. DSR works best when you can test the model in a real environment, but pulling actual incident data from a working SOC is difficult because of confidentiality issues. So the evaluation will probably depend on synthetic or publicly available datasets, which brings up a fair question: how close will these results really be to what happens in an actual SOC? That limitation needs to be mentioned clearly in the paper, not hidden.

