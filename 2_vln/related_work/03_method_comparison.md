# 方法对比：先比条件，再比成绩

> 本表归纳所选工作的主要设置；具体版本、训练条件和资料阅读深度见各篇笔记。输入栏特别区分模型输入与整套系统传感器。本文不制作跨基准的成功率排名。

## 从经典方法到视频策略

| 工作 | 要解决的问题 | 主要输入/依赖 | 导航输出或结构 | 与人形的距离 |
|---|---|---|---|---|
| [R2R](papers/2018_r2r/README.md) | 路线指令跟随 | 指令、视觉、图环境可移动连接 | 逐步移动/停止，奠定任务 | 未建模人形身体执行 |
| [Speaker-Follower](papers/2018_speaker_follower/README.md) | 数据增强与语言-路径一致性 | 全景、指令、图候选 | speaker 生成/评分，follower 导航 | 搜索和候选图的代价需考虑 |
| [HAMT](papers/2021_hamt/README.md) | 长历史视觉语言对齐 | 指令、当前与历史全景 | 历史 Transformer、候选动作 | 需处理身体相机变化和实际控制 |
| [DUET](papers/2022_duet/README.md) | 全局探索与局部精细决策 | 指令、局部视觉、在线拓扑 | 全局/局部信息融合选择目标 | 图可达性不等于人形可执行性 |
| [ETPNav](papers/2023_etpnav/README.md) | 连续环境的拓扑导航 | 12 向 RGB-D、模拟器真值位姿等 | 在线拓扑、路点规划与局部执行 | 位姿、全景和控制假设需逐项替换 |
| [VLMaps](papers/2022_vlmaps/README.md) | 文本查询可落到地图位置 | RGB-D 建图、位姿、预建地图 | 视觉语言地图与空间目标规划 | 语义地图可迁移；非人形验证 |
| [LM-Nav](papers/2022_lm_nav/README.md) | 组合预训练模型进行语言导航 | 预先探索的拓扑图、视觉、语言 | 语言地标→图目标→视觉导航 | 真实移动平台；不是无先验人形导航 |
| [NavGPT](papers/2023_navgpt/README.md) | 零样本语言推理导航 | 视觉转文字、历史、图候选 | LLM 选择动作 | 描述遗漏与图环境假设明显 |
| [NavGPT-2](papers/2024_navgpt2/README.md) | 联结 VLM 推理与导航策略 | 图像、指令、拓扑与训练监督 | 视觉语言表征驱动导航策略 | 仍需连续执行和人形控制适配 |
| [NaVid](papers/2024_navid/README.md) | 第一视角视频指令导航 | 高层 RGB 视频；实机另有里程计 | 参数化前进/转向/停止 | 原文 TurtleBot 4；公开权重设置需核对 |
| [Uni-NaVid](papers/2024_uni_navid/README.md) | 统一不同导航任务 | 视频+任务目标；实机局部控制用 LiDAR | 统一动作接口与多任务训练 | 原文 GO2；非双足验证 |
| [VLFM](papers/2023_vlfm/README.md) | 开放词汇物体目标搜索 | RGB-D/位姿、价值图、低层导航 | frontier 选择+目标导航 | Spot 四足；任务是 ObjectNav |
| [OpenVLA](papers/2024_openvla/README.md) | 通用操作 VLA | 图像、指令、机器人操作数据 | 操作动作表示 | 背景阅读，未证明 VLN |

## 物理执行与人形前沿

| 工作 | 关键接口 | 原工作/官方项目证据 | 如何避免过度解读 |
|---|---|---|---|
| [NaVILA](papers/2024_navila/README.md) | 语言导航命令→视觉 locomotion | 四足 Go2；论文含 Booster T1，人形 G1 在项目展示 | 分开记录原论文量化试验与后续视频展示；高/低层输入不同 |
| [NavDP](papers/2025_navdp/README.md) | 局部目标条件→扩散导航轨迹 | 移动机器人，包含 G1 迁移证据 | 是导航执行底座，不单独证明语言指令理解 |
| [StreamVLN](papers/2025_streamvln/README.md) | 流式视频上下文与记忆压缩→导航动作 | 原文 Go2；后续 HumanoidVLN 接入人形仿真 | 3D token pruning 依赖深度/里程计，不能笼统说整系统仅 RGB |
| [VLN-PE](papers/2025_vln_pe/README.md) | VLN 策略→具身控制→物理环境 | H1/G1 等人形仿真；原文实机为 Go2 | 支持人形仿真不等于已做大规模人形实机实验 |
| [JanusVLN](papers/2025_janusvln/README.md) | 语义与空间信息的联合建模 | 原文 Go2；后续人形仿真比较 | 后续 benchmark 成绩不能归为原论文人形实机贡献 |
| [DualVLN / InternVLA-N1](papers/2025_dualvln/README.md) | 慢速语义目标/隐变量→快速局部轨迹 | 原论文含 G1、Go2、Turtlebot4 | 系列内 RGB DualVLN 与 RGB-D NavDP* 不混用；InternNav 是平台 |
| [HumanoidVLN](papers/2026_humanoidvln/README.md) | 跨人形身体/跟踪器/导航模型评测 | 多身体物理仿真；20 episode G1 sim-to-real pilot | 小规模相关性不是普遍转移保证；资源注明待录用后发布 |
| [TANGO](papers/2026_tango/README.md) | 视觉语言→全身参考动作→低层 tracker | G1 全身通行；近期预印本 | 复杂实机障碍使用行为显式指令；代码未核实，规模有限 |

来源与具体数量均在各篇原文链接中。这里的“实机”只说明作者报告过真实机器人测试，不等于本项目已复现。

## 一篇论文的分数只有在这些条件下才可对比

同任务、同场景划分、同输入信息、同训练数据权限、同动作/控制设置、同停止阈值、同推理/搜索预算。若其中一项不同，要在表里显式保留差异，再说结果意味着什么。

尤其注意以下情况：

- 训练使用 R2R+RxR，与仅 R2R 训练后测试 RxR，不是同一泛化问题。
- 模型仅用 RGB，与系统还用深度建图或里程计，描述的是不同层级。
- 在图中选路点、理想动作移动、物理控制器跟踪，执行难度不同。
- 指令要求经过某地标时，终点成功不能完整评价路线遵循。
- 轮式、四足、人形的视角和身体约束不同；需说明实机与仿真归属。

## 对当前学习目标的推荐

先用 **R2R/VLN-CE** 学会任务与评测；用 **ETPNav 与 NaVid** 对照地图路点和视频动作路线；用 **NaVILA、VLN-PE、DualVLN** 理解物理接口；最后读 **HumanoidVLN 与 TANGO**，辨认专属人形身体的问题。推荐是本项目的学习安排，不是论文性能排名。
