# 数据、任务和仿真平台

> 截至 2026-09-29：本地没有下载数据、模型、场景或论文。下表是资源调研，不是已安装清单。

## 先分清四种东西

**场景资产**是房屋的图像、网格和标注；**任务数据**是起点、指令、目标和参考路径；**仿真器**负责传感器与运动执行；**评测器**决定如何计算成功。R2R 任务文件不能替代 Matterport3D 场景；有一个 Isaac Sim 人形模型，也不等于已有标准 VLN episode。

## 数据与任务选择

| 名称 | 主要用途 | 优先级 | 对本项目的注意事项 | 一手入口 |
|---|---|---|---|---|
| Matterport3D / MP3D | 经典室内视觉场景 | 高 | 依论文需要不同格式的全景或网格；检查使用条款与申请条件 | [官方](https://niessner.github.io/Matterport/) |
| R2R | 细粒度路径指令导航 | 先学 | 保留官方划分：val_seen 与训练场景重叠，val_unseen/test 与训练场景隔离；图环境与 CE 数据不同 | [官方模拟器与任务](https://github.com/peteanderson80/Matterport3DSimulator) |
| RxR | 多语言、长而丰富的导航指令与对齐轨迹 | 第二阶段 | 记录语言、角色、划分；不能把联合训练写成跨数据零样本 | [官方数据仓库](https://github.com/google-research-datasets/RxR) |
| R2R-CE / RxR-CE | 连续环境指令导航 | 首选复现路线 | 路径转换/过滤、动作、传感器和 Habitat 版本均要匹配 | [VLN-CE](https://github.com/jacobkrantz/VLN-CE) |
| REVERIE | 导航并定位被描述的物体实例 | 扩展 | 到附近与指对物体分开统计；官方存在不同数据版本 | [官方](https://github.com/YuankaiQi/REVERIE) |
| SOON / FAO | 从不同起点按场景描述寻找目标 | 扩展 | 原论文与 challenge 划分需核对；不要只比同名分数 | [官方](https://scenario-oriented-object-navigation.github.io/) |
| HM3D / Gibson 等 | ObjectNav/视觉导航常用场景 | 按任务选 | 场景资产不天然附带 R2R 式语言指令 | [Habitat 场景说明](https://github.com/facebookresearch/habitat-sim/blob/main/DATASETS.md) |
| VLN-PE | 物理身体、视觉和执行差异评测 | 人形阶段 | 分清仿真机器人与原文实机机器人 | [论文](https://arxiv.org/abs/2507.13019) |
| HumanoidVLN | 多个人形形态的物理 VLN 基准 | 前沿跟踪 | 本次核查作者注明资源 upon acceptance；未当作已下载可跑基线 | [项目](https://humanoid-vln.github.io/) |

## 平台选择

| 平台 | 负责什么 | 第一阶段用途 | 版本注意 |
|---|---|---|---|
| Matterport3D Simulator | 图上的观察点与全景导航 | 理解 R2R、经典动作接口 | 经典论文依赖较旧，不先升级全部依赖 |
| Habitat-Sim + Habitat-Lab | 场景/传感器模拟 + 任务/训练/评估 | 跑通 VLN-CE；看 episode 到指标的完整链 | 以所选 baseline 的 commit 和依赖组合为准 |
| Isaac Sim / Isaac Lab | 机器人、传感器、动力学仿真与学习框架 | 后续人形执行与控制研究 | 不同 Isaac Lab 和 Isaac Sim 版本有明确对应关系 |
| GRUTopia / InternNav 相关平台 | 具身场景与导航模型/评测生态 | 按 VLN-PE 或对应模型官方流程接入 | 先核查支持的模型、机器人和数据格式 |

官方入口：[Habitat-Lab](https://github.com/facebookresearch/habitat-lab)、[Habitat-Sim](https://github.com/facebookresearch/habitat-sim)、[Isaac Lab](https://github.com/isaac-sim/IsaacLab)、[GRUTopia / InternUtopia](https://github.com/InternRobotics/InternUtopia)、[InternNav](https://github.com/InternRobotics/InternNav)。本次看到 Habitat-Lab README 声明 v0.3.4 之后 Meta 内部团队不再主动维护；复现时优先保存论文环境，不能据旧教程假设最新版兼容。

## 后续下载后必须记录

每次真正获取资产后追加：来源、获取日期、版本、许可证/授权情况、磁盘位置、校验和、所含 scene IDs、episode 数、过滤/转换过程、不可用样本及原因。还需保存与 baseline 对应的 RGB/深度分辨率、相机高度、FOV、动作步长、导航网格生成参数。

当前没有填写虚构的数据大小、下载命令执行记录或可用状态。可以先用官方小测试场景验证渲染，再申请并准备目标基准所需资产；这只是下一阶段建议。

## 划分原则

使用官方训练/验证/测试集合。新建人形试验时按楼宇/场景隔离，并记录同一场景不同语言改写和不同身体版本的来源关系，防止同一条轨迹改写后跨集合泄漏。细分指标按指令长度、路径长度、转弯数、场景、机器人与相机配置统计；详见 [评测约定](experiment/evaluation.md)。
