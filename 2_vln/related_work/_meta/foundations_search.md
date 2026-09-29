# 基础 VLN 文献检索记录

检索与核查日期：2026-09-29。范围为经典任务、数据、评测与向连续导航过渡的方法。遵循用户要求，仅在线读取摘要、HTML 正文、项目页及代码说明；未保存论文 PDF / LaTeX、数据、权重或代码仓库。下面是实际使用的主要搜索词，部分查询通过一批请求发出。

| 检索词 | 入选与用途 |
|---|---|
| `Vision-and-Language Navigation Interpreting visually-grounded navigation instructions real environments Anderson R2R 2018 github` | 找到 R2R 原论文与作者模拟器，定义经典任务 |
| `Speaker-Follower Models for Vision-and-Language Navigation 2018 github Fried` | 了解全景候选、数据增强、路径搜索 |
| `Room Across Room Multilingual Vision and Language Navigation Dense Spatiotemporal Grounding RxR 2020` | 多语言、长路径、时空对齐数据 |
| `Beyond the Nav-Graph Vision-and-Language Navigation in Continuous Environments 2020 VLN CE` | 核查连续环境任务及官方基线 |
| `History Aware Multimodal Transformer Vision-and-Language Navigation 2021 HAMT github` | 代表性显式历史模型 |
| `DUET Dual-scale Graph Transformer Vision-and-Language Navigation CVPR 2022 github` | 代表性在线拓扑图与双尺度规划 |
| `ETPNav Evolving Topological Planning Vision Language Navigation 2023 2024 github` | 将航点、图与低层控制组合；核实发表年 |
| `nDTW Effective Reliable Evaluation Instruction Following Navigation Agents 2019 github` | 初始题名不精确，转入原论文核对 |
| `site.arxiv.org nDTW Evaluation Navigation 2019 Ilharco` | 定位 arXiv:1907.05446 |
| `ndtw Ilharco github` | 找到 Google Research 出版页，核实为 ViGIL Workshop |
| `site.github.com cshizhe VLN-DUET` / `site.github.com cshizhe VLN-HAMT` | 确认作者实现入口 |
| `site.openaccess.thecvf.com/content_cvpr_2018/html/Anderson_Vision-and-Language_Navigation` | 核实 R2R 正式 CVPR 2018 元数据 |

## 证据选择

最终笔记依据原论文 arXiv HTML、CVF / ECVA / ACL 出版页、作者项目网站与官方 GitHub。搜索结果中的中文博客、DeepWiki、聚合目录、ResearchGate、Reddit 仅作为潜在线索，未用作关键技术结论或数值依据。检索偶尔返回 PDF 结果，但没有主动打开、下载或保存 PDF；详细阅读使用对应 HTML。

八篇均找到可用 arXiv HTML。阅读范围包括任务、方法、实验表和指定附录，笔记写明“关键章节阅读”，没有声称已完整精读、审计全部代码或复现成功。代码链接多数核查至 README；nDTW 的相关实现入口另核查到 VLN-CE `measures.py` 中的 `NDTW` 类。

## 修正与重要边界

1. **R2R 年份：** arXiv:1711.07280 首发于 2017，正式 CVPR 2018；目录以正式发表年命名，并单列首发年。
2. **nDTW 题名与 venue：** 正确主文献为 *General Evaluation for Instruction Conditioned Navigation using Dynamic Time Warping*，2019；[作者机构](https://research.google/pubs/general-evaluation-for-instruction-conditioned-navigation-using-dynamic-time-warping/)标注 NeurIPS ViGIL Workshop，不是 NeurIPS 主会。*On Evaluation of Embodied Navigation Agents* 是 2018 的不同论文。
3. **ETPNav 年份：** 2023-04 首次提交；2024 TPAMI 信息来自作者官方仓库，不以 2022 年挑战赛获奖时间代替发表时间。
4. **VLN-CE 分数版本：** 论文 Table 3 CMA 完整配置 val-unseen SR/SPL=0.32/0.30，当前官方 README Baseline Performance=0.29/0.27。未验证差异原因，已在笔记中明确，未来必须固定版本和 checkpoint。
5. **ETPNav 观测与定位：** 原文 §III 明示 12 向 RGB-D 和 simulator ground-truth pose；没有预先地图不代表没有定位特权信息。
6. **任务不能混同：** R2R、RxR 图导航；VLN-CE 圆柱代理连续环境；DUET 还评估远程目标物体定位。全部均非人形实机 locomotion 论文。

## 没有扩大到完整历史谱系的原因

本批优先提供一条初学者可读的主线：任务 → 数据增强 → 指标 → 多语言路径 → 连续环境 → 记忆 → 图规划 → 连续图规划。EnvDrop、PREVALENT、Recurrent VLN-BERT、CWP、R4R 等可后续补读；未把所有 VLN 方法罗列成同等优先级。这里的遗漏不表示这些工作不重要，也不构成“最完整文献集”的主张。

## 复现状态

仅创建中文笔记与检索元数据。没有安装大型环境、训练、下载论文/数据、评测 checkpoint 或进行实机验证。所有复现步骤和人形迁移问题均是后续计划。
