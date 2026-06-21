# Research Method-Fit Matrix

## 1. Research Question
How can a Deep Learning model help improve the selection and execution of response playbooks in real-time against sophisticated cyberattacks that traditional automated systems often miss, and how well can an autonomous Threat Hunting agent help reduce the Mean Time to Respond (MTTR) for complex incidents while keeping false positives at a reasonable level in a Security Operations Center (SOC)?

## 2. Three Candidate Methods
To find the best way to answer this question, I evaluated three potential research methods:
* **Method 1: Design Science Research (DSR).** Building a practical prototype (a Deep Learning hunting agent combined with a dynamic playbook optimizer) and testing its utility directly in an operational loop.
* **Method 2: Pure Machine Learning Experiment.** Training different neural networks (like LSTMs or Transformers) on static, public datasets and evaluating them purely on statistical metrics like accuracy or recall, without connecting them to actual response playbooks.
* **Method 3: Simulation-Based Research.** Creating a high-level simulation model of a SOC environment to analyze analyst workflows and alert queues under generic automated attack scenarios.

## 3. The E.D.F.C.V. Evaluation Matrix
Using the standard scoring matrix (from 1 to 5 points per criterion), here is how the candidate methods compare:

| Criterion | Key Evaluation Question | Method 1 (Design Science) | Method 2 (ML Experiment) | Method 3 (Simulation) |
|---|---|---|---|---|
| **E - Epistemological Fit** | Does this method match my paradigm's view of what counts as knowledge? | **5 / 5** | 3 / 5 | 3 / 5 |
| **D - Data Availability** | Can I actually get the data this method needs in 3 years? | **5 / 5** | 4 / 5 | 2 / 5 |
| **F - Feasibility** | Time, cost, compute, ethics approval — can I really do this? | **4 / 5** | 5 / 5 | 3 / 5 |
| **C - Contribution Type** | What kind of new knowledge does this method produce? | **5 / 5** | 3 / 5 | 3 / 5 |
| **V - Venue Fit** | Will my target conference / journal accept this method? | **5 / 5** | 4 / 5 | 3 / 5 |
| **TOTAL SCORE** | | **24 / 25** | **19 / 25** | **14 / 25** |

## 4. Defense of the Winner (Method 1)

### Why Design Science Wins
This project is not about just watching or explaining a problem; it is about building a solution for a real-world issue. My research question explicitly asks how to improve how we choose and run playbooks in real-time. This means I need to create something new. Design Science is the only method that perfectly fits this goal because it focuses entirely on utility and creation. It provides a practical way to develop the solution, test it in realistic environments, and understand whether it can help improve incident response in practice.

### Why the Other Options Were Rejected
* **Why not a Pure ML Experiment (Method 2)?** Training a model using a static dataset would be relatively easy to implement and evaluate, which makes it a feasible option. However, the main limitation is that it would mostly provide performance metrics from a controlled dataset. While those results could be useful, they would not fully address the real-time decision making and playbook adaptation that are at the center of this research.

* **Why not Simulation (Method 3)?** Simulations are useful for testing cyberattack scenarios, but they are usually based on assumptions that may not fully reflect real environments. Since attacks can change in unexpected ways, simulations alone may not be enough to show how the solution would perform in practice.

## 5. Summary of the Core Design Loop
By choosing Design Science, the project focuses on a closed loop where the Deep Learning agent constantly processes security data (logs, network flows, and endpoint activity) to find threats. It then feeds this information directly into the dynamic playbook layer to isolate or mitigate the attack instantly. The system evaluates the results of its own actions, creating a smart, adaptive defense mechanism that lowers response times (MTTR) while preventing automated mistakes.
