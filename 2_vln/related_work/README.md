# 人形机器人 VLN：调研入口与论文索引

**从零基础建立 VLN 知识，再进入人形机器人上的导航与执行研究。** 本目录包含 28 个重要工作档案（含基准、指标、两篇综述与一个模型系列档案），每篇先给中文总结，再介绍任务、方法、实验、局限和学习要点。检索日期：2026-09-29。

## 先从这里开始

1. [零基础入门](00_start_here.md)：任务、系统部件与先修知识。
2. [领域综述](01_landscape.md)：经典方法到人形前沿的四条主线。
3. [八周学习路线](02_learning_path.md)：阅读、练习与每阶段完成标准。
4. [方法对比](03_method_comparison.md)：输入、动作、控制与真实机器人的证据边界。
5. [术语表](04_glossary.md)、[数据与平台](../dataset.md)：随读随查。

## 最短重点阅读路线

[R2R](papers/2018_r2r/README.md) → [VLN-CE](papers/2020_vln_ce/README.md) → [ETPNav](papers/2023_etpnav/README.md) → [NaVid](papers/2024_navid/README.md) → [NaVILA](papers/2024_navila/README.md) → [VLN-PE](papers/2025_vln_pe/README.md) → [HumanoidVLN](papers/2026_humanoidvln/README.md) → [TANGO](papers/2026_tango/README.md)。

再补 [DualVLN](papers/2025_dualvln/README.md) 理解异步双系统；用 [nDTW](papers/2019_ndtw/README.md) 学会评价路线遵循。论文出现不懂的模块时回到基础篇，不需要先按年份通读全部。

**P0** 表示核心概念或重点主线；**P1** 表示方法对照/前沿深入；**P2** 表示背景选读。它们是学习优先级，不是论文质量排名。表中年份同时保留必要的首发/发表信息，目录年份仅用于检索，细节以单篇元信息为准。

## 经典 VLN、连续环境与指标

| 工作 | 时间 | 为什么读 | 优先级 |
|---|---|---|---|
| [R2R](papers/2018_r2r/README.md) | 2017 / CVPR 2018 | 任务起点：语言路线和新场景泛化 | P0 |
| [Speaker-Follower](papers/2018_speaker_follower/README.md) | 2018 | 语言与轨迹双向建模、数据增强与搜索 | P1 |
| [nDTW](papers/2019_ndtw/README.md) | 2019 workshop | 路径是否遵循指令；不同于只看终点 | P0 |
| [RxR](papers/2020_rxr/README.md) | 2020 | 多语言与稠密时空对齐数据 | P0 |
| [VLN-CE](papers/2020_vln_ce/README.md) | 2020 | 从预定义导航图进入连续环境 | P0 |
| [HAMT](papers/2021_hamt/README.md) | 2021 | 历史记忆与多模态 Transformer | P1 |
| [DUET](papers/2022_duet/README.md) | 2022 | 全局拓扑与局部观察的联合决策 | P1 |
| [ETPNav](papers/2023_etpnav/README.md) | 2023 / TPAMI 2024 | 在线拓扑规划与连续环境执行 | P0 |

## 语言模型、视频策略与语义导航

| 工作 | 时间 | 为什么读 | 优先级 |
|---|---|---|---|
| [VLMaps](papers/2022_vlmaps/README.md) | 2022 / ICRA 2023 | 把视觉语言特征放入空间地图 | P1 |
| [LM-Nav](papers/2022_lm_nav/README.md) | CoRL 2022 / 论文集2023 | 组合预训练模型与预先探索的拓扑图 | P1 |
| [NavGPT](papers/2023_navgpt/README.md) | 2023 / AAAI 2024 | LLM显式推理和零样本图导航 | P1 |
| [NavGPT-2](papers/2024_navgpt2/README.md) | 2024 | VLM推理与导航策略的衔接 | P1 |
| [NaVid](papers/2024_navid/README.md) | 2024 | 视频到参数化导航动作 | P0 |
| [VLFM](papers/2023_vlfm/README.md) | 2023 / ICRA 2024 | 用语义价值图做物体目标探索 | P1 |
| [Uni-NaVid](papers/2024_uni_navid/README.md) | 2024 / RSS 2025 | 统一多种具身导航任务 | P1 |
| [OpenVLA](papers/2024_openvla/README.md) | 2024 | 操作VLA背景：理解动作表征与任务边界 | P2 |

## 物理执行与人形机器人前沿

| 工作 | 时间 | 为什么读 | 优先级 |
|---|---|---|---|
| [NaVILA](papers/2024_navila/README.md) | 2024 / RSS 2025 | 语言导航与腿式运动控制的桥梁 | P0 |
| [NavDP](papers/2025_navdp/README.md) | 2025 | 可供语言导航调用的局部轨迹底座 | P1 |
| [StreamVLN](papers/2025_streamvln/README.md) | 2025 | 长程视频流与记忆压缩 | P1 |
| [VLN-PE](papers/2025_vln_pe/README.md) | 2025 | 物理身体与视觉差异的评测 | P0 |
| [JanusVLN](papers/2025_janusvln/README.md) | 2025 | 语义与空间信息协作的导航 | P1 |
| [DualVLN / InternVLA-N1](papers/2025_dualvln/README.md) | 2025 / ICLR 2026 | 双系统、异步推理与人形实机 | P0 |
| [HumanoidVLN](papers/2026_humanoidvln/README.md) | 2026-08 | 跨人形形态物理基准；资源待发布 | P0 |
| [TANGO](papers/2026_tango/README.md) | 2026-09 预印本 | 杂乱环境中的语言条件全身通行 | P1 |

## 目标导航基准与综述

| 工作 | 时间 | 为什么读 | 优先级 |
|---|---|---|---|
| [REVERIE](papers/2020_reverie/README.md) | 2019 / CVPR 2020 | 导航之后还要指认正确物体 | P1 |
| [SOON](papers/2021_soon/README.md) | 2021 | 按目标和周边描述自主搜索 | P1 |
| [2024 基础模型 VLN 综述](papers/2024_foundation_models_survey/README.md) | 2024 | 用环境、人类与智能体三方面组织阅读 | P0 |
| [2026 实机评测综述](papers/2026_realworld_survey/README.md) | 2026 / 作者注TASE接收 | 部署差距与比较条件；轮式平台 | P1 |

## 怎样使用每篇笔记

第一轮只读总结；第二轮沿“输入→记忆/地图→决策→执行→评测”阅读；准备复现时再逐项核对原文设置、代码和权重。每篇都说明资料范围，并把作者报告与本调研分析分开；摘要和项目级笔记不标成全文精读。

人形实机、四足/轮式实机、人形物理仿真、纯操作 VLA 分开记录。资源承诺与实际可用性也分开：HumanoidVLN 作者注明待录用后开放，TANGO 代码本次未核实；本项目没有运行任何方法。

## 按 workflow 继续研究

- [复现计划](../复现/README.md) → [复现报告模板](../复现/复现报告模板.md)。
- [评测约定](../experiment/evaluation.md) → [实验结果记录](../experiment/results.md)。
- [待验证问题](../brainstorm.md) → [进度交接](../handoff.md)。
- [检索方法与证据边界](05_search_protocol.md)、[来源目录](sources.md)、[机器可读索引](catalog.json)、[后续论文模板](templates/paper_note.md)。

结构依据 [skJack/research-workflow](https://github.com/skJack/research-workflow)，具体调整见 [workflow 对照](workflow_adaptation.md)。按用户要求未下载论文 PDF/LaTeX，只保存笔记和来源链接。本轮不是全领域穷尽综述，也不声称所有论文已逐公式精读或成功复现。
