# Resources and Tools

From the New Researcher Handbook, sections 8.7, 8.8, and Appendix C. Links were checked in October 2026; verify before relying on them.

## Contents
- Essential reading
- Resource channels (papers, podcasts, blogs)
- Other PhD guides
- Software by research stage
- Terminal setup
- Diagram and figure tools
- Resource monitoring and parallel processing

## Essential reading

- **The PhD Grind** by Philip Guo (free: http://linyun.info/phd-grinding.pdf): a candid memoir of a Stanford CS PhD. Start here; read it before or during year one.
- **A PhD Is Not Enough!** by Peter J. Feibelman: building a scientific career after the PhD.
- **Getting What You Came For** by Robert Peters: choosing and succeeding in graduate school, including advisors and mental health.
- **Deep Work** by Cal Newport: focused work in a distracted world.
- **The 7 Habits of Highly Effective People** by Stephen Covey: personal effectiveness and balance.
- **The Illustrated Guide to a PhD** by Matt Might: https://matt.might.net/articles/phd-school-in-pictures/
- **PhD Comics**: https://phdcomics.com/
- **Nature career columns**: https://www.nature.com/nature/articles?type=career-column
- **Academia Stack Exchange**: https://academia.stackexchange.com/

## Resource channels

Information isn't scarce; attention is. A few high-signal channels read at fixed times beat many feeds checked all day. Keep only what you actually use.

**Papers and research news**
- Hugging Face Daily Papers (https://huggingface.co/papers): community-upvoted daily list; a 10-minute morning scan.
- alphaXiv (https://www.alphaxiv.org/): arXiv with discussion threads and a personalized feed.
- Scholar alerts (Semantic Scholar or Google Scholar): follow 10–20 key authors and 3–5 landmark papers; new citations of a landmark paper map where a subfield is moving.
- CCF DDL (https://ccfddl.com/): conference deadlines with AoE countdowns.

**Long-form interviews and podcasts**
- Dwarkesh Podcast (https://www.dwarkesh.com/): long technical interviews with researchers and founders.
- Latent Space (https://www.latent.space/): AI engineering newsletter and podcast on agents, models, infrastructure.
- Training Data by Sequoia (https://sequoiacap.com/trainingdata/): founders and researchers on building AI products.

Read interviews instead of only listening: turn a long video into a transcript with chapters and timestamps using an AI tool, read at your own pace, and jump back to the original for key parts. Keep the concrete examples, not only the conclusions.

**Technical blogs and learning by doing**
- Lil'Log by Lilian Weng (https://lilianweng.github.io/): deep, well-referenced ML surveys.
- Andrej Karpathy's blog (https://karpathy.github.io/): first-principles explanations, including his PhD survival guide.
- Anthropic Engineering (https://www.anthropic.com/engineering): practical write-ups on agents and tooling.
- BlogrXiv (https://openenvision.org/BlogrXiv/site/index.html): curated index of technical AI writing.
- AI Systems Playground (https://schuture.github.io/ai-systems-playground/): interactive labs on LLMs, training, inference, and agents.

## Other PhD guides

- A Survival Guide to a PhD, Andrej Karpathy: https://karpathy.github.io/2016/09/07/phd/
- 当 CEO 重读 PhD：论智慧与勇气, Yuanming Hu: https://zhuanlan.zhihu.com/p/1893638374646079902
- 翁家翌 interview (OpenAI, RL infra, post-training, open source): https://www.bilibili.com/video/BV1darmBcE4A/

## Software by research stage

| Stage | Tools |
| --- | --- |
| Ideas | Notion, Obsidian, a research diary |
| Literature | Zotero, Mendeley, Connected Papers |
| Experiments | Weights & Biases, MLflow, Sacred |
| Writing | LaTeX + Git, Overleaf for collaboration |
| Project management | GitHub Projects, Trello, Asana |
| Visualization | Matplotlib, Seaborn, Plotly |
| Diagrams | Mermaid, PlantUML, Excalidraw |

## Terminal setup (macOS)

iTerm2 + zsh + Oh My Zsh + Powerlevel10k: shows path, time, git status, and conda env by default; tabs and split panes; syntax highlighting and autocompletion.

## Diagram and figure tools

- **Excalidraw** (https://excalidraw.com/): hand-drawn style whiteboard in the browser; quick architecture sketches, flowcharts, group-meeting diagrams; real-time collaboration; export PNG/SVG.
- **PlotNeuralNet** (https://github.com/HarisIqbal88/PlotNeuralNet): LaTeX/TikZ code for publication-quality neural network diagrams. Start from the provided examples and modify them.
- **figures4papers** (https://github.com/ChenLiu-1996/figures4papers): Python scripts for publication-quality paper figures (bar, line, radar, trend, concept plots) from published work at top AI venues, plus a figure-making skill for AI coding agents.

## Resource monitoring and parallel processing

Monitor to find bottlenecks, catch memory leaks, use GPUs fully, and confirm parallelism is working.

- Tools: `htop`, `btop`, `nvtop`, `gpustat -i 1`, `nvidia-smi -l 1`.
- Targets: CPU above 80% across cores when parallelizing; GPU above 90% while training; no swapping; high I/O wait means a data-loading bottleneck.
- Parallelize with `multiprocessing`, `concurrent.futures`, or `joblib`; vectorize NumPy/Pandas instead of looping; use `DataLoader(num_workers=4-8)`.
- Pitfalls: I/O limits parallel gains; the GIL (use processes, not threads, for CPU work); overhead from too many tiny tasks; running out of memory.
- Benchmark before and after; monitor for the whole run; find whether the bottleneck is CPU, GPU, or I/O before optimizing.

```python
from multiprocessing import Pool

def process_func(item):
    return item * 2

with Pool() as p:
    results = p.map(process_func, data_list)
```
