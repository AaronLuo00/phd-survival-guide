# Communication: Talks, Figures, Writing, and Meetings

From the New Researcher Handbook, sections 2–4, 5.3, 6, and 7.

## Contents
- Core principles
- Presentation structure and slide design
- Presenting experimental results
- Figures and color palettes
- Academic writing
- Weekly updates
- Advisor meetings
- Asking questions in group meetings

## Core principles

- **Clarity above all**: the audience should understand the problem, your approach, and your results and their implications.
- **Consistency**: same formatting, terminology, and structure throughout.
- **Respect your audience**: be prepared, concise, and engaging.

## Presentation structure

1. Title slide (title, name, date, affiliation)
2. Outline
3. Background and motivation: why this matters
4. Problem statement
5. Methodology
6. Results
7. Discussion: what it means
8. Future work
9. Acknowledgments (collaborators, funding)

**Slide design:** 6×6 rule (at most 6 bullets of about 6 words); body text ≥ 24pt, titles ≥ 32pt; high contrast and no red–green pairs; one message per slide.

**Common mistakes:** walls of text; discussing a graph before labeling the axes; jumping to results without setup; fonts unreadable from the back; no rehearsal of timing; answering a different question than the one asked.

## Presenting experimental results

Before any result: explain the experimental setting, define all variables and parameters, state the hypothesis.

Before any figure: say what it shows, describe both axes, read the caption, then point out the key trend.

Always include: dataset (size, source, preprocessing), baselines, metrics, hyperparameters, and statistical significance (error bars, p-values where applicable).

## Figures

Every figure needs a descriptive title, axes labeled with units, a legend if there are multiple series, a caption that explains what is shown, an appropriate scale and range, vector format (PDF/SVG) where possible, and error bars or confidence intervals.

**Color palettes**
- Sequential (ordered data): Blues, Viridis, Cividis
- Diverging (meaningful midpoint): RdBu, PuOr, BrBG
- Categorical: Okabe-Ito (colorblind-safe: `#E69F00 #56B4E9 #009E73 #F0E442 #0072B2 #D55E00 #CC79A7 #000000`), Set1, Dark2

**Multi-subplot consistency:** a model keeps the same color and order in every subplot. If XGBoost is blue in panel 1, it is blue everywhere.

Guide: https://www.simplifiedsciencepublishing.com/resources/best-color-palettes-for-scientific-figures-and-data-visualizations

## Academic writing

Standard structure: abstract (150–250 words), introduction, related work, methodology, experiments, results and discussion, conclusion, references.

- **Clarity over complexity.** Big words don't make better writing; if a simpler word works, use it.
- **Introduce abbreviations smoothly.** Define the full term first, then the abbreviation, woven into the sentence.
  - Bad: "...transforms raw OMOP (Observational Medical Outcomes Partnership) CDM (Common Data Model) data..."
  - Good: "...transforms the CRITICAL data recorded in the Observational Medical Outcomes Partnership Common Data Model (OMOP CDM)..."

## Weekly updates

Structure: **Progress** (what you did), **Challenges**, **Plans** for next week, **Questions** (what help you need).

Keep it to 5–10 slides, show visual evidence of progress, be honest about challenges, and come with specific questions.

## Advisor meetings

Every meeting is a strategic conversation, not a status report.

1. **Define the problem**: the specific question or challenge, why it matters to the project, and the context your advisor needs.
2. **Report what you did**: experiments run, approaches tried, concrete results (plots, tables, code).
3. **What's solved**: problems resolved, insights gained, what works and what doesn't.
4. **What remains unsolved**: where you're stuck and why, what you tried that failed.
5. **Next steps**: concrete plan, how you'll tackle the open problems, timeline.
6. **Discuss actively**: issues to brainstorm, guidance you want, be ready to defend your reasoning, take notes and ask clarifying questions.

**Pitfalls:** vague updates ("still working on it"); hiding problems; passive listening; no agenda; being defensive, or being unable to defend your ideas.

**Prep checklist:** see `checklists.md`.

If progress slipped because of a hard stretch, give one line on your state, then ownership and a plan (see "Explanation vs. excuse" in `productivity-and-wellbeing.md`).

## Asking questions in group meetings

Asking deepens understanding, sparks collaboration, builds critical thinking, shows engagement, helps peers who had the same question, and is practice in communicating research.

| Type | Example questions |
| --- | --- |
| Clarification | "Could you explain what you mean by [term]?" "How does this differ from [concept]?" "Can you walk through that derivation again?" |
| Methodology | "Why this approach?" "Have you considered [alternative]?" "How did you handle [challenge]?" "What are the compute requirements?" |
| Results | "Is this statistically significant?" "How does it compare to the baseline?" "What explains this unexpected outcome?" "Have you tested on [other dataset]?" |
| Broader impact | "How does this relate to [other work]?" "What are the practical applications?" "What are the limitations?" "What ethical considerations apply?" |
| Future work | "What are the next steps?" "How could this extend to [related problem]?" "What would you do differently?" "What's the biggest challenge ahead?" |

## Collaboration basics

Weekly progress reports; ask questions early instead of struggling alone for days; share drafts early; come to meetings with an agenda. For code: request reviews for significant changes, write a README for every project, keep code modular and testable, follow team conventions.
