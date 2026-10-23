# Publishing

From the New Researcher Handbook, sections 8.2–8.3. Venue lists and deadlines change every year: verify current dates (for example on https://ccfddl.com/) before giving a timeline.

## Contents
- Venues by field
- Submission timeline
- Quality vs. quantity
- Authorship
- Planning a technical paper
- Writing a survey

## Venues by field

**AI/ML**
- Core ML: NeurIPS, ICML, ICLR
- Vision: CVPR, ICCV, ECCV
- NLP: ACL, EMNLP, NAACL
- General AI: AAAI, IJCAI
- Data mining and web: KDD, WWW

Submission deadlines are typically 4–6 months before the conference.

**Other CS:** databases (SIGMOD, VLDB), systems (OSDI, SOSP), graphics (SIGGRAPH), HCI (CHI, UIST), security (IEEE S&P, CCS, USENIX Security), programming languages (PLDI, POPL).

**AI for Science:** AI4Science workshops at NeurIPS/ICLR/ICML, ML4Physical Sciences (NeurIPS), computational biology workshops (ICML); journals such as Nature Machine Intelligence, Science Robotics, Digital Discovery, npj Computational Materials, Physical Review X; specialized venues such as MLCB, ISMB/ECCB, AIChE.

## Submission timeline

Plan six months ahead; missing a deadline can mean waiting a year.

- **T−6 months**: start experiments and writing
- **T−3 months**: main experiments done
- **T−1 month**: first full draft, get feedback
- **T−1 week**: polish, proofread, prepare supplementary material
- **T−0**: submit

**Set your personal deadline one week early.** You get buffer for polishing, and while others are in panic mode you can offer help, which builds relationships, shows you how others write, and often starts collaborations.

**Double-blind code:** https://anonymous.4open.science/ creates an anonymized copy of a GitHub repo with a stable URL for reviewers.

## Quality vs. quantity

The publication pyramid per year: 1 flagship paper at a top venue; 1–2 solid contributions at specialized venues; 2–3 workshop papers for early ideas.

**Your career will be defined by your best work, not your longest list.** Early "quantity" papers are fine: they teach the review process, build confidence, and establish early credibility. But to stand out for faculty or top industry roles you need representative work: novel ideas or significant improvements, thoroughly validated, a story that resonates, part of your research identity. Start with quantity to build skills, and when ready, invest 6–12 months in a project that could define your trajectory.

## Authorship

First author leads the project and writes most of the paper; contributing authors do significant experiments or sections; advisory authors give guidance. Discuss author order early and document contributions.

## Planning a technical paper

Answer these before writing.

**Core elements**
- What is the core innovation: theory, algorithm, system, application, or analysis/unification of existing methods?
- Can you say in one sentence: "We are the first to solve X important problem"?
- Do you have multi-level contributions (theory + practice; new method + new task; new analysis + new benchmark)?
- Which experiments are must-have comparisons, and which are supporting ablations, case studies, or visualizations? Do you need several benchmarks to show generality? Can you win on efficiency or on a specific setting?

**Strategic questions**
1. *Positioning*: is the topic hot at this venue this year, or oversaturated? Does it match recent sessions, workshops, invited talks?
2. *Innovation*: how is it clearly different from last year's related work (not a simple tweak)? If it combines A+B, is that natural, effective, and insightful? Do you have a unique or counter-intuitive finding?
3. *Method vs. insight*: is it a "reasonable trick," or does it reveal a new phenomenon, structure, or principle? Which framing is strongest: new model, new phenomenon, more general framework? Is a "rethinking X" or "beyond X" framing justified?
4. *Data and task*: are you proposing a representative new benchmark or task? With existing data, is the task definition and metric the right entry point? Is the application motivation compelling ("current models still fail in scenario X")?
5. *Reproducibility and generality*: can others reproduce it easily (crucial at NeurIPS/ICLR)? Does it generalize? Is there enough analysis to support the claims?

**Risk**
- Polish for a mature submission, or submit and iterate? Post on arXiv first to establish priority, or wait?
- Use workshops or posters to get known in the community first?
- Backup venue if rejected (e.g., ICML → NeurIPS → ICLR → domain venue)? How does this paper fit your overall PhD plan?

The paper-planning checklist is in `checklists.md`.

## Writing a survey

A good survey is not a literature dump; it combines information density, structure, and insight.

1. **Fast retrieval and organization**: clear categories, structured tables, systematic summaries, so readers can find relevant work from your figures and tables alone.
2. **Insight and guidance**: which directions are over-studied or neglected, which methods are saturated or immature but promising, what the open problems and controversies are.
3. **An organizing framework**: teach how to organize the field, e.g. a clinical-pathway framework for medical AI, a task × input/output matrix for NLP, backbone vs. head for vision, clear distinctions such as LLM vs. agent systems.
4. **Taxonomy**: clarify ambiguous terms and task definitions (Is diagnosis evaluated like reasoning? Are some SOTA results only prompting tweaks?). This matters most in fast-moving fields like medical LLMs.
5. **Critical perspective**: say which assumptions deserve rethinking, e.g. "most models assume perfectly structured inputs, which rarely exist in clinical settings," or "benchmarks miss the coordination burden that dominates real workflows."

**Pitfalls:** listing papers without synthesis; describing without evaluating; no framework; missing recent work; covering only one approach.
