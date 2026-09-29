# R2R：现代室内 VLN 的任务起点

**论文：** Vision-and-Language Navigation: Interpreting Visually-Grounded Navigation Instructions in Real Environments，Peter Anderson 等。**年份：** arXiv 首发 2017；正式发表 CVPR 2018。**优先级：P0。** 本次范围：论文 HTML 的任务、模拟器、模型及评测章节；CVF 发表页；官方仓库 README。属于正文重点章节阅读，尚未逐行审计代码或复现实验。

## 先总结

R2R 把“看图理解指令”变成了一个序列决策任务：智能体执行动作，动作改变它下一步看见的画面。论文提供 Matterport3D Simulator、Room-to-Room 数据集和初始基线。入门时最重要的是理解它的观测、动作和评测协议。[论文与发表信息](https://openaccess.thecvf.com/content_cvpr_2018/html/Anderson_Vision-and-Language_Navigation_Interpreting_CVPR_2018_paper.html)

## 背景与输入输出

论文在真实建筑的全景图像上开展**模拟导航**。每个 episode 给定自然语言指令和起点；智能体连续获取第一人称图像，选择转动视角、移动或 STOP。位置限制在预先采样的视点上，可达邻居由环境图提供。原始基线把动作进一步简化为左、右、上、下、前进和停止。[正文 §3–5](https://arxiv.org/html/1711.07280)

**学习解释：** “到客厅窗边停下”同时要求识别客厅、理解相对位置、记住已走路段，以及判断是否该停止。与图像分类不同，早一步走错会使下一帧观测也发生改变；这就是闭环决策困难的来源。先把一次 episode 写成“指令 → 图像 → 动作 → 新图像”的表，比直接读网络公式更容易建立直觉。

## 方法怎样工作

基线用 LSTM 编码语言；另一循环网络接收当前图像特征和上一动作，通过 attention 读取指令，预测下一动作。训练讨论了沿专家动作运行与采样模型动作运行两种方式。数据按建筑划分已见和未见环境，以检验场景泛化。[正文 §5](https://arxiv.org/html/1711.07280)

**学习解释：** teacher forcing 可以理解为老师始终带路；student forcing 则让模型自己走，再针对当前位置获得监督。前者容易让训练轨迹很整齐，却不能自动保证模型走错后会恢复。阅读后续 DAgger、强化学习和自纠错方法时，始终保留这个问题。

## 实验与证据

R2R 包含 **7,189 条路径、21,567 条指令**；原始成功条件为终点到目标的图最短路距离 **小于 3 米**。论文专门比较已见和未见环境，说明记住训练建筑不足以解决任务。这里记录数据和协议，不把原始分数与后续全景动作模型直接排序。[正文 §4 与 §6](https://arxiv.org/html/1711.07280)

## 局限与人形机器人的关系

**事实边界：** 图上的可达移动省去了视点之间的低层执行；这篇论文没有人形机器人实机 VLN 证据。

**本项目分析：** 人形机器人必须把同样的语言意图变成可执行运动，还要处理相机晃动、定位误差、身体宽度和足步可行性。即使导航图里存在楼梯边，也不代表机器人已经学会上下楼。R2R 适合训练对任务的理解和高层导航研究，不能独立证明人形部署能力。后续阅读应衔接 VLN-CE，检查哪些 oracle 信息被移除了。

## 初学者阅读与复现准备

先阅读 §3.2 动作空间、§4.4 评测，再看 §5 模型。官方仓库提供模拟器接口、R2R 基线和评测入口；本次只查阅说明，未安装或下载数据。[官方仓库](https://github.com/peteanderson80/Matterport3DSimulator)

后续练习建议：手画 5 个节点的小图，标出可达邻居；区分“选下一节点”和“实际走过去”；手算终点误差，并构造“经过目标却没停止”的失败轨迹。复现前确认 train / val-unseen / test 的建筑互斥，检查评测是否要求模型主动 STOP。

## 来源与证据级别

- **正文证据：** [arXiv HTML](https://arxiv.org/html/1711.07280)，重点阅读 §3–6。
- **出版元数据：** [CVF CVPR 2018](https://openaccess.thecvf.com/content_cvpr_2018/html/Anderson_Vision-and-Language_Navigation_Interpreting_CVPR_2018_paper.html)；[arXiv 摘要与版本记录](https://arxiv.org/abs/1711.07280)。
- **资源证据：** [作者官方模拟器与基线](https://github.com/peteanderson80/Matterport3DSimulator)，README 级核查。
- 核查日期：2026-09-29。本文迁移分析为本项目判断，不是原论文实验结论。

---

[返回文献总索引](../../README.md) · [方法对比](../../03_method_comparison.md)
