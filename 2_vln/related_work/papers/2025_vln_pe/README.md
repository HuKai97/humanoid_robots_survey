# VLN-PE：把物理执行误差纳入导航评测

**论文**：Rethinking the Embodied Gap in Vision-and-Language Navigation: A Holistic Study of Physical and Visual Disparities。首次提交 **2025-07-17**；[CVF 正式论文页](https://openaccess.thecvf.com/content/ICCV2025/html/Wang_Rethinking_the_Embodied_Gap_in_Vision-and-Language_Navigation_A_Holistic_Study_ICCV_2025_paper.html) 确认 **ICCV 2025**。优先级 **P0**。核查日期：2026-09-29。

## 先读总结

VLN-PE 的价值是提醒研究者：语言理解和路线预测做对了，机器人也可能因为碰撞、跌倒、视角变化而失败。它是支持多种身体的物理评测平台与系统分析，包含人形机器人仿真；原文附录的实机补充是 Go2 四足。因此应把它列为人形 VLN 的核心评测阅读，不能写成已经完成大规模人形实机验证。[摘要](https://arxiv.org/abs/2507.13019)

## 问题、输入与输出

传统 VLN-CE 已从导航图变成连续空间，但动作执行仍可能理想化。VLN-PE 在 GRUTopia／Isaac Sim 物理环境中，把语言导航策略产生的离散动作或路径交给机器人控制器执行，并收集实际到达状态和观察。输入模态随被评测模型变化，不能为整个平台填写一个统一“RGB-only”。[HTML §3](https://arxiv.org/html/2507.13019v1)

## 方法与平台设计

平台支持 Unitree H1、G1、Aliengo 与 Jetbot，并比较不同控制方式。Flash 控制直接到达目标位姿，可用来隔离物理执行的影响；速度控制通过线速度与角速度驱动真实运动；路径控制跟踪给定路径。对腿式机器人，RL locomotion 负责底层执行。研究还考察观察高度、光照、渲染与场景变化，以及跨身体训练数据。[作者项目页](https://crystalsixone.github.io/vln_pe.github.io/) [HTML 附录 A.6](https://arxiv.org/html/2507.13019v1)

**本调研分析**：这类分解让“模型看不懂”和“机器人走不到”成为可分别测量的问题。如果换模型时同时换相机高度和控制器，就无法判断提升来自哪里。初学者可先理解实验变量，不急于搭建全部物理系统。

## 实验到底证明了什么

主评测包含 H1 上的物理仿真，检验已有 VLN-CE 方法直接迁移或适配后的表现。作者指出视野受限、视觉变化和执行失败都会造成性能下降。附录 B 在 **14 条 Go2 室内 episode** 上比较 CMA 的适配效果；这只是规模有限的四足实机证据。[HTML §5、附录 B](https://arxiv.org/html/2507.13019v1)

平台名称中的 physical environment 指包含物理执行的环境，并不把所有结果自动变成真实硬件结果。SR、SPL 外，还需要关注跌倒、卡住等失败；Flash 和 physical controller 的分数必须分列。本文与后来 HumanoidVLN 都支持人形研究，但侧重与数据口径不同，不能根据后者宣传表中的单一标记否认本平台的人形支持。

## 局限与后续可验证问题

**本调研分析**：模拟接触更真实仍不等于真实世界完全可预测，特别是摩擦、传感延迟、透明表面和紧窄空间。故研究应同时保存理想控制、物理控制和实机结果；失败归因也应记录语言误解、停止错误、碰撞和跌倒，而不是只有总成功率。固定策略后进行单变量扰动，是比直接宣布新模型更可靠的起点。各版本还应保留相同任务的轨迹，便于逐条分析差异。

## 初学者阅读与复现入口

按 VLN-CE → NaVILA → 本文的顺序，先看三类控制器，再看跨身体和视觉因素实验。官方项目的代码入口指向 [InternNav](https://github.com/InternRobotics/InternNav)。开始复现前需核对当前 InternNav、InternUtopia 与论文版本关系；本次只记录入口，不安装模拟器。

**证据深度**：已查 CVF、摘要、HTML 平台/控制器/实机段落、项目页、官方代码 README；未全面重算表格，未下载或运行。

---

[返回文献总索引](../../README.md) · [方法对比](../../03_method_comparison.md)
