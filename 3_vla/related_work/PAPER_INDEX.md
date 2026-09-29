# 论文索引与阅读优先级

共 **35 篇**逐篇解析。P0＝核心概念，P1＝扩展，P2＝选读或新近跟踪；不是影响力排名。先从 [学习路线](LEARNING_ROADMAP.md) 中的10篇入口读起，无须一次读完全部P0。

每篇包含总结、详细方法、证据边界、学习问题和一手来源。所有条目未在本地复现；年份按各笔记的首发/主读版本，不等同于会议年份。代码入口存在不等于完整系统开放，实际范围请读笔记。

## 基础与通用策略

| 工作（点开中文解析） | 年份 | 优先级 | 身体/实验范围 | 阅读理由 |
|---|---|---|---|---|
| [RT-1](papers/2022_rt1/README.md) | 2022 | P0 | 轮式移动机械臂 | 语言条件 Transformer 将多任务机器人示范映射为离散动作。 |
| [RT-2](papers/2023_rt2/README.md) | 2023 | P0 | 机械臂 / 移动操作 | 共同微调视觉语言任务与动作token，迁移互联网语义知识到操作。 |
| [PaLM-E](papers/2023_palm_e/README.md) | 2023 | P1 | 移动机械臂 / 桌面操作 / 规划环境 | 连续感知进入语言模型，生成文本决策并连接低层技能。 |
| [SayCan](papers/2022_saycan/README.md) | 2022 | P1 | 轮式移动机械臂；开放演示为桌面仿真 | 结合语言相关性与状态可行性，选择可执行的已有技能。 |
| [Diffusion Policy](papers/2023_diffusion_policy/README.md) | 2023 | P0 | 操作机械臂 / 仿真；原版非语言条件 | 通过观察条件去噪生成连续动作块，并滚动执行。 |
| [ACT / ALOHA](papers/2023_act_aloha/README.md) | 2023 | P0 | 固定双机械臂；原版非语言条件 | ALOHA收集双臂示范，ACT用CVAE动作块与时间集成学习精细操作。 |
| [Open X-Embodiment / RT-X](papers/2023_open_x_embodiment/README.md) | 2023 | P0 | 多种机械臂等数据；RT-X实验为9种操作机器人 | 统一轨迹存储并研究混合机器人数据的正迁移与容量边界。 |
| [Octo](papers/2024_octo/README.md) | 2024 | P0 | 单臂 / 双臂操作 | 模块化输入与小型扩散头支持新观察、动作空间的微调。 |
| [OpenVLA](papers/2024_openvla/README.md) | 2024 | P0 | 机械臂 / 移动操作机器人 | 开放的7B VLA将双视觉编码器与语言骨干接到离散动作输出。 |

## 近期通用 VLA 与相邻路线

| 工作（点开中文解析） | 年份 | 优先级 | 身体/实验范围 | 阅读理由 |
|---|---|---|---|---|
| [π0](papers/2024_pi0/README.md) | 2024 | P0 | 单臂、双臂与轮式移动操作；非双足全身控制 | 预训练视觉语言模型结合流匹配动作专家。 |
| [FAST](papers/2025_fast/README.md) | 2025 | P0 | 跨动作空间操作；非人形全身策略 | 通过DCT与BPE压缩动作块，改善自回归动作学习。 |
| [π0.5](papers/2025_pi05/README.md) | 2025 | P0 | 轮式移动操作、双臂；非双足全身控制 | 异构数据协同训练和语言子任务提升新家庭操作泛化。 |
| [OpenVLA-OFT](papers/2025_openvla_oft/README.md) | 2025 | P0 | 单臂模拟与双臂ALOHA；非双足全身控制 | 并行动作块与连续L1回归构成有效微调基线。 |
| [SmolVLA](papers/2025_smolvla/README.md) | 2025 | P0 | 低成本机械臂/移动操作平台；非双足全身控制 | 小型视觉语言基座、社区数据与异步执行降低研究门槛。 |
| [Gemini Robotics](papers/2025_gemini_robotics/README.md) | 2025 | P1 | ALOHA2、双臂Franka及Apollo上肢适配 | 区分具身推理模型与低层动作VLA，研究泛化和灵巧操作。 |
| [GR00T N1](papers/2025_groot_n1/README.md) | 2025 | P0 | Fourier GR-1人形双臂操作；非本文双足全身验证 | 视觉语言与流匹配双模块结合异构数据进行人形操作学习。 |
| [DreamZero](papers/2026_dreamzero/README.md) | 2026 | P1 | DROID/Franka、AgiBot与YAM操作；非双足全身验证 | 联合预测视频和动作，研究未见动作与跨形态泛化。 |

## 人形控制与人形 VLA

| 工作（点开中文解析） | 年份 | 优先级 | 身体/实验范围 | 阅读理由 |
|---|---|---|---|---|
| [HumanPlus](papers/2024_humanplus/README.md) | 2024 | P0 | 定制33自由度真实双足人形 | 姿态跟踪遥操作收集全身数据，再训练第一视角视觉模仿策略。 |
| [OmniH2O](papers/2024_omnih2o/README.md) | 2024 | P1 | 增强手腕及灵巧手的真实Unitree H1 | 用姿态目标统一遥操作与自主代理接口，提供全身跟踪与示范数据。 |
| [HOVER](papers/2024_hover/README.md) | 2024 | P1 | 19自由度真实Unitree H1与仿真 | 通过命令掩码与教师蒸馏，在同一控制器支持多种身体目标接口。 |
| [HOMIE](papers/2025_homie/README.md) | 2025 | P0 | Unitree G1实机；G1/Fourier GR-1仿真 | 同构外骨骼给上肢目标，RL下肢策略跟踪移动及高度命令。 |
| [HumanVLA](papers/2024_humanvla/README.md) | 2024 | P1 | IsaacGym物理人形角色、球形手；非真机 | 把特权状态RL教师蒸馏成视觉语言条件的物理仿真人形重排策略。 |
| [WholeBodyVLA](papers/2025_wholebodyvla/README.md) | 2025 | P1 | AgiBot X2真实双足人形 | 视频潜在动作预训练结合双臂动作和LMO运动控制；仓库尚未发布方法代码。 |
| [HEX](papers/2026_hex/README.md) | 2026 | P2 | 天工2.0/3.0实机；预训练含多种双足/轮式构型 | 对齐身体状态并预测动态，融合视觉语言生成动作；天工低层控制未开源。 |
| [OpenHLM](papers/2026_openhlm/README.md) | 2026 | P1 | Unitree G1真实双足人形 | 系统研究全关节接口、π0.5预训练与异构共训；高层动作含腿部关节。 |
| [HAF](papers/2026_haf/README.md) | 2026 | P2 | 天工2.0/3.0真实双足人形 | 分阶段flow动作生成加冻结VLA上的低频噪声空间RL适配。 |
| [TANGO](papers/2026_tango/README.md) | 2026 | P2 | 仿真训练与Unitree G1实机零样本导航 | 从仿真合成数据学习语言条件全身穿行，输出29关节加6D根旋转参考。 |

## 数据集与评测

| 工作（点开中文解析） | 年份 | 优先级 | 身体/实验范围 | 阅读理由 |
|---|---|---|---|---|
| [BridgeData V2](papers/2023_bridgedata_v2/README.md) | 2023 | P1 | WidowX 单机械臂 | 用多任务、多环境的真实机械臂轨迹研究数据规模与泛化。 |
| [DROID](papers/2024_droid/README.md) | 2024 | P1 | Franka Panda 单机械臂 | 通过分布式真实场景采集提升机械臂数据的环境多样性。 |
| [LIBERO](papers/2023_libero/README.md) | 2023 | P0 | 仿真机械臂 | 用受控任务集区分空间、对象、目标和综合知识迁移。 |
| [SIMPLER](papers/2024_simpler/README.md) | 2024 | P1 | Google Robot / WidowX 操作评测 | 校准视觉与控制差异，研究仿真评估能否保留真实策略表现和排名。 |
| [RoboCasa](papers/2024_robocasa/README.md) | 2024 | P1 | 仿真移动操作/多形态 | 扩大厨房场景、任务与示范生成，研究仿真数据对通用操作的价值。 |
| [RoboCasa365](papers/2026_robocasa365/README.md) | 2026 | P1 | 仿真家庭移动操作 | 扩大任务与厨房环境覆盖，系统研究通用策略的数据和场景泛化。 |
| [BEHAVIOR-1K](papers/2024_behavior_1k/README.md) | 2024 | P2 | 仿真家庭移动操作；非专属人形 | 围绕人类真实日常需求定义长时程任务与丰富交互仿真。 |
| [SIMPLE](papers/2026_simple/README.md) | 2026 | P1 | 人形全身移动操作；仿真与有限真机验证 | 将接触动力学、视觉渲染、数据生成和人形策略评测连接起来。 |

## 机器可读数据

[paper_index.json](paper_index.json) 保留完整标题、原文、项目、代码入口、阅读深度和本地路径。新近企业/模型更新另见 [RECENT_RELEASES.md](RECENT_RELEASES.md) 与 [HUMANOID_RELEASES.md](HUMANOID_RELEASES.md)，不计入上述论文数。
