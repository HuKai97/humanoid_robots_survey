# 人形机器人 BEV / Occupancy 调研与学习

面向有传统轮式机器人感知经验的工程师，建立兼顾人形机器人行走、导航和操作的空间感知知识体系。

**当前目标：完成可追溯的文献调研、学习路线与复现设计。传感器、计算平台、投稿目标和截止时间均未确定。**

## 每次进入项目

1. 先读本文件，再读 [handoff.md](handoff.md)。
2. 学习从 [related_work/README.md](related_work/README.md) 开始。
3. 开展实验前读 [experiment/evaluation.md](experiment/evaluation.md) 与 [experiment/results.md](experiment/results.md)。

## 工作流及目录

采用 [skJack/research-workflow](https://github.com/skJack/research-workflow) 的文件职责；用户明确要求不下载论文，因此以逐篇 `README.md`、网页原文链接和阅读证据记录替代 `paper.pdf` / `source/`。本项目未安装或执行远程脚本。

| 目录或文件 | 职责 |
|---|---|
| `related_work/` | 总览、逐篇解析、检索记录、学习路线与术语 |
| `复现/` | baseline 计划及未来实际复现报告 |
| `experiment/evaluation.md` | 实验前冻结的数据、指标和可视化协议 |
| `experiment/results.md` | 仅追加真实实验，失败也保留 |
| `dataset.md`、`DataSet/` | 候选数据集与未来数据处理记录 |
| `brainstorm.md` | 当前只记录待验证问题；复现后再形成研究假设 |
| `handoff.md` | 已完成内容、证据边界和下一步 |

## 约定

- 使用 BEV、occupancy、semantic scene completion、TSDF、ESDF、traversability 等标准术语。
- 保留“论文事实”“工程分析”“待验证假设”的边界；汽车、四足或手持相机结果不得称为人形实机证据。
- 标注 arXiv 首发年份与会议年份差异，消歧同名论文。
- 不下载论文 PDF、LaTeX 源码、数据集、权重；后续任务有新授权时再调整。
- 逐篇笔记先给总结，再介绍问题、输入输出、方法、实验、局限及人形迁移价值。
- 引用优先使用论文、作者项目页、官方仓库；没有全文证据不能声称完成全文精读。
- 复现优先于提出创新结论；未运行的实验明确写“未运行”，不填写虚构指标。
- 数据按场景/轨迹等泛化单元划分，避免相邻帧跨训练测试集；在线推理不得使用未来帧。
- 不覆盖已有用户内容；每次结束前更新 handoff。
