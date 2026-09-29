# 调研方法与 research-workflow 适配

## 用户需求与范围

读者有传统轮式机器人感知经验，目前转向人形感知，希望尽量完整建立 BEV/OCC 体系，兼顾行走与操作。传感器、计算平台和截止时间未定。输出保存当前目录，逐篇先总结后详解，不下载论文。

核验日期：2026-09-29。本轮是代表性文献与学习路线调研，不是穷尽性系统综述，也不宣称覆盖每一篇2026新论文。

## 使用的 workflow

已阅读 [README](https://github.com/skJack/research-workflow)、[SKILL.md](https://github.com/skJack/research-workflow/blob/main/SKILL.md)、初始化脚本及 AGENTS/handoff/evaluation/dataset 模板。沿用单文件单职责、进度交接、先复现后研究假设、实验留痕的原则，文档内容按本课题撰写。

| 原workflow职责 | 本项目实现 |
|---|---|
| 项目总纲 | 根 AGENTS.md |
| 进度交接 | 根 handoff.md |
| 文献 | related_work/papers/每篇/README.md 与索引 |
| 复现 | 复现/ 的计划与报告模板 |
| 实验登记和统一测评 | experiment/results.md、evaluation.md |
| 数据管理 | dataset.md、DataSet/README.md |
| 问题讨论 | brainstorm.md |

适配说明：用户要求优先，因此不运行会下载PDF和LaTeX的 fetch-paper.sh；不把未知会议目标和截止时间编入模板；由用户提供的背景和“尽量完整”建立初始项目目标。未安装远程 skill 或执行远程脚本，仅参考其已读内容。

## 检索与纳入标准

按经典种子论文、主来源核验、前后向关联线索、近期人形和室内扩展四步组织。纳入具有方法转折意义、任务或评测代表性、可解释的人形迁移价值的工作。主来源为 arXiv、正式会议/期刊、作者项目页、作者或机构官方仓库。

经典路线覆盖测量融合、BEV投影与注意力、单目SSC、稠密/稀疏/高斯占用、自监督、在线记忆、直接人形与足式占用、语言任务地图、未来预测。2025–2026定向补查直接相关工作。对同质增量方法留扩展入口，避免把论文数量误当知识完整度。

搜索中的博客、聚合页和第三方综述只用于发现候选，最终技术判断回到原始来源。不把未来发布日期、未确认录用、代码承诺写成已实现事实。

## 实际检索记录

- [BEV检索](search_bev.md)：LSS、BEVDet、BEVDepth、BEVFormer、BEVFusion、Simple-BEV、TPVFormer、FIERY。
- [Occupancy检索](search_occupancy.md)：SSCNet、MonoScene、VoxFormer、Occ3D、SurroundOcc、OccFormer、SparseOcc、GaussianFormer、SelfOcc。
- [机器人与人形检索](search_robotics.md)：几何地图、地形、任务接口、人形与足式、2026增补。
- [室内与预测检索](search_indoor.md)：EmbodiedScan、OpenOccupancy、EmbodiedOcc系列、RoboOcc、OccWorld/RoboOccWorld。

## 阅读证据的含义

**方法段已读**：浏览了可访问的HTML正文中的关键方法与实验设置，不意味着逐式推导全部附录或完整复现。

**摘要/项目/文档级**：可核验任务和框架；细节未获取就不补写。OctoMap、SSCNet、OpenOccupancy及部分桥接工作明确保留此边界。

**资源核验**：打开官方入口、检查README和可见目录/发布信息；未下载实际权重/数据，因此不保证下载链路和2026运行环境兼容。

每篇均区分论文事实、学习解释和人形迁移推断。不会把机器人相关题目、宣传演示或作者机构当作实机闭环证据。

## 核验和交付

检查了论文名/版本消歧、摘要与方法对应关系、内部链接、文件覆盖和禁用下载产物。安排了总览与室内八篇的独立交叉审阅。修正齐次坐标符号和一个扩展候选错误链接；检查结果见 QUALITY_CHECK.md。

局限：没有做统一性能复算、完整源码审计、训练或上机；不是正式可提交论文的全量BibTeX库。若后续写学术文章，应按实际引用版本从出版社/arXiv导出正式引用，继续补充全文和原始实验表核验。
