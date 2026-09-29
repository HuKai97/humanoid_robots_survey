# 调研范围、证据和 workflow 适配

## 任务与边界

检索截止日期：2026-09-29。任务是帮助零基础学习者了解人形机器人VLA的重要工作，保留中文解析和学习材料。用户要求不下载论文；本轮不下载PDF、LaTeX源码、数据集、模型权重，也没有运行论文实验。

本库为**选择性、分层文献调研**。它覆盖历史基础、通用VLA、人形控制桥梁、人形VLA及数据评测，并加入若干2026前沿工作；不声称穷尽全部论文，也不声称每个最新预印本已获得广泛认可。

## 使用的 workflow

依据 [skJack/research-workflow 的 SKILL.md](https://github.com/skJack/research-workflow/blob/main/SKILL.md) 及其 [模板目录](https://github.com/skJack/research-workflow/tree/main/assets/templates)，本轮读取后重新撰写适合任务的内容，没有运行远程脚本或全局安装skill。

| 原workflow职责 | 本地落点 | 本任务适配 |
|---|---|---|
| 项目总纲 | `AGENTS.md` | 填明零基础学习目标，投稿/截止日期记为未指定 |
| 每篇PDF和源码 | `related_work/papers/<year>_<slug>/README.md` | 按用户要求改成解析与一手链接 |
| baseline复现 | `复现/README.md` | 只建立选择与报告标准，不虚构已复现 |
| 问题讨论 | `brainstorm.md` | 区分用户已知需求和助手候选问题 |
| 标准测评与版本记录 | `experiment/` | 草案状态明确，未运行结果表保持空 |
| 数据与处理说明 | `DataSet/`、`dataset.md` | 标记候选与未下载 |
| 交接 | `handoff.md` | 写明成果、验证与下一步 |

项目名和方向可从用户请求确定；当前是入门调研，不假定投稿会议、deadline或硬件。未知信息不会阻止已授权的文献整理。

## 检索与筛选方式

先从代表性基础工作构建概念链，再沿论文/项目引用追溯与扩展。主要检索组合包括：

- robotics transformer / vision language action / generalist robot policy；
- action chunking / diffusion policy / flow matching / action tokenization；
- humanoid VLA / whole-body / loco-manipulation / teleoperation；
- robot dataset / simulation benchmark / real-to-sim evaluation；
- 2026 + humanoid VLA / foundation model，以及模型系列官方更新。

优先读取 arXiv 摘要或HTML、作者项目、官方代码README、出版机构页面。搜索聚合页用于发现线索，不作为技术结论来源。对项目介绍与论文不一致的规模、标题和开源状态，单独标注版本差异，不自行选一个数字掩盖冲突。

纳入理由：对概念有奠基作用；是可复现路线的代表；与真实人形控制/操作直接相关；或提供关键数据与评测。新预印本可以因高度相关被纳入，但优先级不等同于影响力评价。

## 证据层次

- **论文事实**：原文或官方网页明确给出的机制、设置、结果；尽量就近附链接。
- **作者报告**：实验结论来自作者，尚未由本项目独立复现。
- **教学解释/调研分析**：为初学者重组的流程、推导、比较与建议，不能误当原文实验发现。
- **未核验事项**：代码开放完整性、精确资源要求、某些最新发布内容等，明确标记，不用猜测补齐。

每篇记录本轮读取的是摘要、官方项目、部分HTML还是仓库说明。即便细读若干方法段落，也不称全文精读。无论文的企业发布另列观察文件。

## 索引规则与后续维护

`PAPER_INDEX.md` 面向阅读；`paper_index.json` 保留结构化字段和原文入口；分组 `_registry_*.json` 是本轮整理清单。年份通常按首个arXiv版本；BEHAVIOR-1K按主读2024扩展版本并注明2022/2023历史。学习优先级：P0核心、P1扩展、P2选读或新近跟踪；不是质量打分。

后续新增论文使用 [模板](templates/paper_note.md)，先核对标题/年份/作者/原文与代码关联，再填写方法；更新索引、综述与handoff。不能仅凭标题判断身体形态或VLA输入。

## 局限

本轮没有逐页审查全部附录、消融、完整训练配方和代码实现；网页有访问限制或内容更新风险。没有统一复跑各模型，因此不提供跨平台SOTA排行榜。代码链接存在只代表可访问入口，不证明权重、数据与低层控制器齐全。正式论文引用或准备复现前，应再次按固定原文版本核验相关表格与配置。
