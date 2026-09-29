# 三维与开放词汇语义感知检索记录

检索日期：2026-09-29。本轮目标是建立初学者需要的核心方法链，不宣称穷尽截至该日的所有工作，也不按未经统一核验的性能排名选论文。

本分支只浏览摘要、HTML、官方项目页和官方代码说明；未下载 PDF、LaTeX 源码、数据、模型权重或代码仓库，未运行任何训练/复现。搜索结果自动包含的 PDF 条目没有作为下载任务或主动阅读入口。精确证据深度在每篇笔记中单列。

## 实际检索查询

| 查询 | 用途与筛选结果 |
|---|---|
| `CLIP Learning Transferable Visual Models From Natural Language Supervision arxiv 2103.00020` | 确认视觉语言基础表示的首发年份、题目和官方代码。 |
| `Language-driven Semantic Segmentation LSeg arxiv github` | 初次混合查询未稳定定位官方来源，继续用精确题名搜索。 |
| `"Language-driven Semantic Segmentation" arxiv` | 确认 LSeg arXiv 2201.03546 与官方 `isl-org/lang-seg`。 |
| `OpenScene 3D Scene Understanding with Open Vocabularies arxiv` | 找到 2211.15654；继续浏览作者项目页及仓库。 |
| `VLMaps Visual Language Maps for Robot Navigation arxiv` | 找到 2210.05714、作者项目页与机构技术博客。 |
| `"ConceptFusion" open set multimodal 3D mapping arxiv` | 找到 2302.07241，核验多模态查询与局部全局特征组合。 |
| `"ConceptGraphs" Open-Vocabulary 3D Scene Graphs arxiv` | 找到 2309.16650 和作者图结构建图流程。 |
| `"OpenMask3D" arxiv` | 找到 2306.13631，继续核验作者项目与论文 HTML。 |

## 接受的原始来源与阅读范围

| 工作 | 实际接受的来源 | 核验内容与边界 |
|---|---|---|
| CLIP | [arXiv](https://arxiv.org/abs/2103.00020)、[ICML官方页面](https://proceedings.mlr.press/v139/radford21a.html)、[官方代码](https://github.com/openai/CLIP) | 2021、ICML 2021、图文向量匹配与推理接口；未读全文。 |
| LSeg | [arXiv](https://arxiv.org/abs/2201.03546)、[HTML v2](https://arxiv.org/html/2201.03546v2)、[官方代码](https://github.com/isl-org/lang-seg) | 2022、ICLR 2022；重点读第3节方法及第4节部分设置，确认冻结文本编码器与像素监督；官方库已归档。 |
| OpenScene | [arXiv](https://arxiv.org/abs/2211.15654)、[作者项目](https://pengsongyou.github.io/openscene)、[官方代码](https://github.com/pengsongyou/openscene) | 2022首发、CVPR 2023；二维融合/三维蒸馏/集成三种路线，数据与评估配置；未逐表核验。 |
| VLMaps | [arXiv](https://arxiv.org/abs/2210.05714)、[作者项目](https://vlmaps.github.io/)、[官方代码](https://github.com/vlmaps/vlmaps)、[作者机构博客](https://research.google/blog/visual-language-maps-for-robot-navigation/) | 2022首发、ICRA 2023；RGB-D地图、语言地标索引和导航程序接口；未将后续音频扩展归入原作。 |
| ConceptFusion | [arXiv](https://arxiv.org/abs/2302.07241)、[作者项目](https://concept-fusion.github.io/)、[官方代码](https://github.com/concept-fusion/concept-fusion) | 2023、RSS 2023；局部全局表示、三维融合、多模态查询、UnCoCo与示例；精确权重公式未核验。 |
| ConceptGraphs | [arXiv](https://arxiv.org/abs/2309.16650)、[作者项目](https://concept-graphs.github.io/)、[官方代码](https://github.com/concept-graphs/concept-graphs) | 2023首发、ICRA 2024；对象多视角关联、描述与关系、查询限制；尝试 `https://arxiv.org/html/2309.16650v3` 返回内部错误，未宣称全文阅读。 |
| OpenMask3D | [arXiv](https://arxiv.org/abs/2306.13631)、[HTML v2](https://arxiv.org/html/2306.13631v2)、[作者项目](https://openmask3d.github.io/)、[官方代码](https://github.com/OpenMask3D/openmask3d) | 2023、NeurIPS 2023；重点读第3节方法、第4节实验与局限；确认掩码预训练来源、视角选择、SAM和多尺度裁剪；附录未逐项阅读。 |

## 纳入与排除决策

1. 核心链条为 CLIP → LSeg → OpenScene/VLMaps/ConceptFusion → OpenMask3D → ConceptGraphs。目录编号用于索引，实际阅读时可以将 OpenMask3D 放在 ConceptGraphs 前。
2. 用 OpenMask3D 替代候选 3D Diffuser Actor：本分支重点是感知表示，实例分割填补点级表示和对象图之间的空白；动作扩散策略另属操作/策略线，不因名称含三维就归为感知方法。
3. 搜索出现的聚合站、社区帖子、自动论文总结未作为事实依据。原始作者解释优先，但仍区分作者声称与我们已核验的范围。
4. 搜索出现 VLMaps 后续音频扩展，以及较新的场景图工作。本轮不对其作详细解析；这不是其不重要，而是避免把经典入门线扩成未审查的最新论文清单。
5. 以上七篇均未以本轮证据证明直接人形机器人验证。CLIP/LSeg列为基础支撑，其余列为可迁移方法；机器人示例不自动等于人形示例。

## 后续需要补核验的问题

- 若决定复现，先完整核验目标论文的版本、许可证、数据划分和所有依赖，再冻结评估，不照抄旧环境命令。
- 开放词汇能力不能仅由固定类别 mIoU/AP 判断：补充不存在目标、同义词、属性组合、否定、同类多实例与跨场景测试。
- 多模态查询不等于多传感器状态估计；将传感器输入、几何先验、查询模态和输出分别登记。
- 不使用本文笔记比较未统一设置的 SOTA 数字；后续需要同一数据、同一标签集合、同一掩码和同一位姿条件的公平对照。
