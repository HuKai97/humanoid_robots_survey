# 人形 VLN 与近期前沿检索记录

检索日期：**2026-09-29**。这是主题定向调研，不宣称覆盖截至此日的所有论文。检索结果仅用于发现；条目事实回到作者论文、项目或代码核查。本次不下载论文 PDF、LaTeX、模型、数据，也不安装环境。项目页若把“arXiv”按钮指向 PDF，不能据此认定存在 arXiv 编号。

## 查询与筛选路径

| 查询组 | 实际使用的关键词示例 | 核查与取舍 |
|---|---|---|
| 直接人形 VLN | `humanoid vision language navigation NaVILA Humanoid VLN 2025 2026` | 找到 NaVILA、HumanoidVLN、TANGO；均打开原始 arXiv 与作者项目入口 |
| 在线记忆 | `StreamVLN robot humanoid navigation arxiv`；`JanusVLN arxiv github humanoid` | 收录 StreamVLN 与 JanusVLN，但二者原作者实机都是 Go2；后续人形适配单独标注 |
| 双系统 | `InternVLA-N1 navigation arxiv humanoid InternNav`；`DualVLN humanoid arxiv navigation` | 通过 InternNav README 确认系列、早期报告、NavDP* 与 DualVLN 配置关系 |
| 物理评测 | `Rethinking the Embodied Gap VLN PE github ICCV 2025` | 用 CVF 核实 ICCV 2025，正文和附录区分人形仿真与四足实机 |
| 局部导航 | `NavDP: Learning Sim-to-Real arxiv` | 收录为必要执行层邻域论文；任务是 PointGoal／无目标探索，不独立解释语言 |
| 全身通行 | `TANGO tango-vla github` | 精确匹配 2026 人形论文；排除另一篇 ICRA 2025 同名 TANGO 的仓库 |
| 扩展邻域 | `HIM Hybrid Internal Model ICLR 2024 github`；`OmniH2O github human humanoid teleoperation` | 一手来源确认主要是locomotion／teleoperation；列为后续背景，未挤占人形 VLN 首轮8篇 |

还检索过 `humanoid language navigation WALK VLM arxiv` 和 `VLN-R1 arxiv humanoid`。前者返回户外社会导航等邻域线索，后者此次未得到足以优先纳入的直接人形证据；这不等于论文不存在或没有价值。首轮以任务匹配、证据可核查、教学连贯性确定范围，未追求模型名数量。

## 最终八个档案

| 档案 | 主要来源 | 人形证据口径 |
|---|---|---|
| [NaVILA](../papers/2024_navila/README.md) | [论文](https://arxiv.org/abs/2412.04453)、[项目](https://navila-bot.github.io/)、[代码](https://github.com/AnjieCheng/NaVILA) | 正文 Booster T1；项目另有 G1；四足 Go2 与仿真 H1 分列 |
| [NavDP](../papers/2025_navdp/README.md) | [论文](https://arxiv.org/abs/2505.08712)、[项目](https://wzcai99.github.io/navigation-diffusion-policy.github.io/)、[代码](https://github.com/InternRobotics/NavDP) | G1实机，任务不是独立VLN |
| [StreamVLN](../papers/2025_streamvln/README.md) | [论文](https://arxiv.org/abs/2507.05240)、[项目](https://streamvln.github.io/)、[代码](https://github.com/InternRobotics/StreamVLN) | 原实机Go2；后续人形仿真 |
| [VLN-PE](../papers/2025_vln_pe/README.md) | [论文](https://arxiv.org/abs/2507.13019)、[项目](https://crystalsixone.github.io/vln_pe.github.io/)、[代码](https://github.com/InternRobotics/InternNav) | 人形仿真；实机补充Go2 |
| [JanusVLN](../papers/2025_janusvln/README.md) | [论文](https://arxiv.org/abs/2509.22548)、[项目](https://miv-xjtu.github.io/JanusVLN.github.io/)、[代码](https://github.com/MIV-XJTU/JanusVLN) | 原实机Go2；后续人形仿真 |
| [DualVLN／InternVLA-N1](../papers/2025_dualvln/README.md) | [DualVLN论文](https://arxiv.org/abs/2512.08186)、[早期项目](https://internrobotics.github.io/internvla-n1.github.io/)、[代码](https://github.com/InternRobotics/InternNav) | 原文实机G1；名称与配置不能混用 |
| [HumanoidVLN](../papers/2026_humanoidvln/README.md) | [论文](https://arxiv.org/abs/2608.12860)、[项目](https://humanoid-vln.github.io/) | 4身体仿真；G1+DualVLN小规模配对试验；资源待录用后开放 |
| [TANGO](../papers/2026_tango/README.md) | [摘要](https://arxiv.org/abs/2609.09158)、[HTML](https://arxiv.org/html/2609.09158v1) | G1全身VLN；复杂场景有明确行为提示；代码状态未核实 |

TANGO 作者项目地址 `https://tango-vla.github.io/tango-vla.github.io` 和根地址本次打开失败；这是访问／证据限制，不推断作者没有项目。已核查HTML正文与附录，所以资料深度不是“仅摘要”；但独立一手内容仍只有原论文。未用第三方中文解析代替原论文证据。

## 对后续综述最重要的核查结果

1. **身体与任务是两条轴**：NavDP有G1实机却不是独立VLN；StreamVLN有VLN但原实机为四足。每篇分别记录任务、模拟身体和真实平台。
2. **平台支持不等于作者所有实验都使用该平台**：VLN-PE支持H1/G1；附录实机为Go2。HumanoidVLN主表的人形比较也不都是实机。
3. **系统模态不等于网络主干模态**：StreamVLN的3D裁剪用depth和odometry；TANGO还用proprioception与运动tracker。RGB主干的标签不能替代整套系统说明。
4. **系列名不等于论文名**：InternNav为工具；InternVLA-N1为系列及早期报告；DualVLN为后续论文和具体RGB配置，另有RGB-D NavDP*配置。
5. **近期工作的限制必须保留**：HumanoidVLN尚待资源发布，其20次配对实验不建立场景级泛化；TANGO复杂实机指令显式指定身体行为，未做相应受控语言消融。
6. **指标先对齐条件再比较**：Flash与physical controller、PointGoal与VLN、仿真碰撞率与实机平均碰撞次数不能合并排名。

## 后续背景入口（本轮不新增详细档案）

- [InternUtopia，原GRUTopia官方代码](https://github.com/InternRobotics/InternUtopia)：物理仿真与场景平台。InternNav官方README明确依赖关系；可在选择实验平台时进一步核查版本。
- [HIM正式摘要](https://proceedings.iclr.cc/paper_files/paper/2024/hash/3c6bd2021c10462c5164638d22f3d5d8-Abstract-Conference.html)：legged locomotion与状态估计背景；不能因被人形系统采用就把原论文写成人形VLN。
- [OmniH2O官方项目](https://omni.human2humanoid.com/)与[代码](https://github.com/LeCAR-Lab/human2humanoid)：人形全身跟踪、遥操作与技能学习背景；语言动作控制演示不自动等于标准路线跟随VLN。

## 复核状态

八篇均已保存“先总结、后详解”的中文笔记和机器可读索引。常规来源至少包含原论文及官方项目／代码；TANGO的独立来源限制已显式记录。首次提交年份与会议年份分列。本文仅为调研，未将作者结果登记为本项目实验，未声称已复现、下载或实机验证。
