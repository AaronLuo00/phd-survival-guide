# Research Workflow

From the New Researcher Handbook, sections 5 ("Research Habits for CS & AI") and 8.4 ("AI Tools for PhD Research").

## Contents
- Daily practices
- Reproducibility (Conda, Docker, checklist)
- Remote servers and HPC (SSH, tmux, data transfer, SLURM, GPUs, etiquette)
- Literature review
- Research idea generation (sources, FIVE+C, pipeline)
- Experiment design
- AI tools for research (Semantic Scholar API, NotebookLM, coding agents)

## Daily practices

- **Version control**: commit code daily with meaningful messages.
- **Documentation**: document code as you write it, not after.
- **Reproducibility**: always set random seeds and log all parameters.
- **Backup**: git plus cloud storage; never trust a single copy.
- **Time**: reserve 2–4 hour deep-work blocks; run experiments overnight or on weekends; write a little every day, even just notes.

## Reproducibility

Three pillars: (1) environment management with exact versions, (2) data and code versioning, (3) documentation clear enough to replicate. Your research is only as good as its reproducibility, including for yourself six months later.

### Conda

```bash
conda create -n myproject python=3.9
conda activate myproject
conda install numpy pandas scikit-learn
pip install special-package          # pip-only packages, inside the env
conda env export > environment.yml
conda env create -f environment.yml
conda env list
conda env remove -n myproject
```

- One project, one environment. Never work in `base`.
- Pin exact versions for anything you publish.
- Re-export `environment.yml` with every dependency change; put setup steps in the README.
- Conda first for scientific packages and complex dependencies (CUDA, MKL); pip as fallback for the latest DL frameworks or niche packages. Always use pip inside a Conda env, never globally.

### Docker

Image = blueprint; container = running instance; Dockerfile = recipe; registry = where images are shared.

```dockerfile
FROM python:3.9-slim
WORKDIR /app
RUN apt-get update && apt-get install -y build-essential git && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "main.py"]
```

```bash
docker build -t myproject:v1 .
docker run -it myproject:v1
docker run -v $(pwd):/app myproject:v1
docker ps -a
docker push username/myproject:v1
```

- **Conda** for local/shared-server work, fast iteration, a team on the same OS.
- **Docker** for production, external collaborators, exact OS-level reproducibility, cross-platform.
- **Both** when reproducibility is critical: published computational research, ML pipelines.

The pre-publication reproducibility checklist is in `checklists.md`.

## Remote servers and HPC

Your laptop is not enough for GPUs, 100GB+ data, parallel runs, and shared group environments.

### SSH

```bash
ssh username@server.example.edu
ssh-keygen -t ed25519 -C "your_email@example.com"
ssh-copy-id username@server.example.edu     # passwordless login

# ~/.ssh/config
Host myserver
    HostName server.example.edu
    User username
    IdentityFile ~/.ssh/id_ed25519
# then: ssh myserver
```

### Everyday commands

| Command | Purpose |
| --- | --- |
| `htop` | CPU and memory per process |
| `nvidia-smi` / `watch -n 1 nvidia-smi` | GPU status |
| `df -h`, `du -sh *` | Disk usage |
| `ps aux \| grep username`, `kill -9 PID` | Find and stop your processes |
| `nohup cmd &` | Survive logout |
| `tmux` / `screen` | Persistent sessions |
| `CUDA_VISIBLE_DEVICES=0,1 python train.py` | Pick GPUs |

### tmux

```bash
tmux new -s experiment      # start
# Ctrl+b then d             # detach; jobs keep running
tmux ls
tmux attach -t experiment
tmux kill-session -t experiment
# after Ctrl+b: c new window, n/p next/prev, % vertical split, " horizontal split
```

### Moving data

```bash
scp local_file.txt username@server:~/remote_path/
rsync -avz --progress local_dir/ username@server:~/remote_dir/   # resumable, compressed
rsync -avz --exclude='*.pyc' source/ dest/
tar -czf data.tar.gz data_folder/      # compress large datasets before transfer
```

### SLURM

```bash
sbatch job_script.sh
squeue -u username
scancel job_id
srun --gres=gpu:1 --mem=32G --time=4:00:00 --pty bash   # interactive GPU session
sinfo
```

```bash
#!/bin/bash
#SBATCH --job-name=my_experiment
#SBATCH --output=logs/%j.out
#SBATCH --error=logs/%j.err
#SBATCH --time=24:00:00
#SBATCH --mem=64G
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
module load python cuda
conda activate myenv
python train.py --config config.yaml
```

### Server etiquette

- **Do**: check resources before running; use the scheduler for long jobs; clean up temp files; document your setup; tell the team about heavy usage.
- **Don't**: run heavy jobs on login nodes; take every GPU without coordinating; keep big datasets in your home directory (use scratch/data); leave zombie processes; hard-code absolute paths in shared code.

### Recommended workflow

Develop locally → small-scale test on the server → estimate memory and time → submit full batch jobs → monitor in tmux → sync results back → clean up failed runs.

## Literature review

- Search Google Scholar, arXiv, and proceedings; use Hugging Face Papers for the latest ML work.
- For each paper note the institution, year, venue, and impact (citations). Prioritize top venues (NeurIPS, ICML, ICLR, ACL, CVPR, AAAI, IJCAI; Nature, Science, JMLR, TPAMI, TACL) and groups with strong records in your area.
- Summarize key ideas, methods, and limitations as you read.

## Research idea generation

Good ideas come from systematic exploration, critical reading, and above all discussion with senior students and peers.

| Source | Strategy |
| --- | --- |
| Senior students | They know what actually works, share unpublished trends, and know the advisor's expectations |
| Literature gaps | Mine "future work" sections; question every "we assume"; analyze where methods fail |
| Cross-pollination | Apply technique X to domain Y; attend talks outside your area; read adjacent fields |
| Group meetings | "What do you wish you had worked on?" "What tools or datasets do you wish existed?" "What is everyone working on that they shouldn't be?" |

**FIVE+C evaluation:** Feasible (with your resources?), Interesting (will the community care?), Novel (different enough from existing work?), Valuable (does it advance the field?), Expertise-aligned (uses your strengths?), +Collaborative (can others contribute, does it build relationships?).

**Red flags:** too incremental; too ambitious (needs ten PhDs); already solved; no evaluation metric; needs resources you can't get.

**Pipeline:** collect continuously (idea journal, weekly peer chats, monthly advisor brainstorm) → filter weekly (peer feedback, check arXiv, rate on FIVE+C) → validate in 2-week sprints (prototype, show seniors, refine).

**Idea exchange:** meet weekly with 3–4 peers; each brings one idea or problem; build on ideas before criticizing; write everything down.

**Lessons:** if 3+ people mention the same problem, investigate it. Execution beats ideas; don't fear "theft." Start imperfect and iterate. When seniors say "avoid this," listen.

## Experiment design

- Start simple with baselines.
- Change one variable at a time.
- Have a clear hypothesis before running anything.
- Record negative results; they are valuable.

## AI tools for research

AI tools are becoming core research infrastructure: they handle the information plumbing so more of your time goes to original thinking.

### Semantic Scholar API (free)

```bash
curl "https://api.semanticscholar.org/graph/v1/paper/search?query=causal+inference+LLM&fields=title,year,authors,citationCount,abstract&limit=10"
curl "https://api.semanticscholar.org/graph/v1/paper/{paper_id}/citations?fields=title,year,authors"
curl "https://api.semanticscholar.org/graph/v1/paper/{paper_id}/references?fields=title,year,authors"
```

Use it for citation snowballing, trend detection (citations per year of a method), baseline hunting (citations + recency), and pulling BibTeX metadata.

### NotebookLM as a source-grounded knowledge base

Answers cite the exact passage from documents you provided, so claims are traceable. Useful patterns: import 20–50 papers and ask cross-paper questions; draft related work ("how does each paper relate to my method?"); compare evaluation protocols across baselines; ask "what problems do these papers leave for future work?"; generate an audio overview for review on the go. It has no public API, so bulk import (100+ URLs), deduplication, and audits need browser automation; an AI agent can orchestrate that.

### AI coding agents

Good for boilerplate (data loading, training loops, evaluation, logging), debugging (CUDA errors, shape mismatches), refactoring for reproducibility, and first drafts of baselines from a paper section.

| Tool | Best for |
| --- | --- |
| Claude Code | Long-horizon, multi-file work in your terminal |
| GitHub Copilot | Inline completion while coding |
| Cursor | Inline suggestions plus chat over local files |
| Gemini in Colab | Notebook-level data exploration |

**Always verify AI-generated code before it reaches a paper:** run it and check outputs, read it line by line, test edge cases (empty batch, single sample, extreme values), and have a labmate review anything central to your results. Use AI to remove tedium, not to outsource thinking. Your name is on the paper.

### Combined workflow

Topic → Semantic Scholar API (candidate list) → NotebookLM (import, dedupe, audit) → AI Q&A (related work, gaps) → coding agent (baselines, experiment setup) → you (original insight, judgment, writing).

The bottleneck in most research is not information access; it's the quality of your questions and the rigor of your experiments.
