# 人形机器人 VLA：从零入门的文献库

已整理 **35 篇独立中文解析**，覆盖2022–2026年基础方法、通用VLA、人形控制与VLA、数据集和评测。每篇先给总结，再介绍问题、方法、证据、局限与学习问题。检索截止：**2026-09-29**。

**论文未下载。**本库保存解析和一手来源链接；没有下载论文源码、模型或数据，也没有运行实验。阅读深度逐篇标明，当前是选择性调研，不是全部论文的全文精读或穷尽性综述。

## 第一次从这里开始

1. [入门导读：VLA是什么，人形为什么更难](00_START_HERE.md)
2. [学习路线：八周主线与第一轮10篇入口](LEARNING_ROADMAP.md)
3. [调研综述：按问题串起研究脉络](SURVEY.md)
4. [论文索引：35篇解析与阅读优先级](PAPER_INDEX.md)
5. [横向对比：方法、身体、证据与复现门槛](COMPARISON.md)

遇到术语查 [GLOSSARY.md](GLOSSARY.md)。准备动手时看 [复现入口](../复现/README.md)、[数据与环境](../dataset.md) 和 [评测协议](../experiment/evaluation.md)。

## 文献组织

| 分组 | 数量 | 覆盖 |
|---|---|---|
| 基础与通用策略 | 9 | SayCan、RT-1/2、PaLM-E、ACT、Diffusion Policy、OXE/RT-X、Octo、OpenVLA |
| 近期通用VLA及相邻路线 | 8 | π0、FAST、π0.5、OFT、SmolVLA、Gemini Robotics、GR00T N1、DreamZero |
| 人形控制与人形VLA | 10 | HumanPlus、OmniH2O、HOVER、HOMIE、HumanVLA、WholeBodyVLA、HEX、OpenHLM、HAF、TANGO |
| 数据集与评测 | 8 | BridgeData V2、DROID、LIBERO、SIMPLER、RoboCasa、RoboCasa365、BEHAVIOR-1K、SIMPLE |

系列更新/企业发布另见 [近期模型状态](RECENT_RELEASES.md) 与 [Helix系列观察](HUMANOID_RELEASES.md)，不计入35篇论文。不把企业视频等同于论文实验，不把当前仓库主分支当成历史论文版本。

每篇存为 `papers/<year>_<slug>/README.md`；[paper_index.json](paper_index.json) 保存完整标题、原文、官方入口、分类和本地路径。目录年份通常按首发，BEHAVIOR-1K按本次主读扩展版本并注明历史。

## 学习时最重要的区分

- 通用机械臂VLA、人形上肢操作、双足全身控制与物理仿真人形证据分别看。
- 语言规划、视觉动作策略、全身控制都是相关背景，但不都属于同一类VLA。
- 任务进度、归一化得分和完整成功率不混用；不同benchmark不直接排榜。
- 原文主张、本调研解释和未验证的问题分开；代码入口不代表完整复现条件。

## 如何继续维护

本项目依据你提供的 [research-workflow](https://github.com/skJack/research-workflow/blob/main/SKILL.md) 组织。适配、检索与证据规则见 [METHODOLOGY.md](METHODOLOGY.md)。新增文献用 [笔记模板](templates/paper_note.md)，更新索引后将进度写入 [handoff.md](../handoff.md)。本轮检查见 [QUALITY_CHECK.md](QUALITY_CHECK.md)。
