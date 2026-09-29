# 横向对比：方法、身体与证据

本表帮助选择阅读和实验方向，不按论文分数排榜。事实来源和限定条件见每行链接的独立笔记。未在本地运行模型；官方入口不等于公开完整训练链路。

## 动作与知识怎样连接

| 工作 | 核心接口/训练选择 | 学习价值 | 需要避免的误读 |
|---|---|---|---|
| [SayCan](papers/2022_saycan/README.md) | 语言相关性结合技能可行性，选择已有技能 | 规划如何落到能执行的技能 | 语言模型直接控制所有关节 |
| [PaLM-E](papers/2023_palm_e/README.md) | 传感信息进入多模态语言模型，输出文本决策 | 具身理解与技能接口 | 输出文本等于连续动作策略 |
| [RT-1](papers/2022_rt1/README.md) | 图像/语言到离散动作，多任务示范 | 机器人Transformer基础 | 与RT-2的知识迁移方式相同 |
| [RT-2](papers/2023_rt2/README.md) | 预训练VLM共同微调，动作作为token | 语义知识连接动作 | 互联网图片自动教会全新物理技能 |
| [ACT / ALOHA](papers/2023_act_aloha/README.md) | 示范监督动作块，时序集成 | 精细双臂与时间结构 | 原版有语言条件或双足控制 |
| [Diffusion Policy](papers/2023_diffusion_policy/README.md) | 视觉条件下扩散生成动作序列 | 连续、多模态动作分布 | 去噪必然比回归更好 |
| [OXE / RT-X](papers/2023_open_x_embodiment/README.md) | 跨机器人数据混合与模型研究 | 数据标准化和迁移 | 同维度数组就是同一物理动作 |
| [Octo](papers/2024_octo/README.md) | 通用Transformer策略与扩散动作头 | 灵活条件和新任务适配 | 等同于大型VLM骨干VLA |
| [OpenVLA](papers/2024_openvla/README.md) | 开放VLM骨干到离散动作 | 开源微调接口入口 | 原版与OFT是同一推理配方 |
| [π0](papers/2024_pi0/README.md) | VLM与flow-matching动作专家 | 连续动作、多形态预训练 | 动作块长度等于闭环刷新次数 |
| [FAST](papers/2025_fast/README.md) | DCT、量化和BPE编码动作块 | 精度、长度与效率权衡 | tokenizer本身就是完整策略 |
| [π0.5](papers/2025_pi05/README.md) | 异构共同训练、高层子任务与动作 | 未见环境泛化与分层行为 | 原论文和后续开源配方完全一致 |
| [OpenVLA-OFT](papers/2025_openvla_oft/README.md) | 并行连续动作预测等微调设计 | 成功与推理速度共同优化 | forward速度等于完整闭环速度 |
| [SmolVLA](papers/2025_smolvla/README.md) | 较小VLM、动作专家、异步推理 | 资源与系统调度 | 模型小就满足任何控制频率 |
| [Gemini Robotics](papers/2025_gemini_robotics/README.md) | 具身推理与动作模型的系列分工 | 跨任务/身体适配的证据范围 | ER推理模型与动作VLA可互换 |
| [GR00T N1](papers/2025_groot_n1/README.md) | 视觉语言、动作模块与异构数据 | 人形上肢基础策略 | N1已证明后续N1.7的全身能力 |
| [DreamZero](papers/2026_dreamzero/README.md) | 世界动作模型连接未来观察与动作 | 视频生成先验的相邻路线 | 视频合理就保证物理可执行 |

## 人形论文：谁决定身体怎样动

| 工作 | 主要职责与证据 | 与人形VLA的关系 | 复现时先查什么 |
|---|---|---|---|
| [HumanPlus](papers/2024_humanplus/README.md) | 人类动作、全身跟随、自主视觉技能；实机 | 数据与控制桥梁 | 重定向、低层策略与任务示范 |
| [OmniH2O](papers/2024_omnih2o/README.md) | 全身遥操作及技能学习；H1实机 | 采集与控制支持路线 | 目标表示与部署观察 |
| [HOVER](papers/2024_hover/README.md) | 多输入模式全身控制；H1 | 为高层策略提供执行接口 | 输入模式及训练/部署信息 |
| [HOMIE](papers/2025_homie/README.md) | 外骨骼遥操作和移动操作；G1实机 | 数据采集与上下肢协同 | 命令与低层控制的可跟踪性 |
| [HumanVLA](papers/2024_humanvla/README.md) | 语言目标下重排；物理仿真人形 | 全身VLA研究，非真机 | 专家特权信息与手部简化 |
| [WholeBodyVLA](papers/2025_wholebodyvla/README.md) | 潜在动作、双臂与移动命令；X2实机 | 人形移动操作 | 官方尚无方法代码开源时间表 |
| [HEX](papers/2026_hex/README.md) | 身体对齐、状态预测与动作；天工实机 | 跨构型VLA | 低层与采集链路未完整公开 |
| [OpenHLM](papers/2026_openhlm/README.md) | 全身参考交由SONIC跟踪；G1实机 | 接口、预训练和数据消融 | 34维动作、控制器、任务进度 |
| [HAF](papers/2026_haf/README.md) | 分阶段生成和低维RL适配；天工实机 | 身体协调与后训练 | HAF/HAF-VLA版本、得分定义 |
| [TANGO](papers/2026_tango/README.md) | 全身导航参考与跟踪；G1迁移 | 语言导航，非通用抓取 | 数据合成、碰撞与发布状态 |

## 怎么选第一次动手对象

| 目标 | 候选入口 | 最小验证 | 暂不声称的结果 |
|---|---|---|---|
| 理解数据和动作 | ACT / Diffusion Policy | 数据对齐、官方小任务闭环 | 通用语言能力 |
| 接触开放VLA | OpenVLA-OFT + LIBERO；或官方支持的SmolVLA任务 | 固定版本、rollout、动作适配 | 完整预训练复现 |
| 理解真实到仿真评价 | Octo + SimplerEnv支持流程 | 匹配图像与动作，记录失败 | 真机验证 |
| 开始人形接口研究 | OpenHLM / SIMPLE等入口 | 离线字段和低层接口核验，再仿真 | 自动继承原实机数字 |

硬件与算力尚未指定，以上为候选方案。评测约定见 [evaluation.md](../experiment/evaluation.md)；数据与benchmark选型见 [dataset.md](../dataset.md)。
