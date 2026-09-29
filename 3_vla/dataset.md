# 候选数据与评测环境

**状态：全部为文献层面的候选，本轮未下载、处理或验证任何数据集。**代码/数据可用状态以相应官方版本为准，详细来源在各笔记。

| 资源 | 类型与用途 | 对人形VLA的关系 | 阅读入口 |
|---|---|---|---|
| BridgeData V2 | 真实机械臂轨迹；学习多任务数据 | 数据组织与操作预训练背景 | [笔记](related_work/papers/2023_bridgedata_v2/README.md) |
| DROID | 多场景真实机械臂示范 | 场景泛化；不提供双足动作覆盖 | [笔记](related_work/papers/2024_droid/README.md) |
| Open X-Embodiment | 多来源、多形态数据集合 | 学习混合与跨身体迁移 | [笔记](related_work/papers/2023_open_x_embodiment/README.md) |
| LIBERO | 仿真任务与示范 | 建立受控评测，不覆盖双足稳定 | [笔记](related_work/papers/2023_libero/README.md) |
| SIMPLER | 真实策略的仿真评测环境 | 评测校准方法论 | [笔记](related_work/papers/2024_simpler/README.md) |
| RoboCasa / RoboCasa365 | 家庭操作仿真与数据生成 | 丰富场景、移动操作和长任务 | [原版](related_work/papers/2024_robocasa/README.md)、[365](related_work/papers/2026_robocasa365/README.md) |
| BEHAVIOR-1K | 日常长时程活动与交互仿真 | 定义接近人类需求的任务 | [笔记](related_work/papers/2024_behavior_1k/README.md) |
| SIMPLE | 人形移动操作仿真与数据生成 | 直接连接高层策略与全身控制 | [笔记](related_work/papers/2026_simple/README.md) |

## 实际引入数据时必须补充

版本、许可、来源链接、本地路径、大小、文件校验、episode数、成功/失败比例、机器人和动作语义、相机与标定、时间戳同步、处理代码版本、归一化统计、训练/验证/测试划分。未下载不填“就绪”，没有测量不估算存储大小。

## 划分与泄漏

整个episode不跨划分。依据研究目标按任务、对象实例、场景、采集批次或机器人分组；只有随机帧划分通常无法测试目标泛化。混合 OXE 等集合时检查数据来源重叠，不能把同一轨迹的不同格式副本当成独立数据。测试预训练策略时记录已知预训练数据，不能因为没有本地微调就声称测试任务从未被见过。
