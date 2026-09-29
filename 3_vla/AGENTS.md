# 人形机器人 VLA 入门与研究调研

本项目帮助没有机器人/VLA背景的学习者建立知识框架，整理关键文献，再逐步选择可复现基线。当前目标是学习和调研；投稿目标、截止时间、设备与算力尚未指定。

## 每次进入先读

1. 本文件。
2. [handoff.md](handoff.md)。
3. 阅读文献先看 [related_work/README.md](related_work/README.md)；做实验前读 [experiment/evaluation.md](experiment/evaluation.md) 和 [experiment/results.md](experiment/results.md)。

## 组织方式

依据用户指定的 [research-workflow](https://github.com/skJack/research-workflow/blob/main/SKILL.md)，按本任务做适配：

- `related_work/`：中文综述、学习路线、对比表、逐篇解析与来源链接。
- `related_work/papers/<year>_<slug>/README.md`：每篇先总结，再详细介绍。**用户明确要求不下载论文，不创建 PDF 或 LaTeX 源码副本。**
- `复现/`：候选基线和实际复现报告；计划不得写成已完成实验。
- `brainstorm.md`：待检验问题与讨论，最新记录在前，不把候选问题写成已证实创新。
- `experiment/`：预先定义的评测方案、逐次追加的真实结果。
- `DataSet/` 与 `dataset.md`：数据状态与后续处理记录；本轮不下载数据。
- `handoff.md`：当前进度、验证情况、下一步。

## 内容与证据规则

1. 使用标准术语：VLA、VLM、behavior cloning、action chunking、diffusion policy、flow matching、cross-embodiment、whole-body control、sim-to-real、teleoperation。
2. 分清事实、作者报告、解释性推导和待验证假设。论文结论仅适用于相应实验条件。
3. 给事实附一手来源；记录检索日期与阅读深度。网页/摘要调研不得称为全文精读。不可验证的新工作进入待核验清单。
4. 严格区分通用机械臂 VLA、人形上肢操作、移动操作、全身运动控制；没有语言输入的策略不自动算 VLA。
5. 不跨基准直接比较成功率。不编造训练成本、实时频率、复现结果、开源状态或论文元数据。
6. 用户没有要求安装、训练、下载模型或操作硬件。本轮只整理研究文件。
7. 后续先复现可行基线，再检验研究假设。实验前说明改动和原因；版本用 `v<序号>_<方法或改动>`，失败也保留。
8. 按 episode/任务/场景/对象等目标泛化维度划分数据，避免相邻帧泄漏。所有实验按预先冻结的评测协议运行。
9. 收尾更新 handoff；新增文件不得覆盖用户已有工作。
