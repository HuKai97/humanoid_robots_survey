# research-workflow 的采用与调整

来源：[skJack/research-workflow](https://github.com/skJack/research-workflow)，本次于 2026-09-29 阅读其 [SKILL.md](https://github.com/skJack/research-workflow/blob/main/SKILL.md)、[初始化脚本](https://github.com/skJack/research-workflow/blob/main/scripts/init-project.sh) 和 [文档模板](https://github.com/skJack/research-workflow/tree/main/assets/templates)。未安装到全局技能目录，未执行仓库中的论文抓取脚本；在当前目录按相同职责建立项目文件。

## 与原工作流的对应关系

| 原工作流职责 | 本项目落地 | 当前状态 |
|---|---|---|
| 项目总纲 | 根 `AGENTS.md` | 主题、目标阶段、标准术语与研究规范已写 |
| 上下文交接 | 根 `handoff.md` | 保留完成项、限制和后续第一步 |
| 文献库 | `related_work/papers/<年份_名称>/README.md` | 每篇先总结，再详细介绍，附一手来源与阅读范围 |
| baseline 复现 | `复现/README.md` 与报告模板 | 只做计划；无虚构运行结果 |
| 讨论记录 | 根 `brainstorm.md` | 当前用户目标和复现后要诊断的问题 |
| 评测与结果 | `experiment/evaluation.md`、`results.md` | 拟定评测协议；结果表为空 |
| 数据管理 | `DataSet/`、根 `dataset.md` | 资源说明；未下载数据 |

## 按用户要求作的调整

原 workflow 建议每篇保存 PDF 与 LaTeX source。用户明确要求不用下载论文，因此本次改成链接与原创中文阅读笔记，并标明实际阅读深度。`related_work` 使用原仓库的下划线命名，对应用户所说的 related work 文件夹。

原 workflow 会询问项目名、发表目标和标准术语。本次项目主题已由用户给出，命名为“人形机器人视觉语言导航调研与学习”；领域术语从文献中整理。投稿/时间和资源尚未指定，保留为未定，不编造约束，也不阻塞已授权的调研。

延续其“先文献、后基线复现、再假设与实验”的节奏。当前交付覆盖第一阶段，并为后续阶段准备记录位置；不把学习计划当成已完成复现，不把分析建议当成已经验证的研究创新。

## 本项目新增的学习辅助

零基础入门、领域关系图、八周学习路线、方法条件对比、术语表、检索记录、来源目录与机器可读 catalog 均为此次调研新增，服务于用户此前未做过该方向的背景。原 workflow 没有指定逐篇论文解析模板，本项目根据用户“先总结、后详细介绍”的要求编写了模板。
