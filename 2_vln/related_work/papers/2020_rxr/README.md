# RxR：更长、更丰富、多语言的路线指令

**论文：** Room-Across-Room: Multilingual Vision-and-Language Navigation with Dense Spatiotemporal Grounding，Alexander Ku 等。**年份：** 2020 首发，EMNLP 2020。**优先级：P0。** 本次范围：论文 HTML 数据采集、路径统计与评测章节；ACL 出版页；官方数据仓库及项目页。未下载数据，未复现基线。

## 先总结

RxR 将 VLN 扩展到英语、印地语和泰卢固语，并把词语与标注者的虚拟相机位姿时间对齐。它强调语言描述的路线，而不只是碰巧到达终点。理解 RxR 能帮助你认识：数据采集协议本身会决定模型学到的能力。[ACL 正式页面](https://aclanthology.org/2020.emnlp-main.356/)

## 背景、输入输出与假设

基本任务仍在 Matterport3D 导航图上运行：给定指令和起点，根据视觉观测输出路径。相较 R2R，采样鼓励更丰富的路径覆盖，包含非最短路径。数据还提供 Guide 和 Follower 的观测—语言对齐信息；这些是可用监督，并不表示测试时可以访问人类的未来视线。[正文 §3–4](https://arxiv.org/html/2010.07954)

**学习解释：** 一个人边走边说“左边是餐桌”，相机当时看到的内容可以帮助定位“餐桌”对应哪个视觉区域。但语言时间戳与机器人未来运行时间不是同一个时钟，训练中的对齐信号不能直接当成部署时的指令进度答案。

## 数据构建与模型思路

Guide 沿指定路线口述指令；另一位 Follower 听指令导航，用其行为检验可跟随性。系统记录文本、语音和虚拟相机位姿之间的联系。论文建立单语、多语及联合 R2R 训练基线，并研究利用人类关注视野的监督。[论文摘要与方法](https://aclanthology.org/2020.emnlp-main.356/)

官方发布把资源分为 guide annotations、follower annotations、pose traces 和 text features；仅 Guide 标注即可构建标准 VLN 任务。[官方数据说明](https://github.com/google-research-datasets/RxR)

## 实验与证据

论文统计 **126,069 条指令、16,522 条 Guide 路径**，三种语言的指令数量大体均衡。路径中 **44.5% 不是起终点之间的最短路径**。因此，单独用最短路效率评价是否忠实跟随指令会遗漏信息。[正文 §3–4、Table 2](https://arxiv.org/html/2010.07954)

**结果解读建议：** 多语言数据多并不自动说明混合训练一定更好；需要按语言和建筑划分报告结果。扩展到中文时，应先确定是直接中文标注、翻译英文，还是机器翻译训练数据，这些条件测试的能力不同。

## 局限与人形关系

**事实边界：** 原始 RxR 是图上导航数据；RxR-Habitat / RxR-CE 是连续环境迁移版本，不能只写“RxR”就混用成绩。官方项目另列 RxR-Habitat 任务。[官方项目](https://ai.google.com/research/rxr/)

**本项目分析：** 人类虚拟相机轨迹能启发人形机器人的主动观察，但它没有真实头部关节速度、躯干稳定或脚步接触信息。若以后研究“边看边走”，必须额外检查相机控制是否会干扰 locomotion。语言较长时也需区分遗忘了旧地标、误解了指令和低层走不到三种失败。

## 初学者阅读与复现准备

先对比 R2R 与 RxR 的一条指令，再阅读 Guide / Follower 流程和 nDTW。后续准备数据时，用 `instruction_id`、场景、语言、split、Guide/Follower 类型建立清单；同一场景和相近路径的不同语言版本不能任意拆进训练与测试集。

练习可先手动把一段指令拆成地标、方向、动作和停止条件，标出存在歧义的位置。复现时从单语、固定划分开始，再增加多语因素，避免一次改变数据、语言编码器和动作空间后无法归因。

## 来源与证据级别

- **正文重点阅读：** [arXiv HTML](https://arxiv.org/html/2010.07954)，§3–5。
- **元数据：** [ACL Anthology](https://aclanthology.org/2020.emnlp-main.356/)，EMNLP 2020。
- **官方资源：** [数据仓库](https://github.com/google-research-datasets/RxR)、[项目页](https://ai.google.com/research/rxr/)，说明级核查。
- 核查日期：2026-09-29。中文扩展、人形迁移与复现建议均为本项目分析。

---

[返回文献总索引](../../README.md) · [方法对比](../../03_method_comparison.md)
