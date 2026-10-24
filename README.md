# 📚 New Researcher Handbook

[![GitHub stars](https://img.shields.io/github/stars/AaronLuo00/phd-survival-guide?style=social)](https://github.com/AaronLuo00/phd-survival-guide)

A practical handbook for new PhD students and early-career researchers, sharing lessons learned to help you avoid common pitfalls and navigate your research journey smoothly. Written by a 4th-year PhD student at Harvard SEAS.

## 🎯 What's Inside

This guide shares practical insights to help you avoid detours and accelerate your research progress:

- **Research Fundamentals** - Core principles, methodology, and best practices
- **Productivity Systems** - Daily habits, time management, and strategic planning
- **Health & Support** - Sleep and movement as infrastructure, friends, and when and how to talk to a counselor
- **Publication Strategy** - Conference targeting, paper writing, and submission timelines
- **Professional Development** - Networking, career planning, and essential resources
- **Resource Channels** - Paper feeds, podcasts, and technical blogs worth your attention
- **Tools & Resources** - Curated software recommendations and research tools
- **AI Skill** - The handbook's core as an installable skill for Claude and other agents ([how to install](#-use-it-as-an-ai-skill))

## 🚀 Quick Start

### 📖 Download the Handbook

Choose the version that suits your preference:

- **📘 With Icons Version** (Enhanced Visual Design): [`new-researcher-handbook.pdf`](new-researcher-handbook.pdf)  
  *Features icons and visual enhancements for better readability*

- **📄 Plain Version** (Classic Format): [`new-researcher-handbook-plain.pdf`](new-researcher-handbook-plain.pdf)  
  *Traditional academic format without icons*

### 🔧 Compile from Source

```bash
git clone https://github.com/AaronLuo00/phd-survival-guide.git
cd phd-survival-guide

# Compile with icons version
pdflatex new-researcher-handbook.tex

# Compile plain version
pdflatex new-researcher-handbook-plain.tex
```

Run each `pdflatex` command two or three times so the table of contents and page numbers settle.

## 🤖 Use It as an AI Skill

The core of the handbook is also packaged as an Agent Skill in [`skills/phd-survival-guide`](skills/phd-survival-guide). Once installed, Claude uses it automatically when you ask about research practice or PhD life, and it can review your slides, figures, weekly updates, and paper plans against the handbook's checklists.

### Claude Code

In a Claude Code session (version 2.1.275 or later):

```text
/plugin install phd-survival-guide --marketplace AaronLuo00/phd-survival-guide
```

On older versions, or from your terminal:

```bash
claude plugin marketplace add AaronLuo00/phd-survival-guide
claude plugin install phd-survival-guide@phd-survival-guide
```

Then just ask, or call it directly with `/phd-survival-guide:phd-survival-guide`.

### Claude app (claude.ai and desktop)

1. Download [`phd-survival-guide.zip`](https://github.com/AaronLuo00/phd-survival-guide/raw/main/dist/phd-survival-guide.zip).
2. In **Settings > Capabilities**, turn on **Code execution and file creation**.
3. In the **Skills** section, click **Upload skill**, choose the zip, and toggle it on.

Custom skills are available on Pro, Max, Team, and Enterprise plans.

### Other agents (Codex, Cursor, and more)

```bash
npx skills add AaronLuo00/phd-survival-guide
```

Or copy the `skills/phd-survival-guide` folder into your agent's skills directory (for Claude Code, `~/.claude/skills/`).

### Things to try

- "Review my group-meeting slides against the presentation checklist."
- "我下周和导师开会，帮我按手册的结构准备一下。"
- "Help me plan a realistic timeline for my next conference submission."
- "I've felt flat for weeks and can't start working. What should I do?"

<details>
<summary>Updating the skill</summary>

After editing anything in `skills/phd-survival-guide`, rebuild the upload zip and validate the plugin:

```bash
rm -f dist/phd-survival-guide.zip
(cd skills && zip -r -X ../dist/phd-survival-guide.zip phd-survival-guide -x '*.DS_Store')
claude plugin validate .
```

</details>

## 📝 Other Useful Guide:

1. A Survival Guide to a PhD by Andrej Karpathy: https://karpathy.github.io/2016/09/07/phd/
2. 当 CEO 重读 PhD：论智慧与勇气 By Yuanming Hu: https://zhuanlan.zhihu.com/p/1893638374646079902
3. 翁家翌：OpenAI，GPT，强化学习，Infra，后训练，天授，tuixue，开源，CMU，清华: https://www.bilibili.com/video/BV1darmBcE4A/
4. figures4papers by Chen Liu: Python scripts and examples for making publication-quality figures for top AI conferences and journals, plus a figure-making skill for AI coding agents: https://github.com/ChenLiu-1996/figures4papers

## 🤝 Contributing

We welcome contributions! Whether you want to:
- Add new sections or update existing content
- Fix errors or improve formatting
- Share tools and resources
- Translate to other languages

Feel free to open issues or pull requests!

## 📧 Contact

- **Author**: Xiaolong Luo (Aaron)
- **Homepage**: https://aaronluo00.github.io/Aaron_Homepage/
- **Email**: xiaolongluo@g.harvard.edu

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=AaronLuo00/phd-survival-guide&type=Date)](https://www.star-history.com/#AaronLuo00/phd-survival-guide&Date)

---

<div align="center">
  <h2>🌟 Helping new PhD students and researchers avoid common pitfalls</h2>
  
  <p>This guide shares practical lessons from a fellow PhD student,<br>
  helping you navigate your research journey smoothly and focus on what truly matters.</p>
  
  <p><strong>If this guide helps you save time and avoid detours in your research, please consider giving us a ⭐ on GitHub!</strong></p>
</div>
