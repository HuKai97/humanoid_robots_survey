# HumanoidVLN：专门研究人形身体差异的物理基准

**论文**：HumanoidVLN: A Physics-Grounded Simulator and Benchmark for Vision-Language Navigation Across Diverse Humanoid Embodiments。首次提交 **2026-08-13**，本次读取 v1。项目页标注 **Humanoids 2026 Under Review**，不能写成已录用。优先级 **P0**。核查日期：2026-09-29。

## 先读总结

HumanoidVLN 把机器人身体作为导航评测的核心变量：同一个语言模型，换成不同身高、腿部结构和路径跟踪器，结果可能改变。它提供 Isaac Sim 中的人形平台、场景筛选和指令生成流程，并做小规模 G1 仿真—实机配对试验。它是近期直接相关的预印本，但代码、基准和数据写明 **录用后发布**，当前不能标为可直接复现的已开源方案。[摘要](https://arxiv.org/abs/2608.12860)

## 问题、输入与输出

平台接收语言导航模型提出的动作或路径，经 PD／MPC 路径跟踪与 RL locomotion 执行，返回真实运动产生的第一视角观察。四个身体配置为 G1、H1、Internal-A、Internal-B；模型层、路径跟踪层与关节运动层应分别理解。它是承载模型的基准，不是替代 NaVILA 等方法的新语言模型。[HTML §III](https://arxiv.org/html/2608.12860v1)

## 数据与评测设计

场景来自人工建模及 3D Gaussian Splatting 重建，筛选考虑可通行面积与身体占用。指令由生成、复核、改写多角色流程构建，再由人核查；同一参考 episode 配套细粒度指令和多种粗粒度语言风格。作者报告 **933 个 episode**，并比较 NaVILA、DualVLN、StreamVLN、JanusVLN。[项目页](https://humanoid-vln.github.io/)

**本调研分析**：同一轨迹改写出的多条指令不是多个独立场景。后续数据划分应按场景、轨迹家族隔离，避免某种改写进入训练、另一种改写进入测试后虚高估计泛化。这里也不宜把“场景足够大”直接理解成复杂通过动作已经被充分覆盖。

## 实机证据及其范围

作者用 **DualVLN、Unitree G1、两个环境、20 个配对 episode** 检验仿真和真实环境的一致性；报告逐 episode 导航误差 Pearson 相关系数 **0.935**。这为所选重建场景中的行为一致性提供初步证据，原文也明确其不建立场景级泛化结论。[HTML §VI-D](https://arxiv.org/html/2608.12860v1)

四个模型乘四个身体的主表是仿真评测，不能理解成所有组合都做了真实部署。配对误差相关性高，也不等于成功率高，更不等于任意真实楼宇的结果都能由仿真预测。本文不转录主表排名，以免未经开放资源复核便把小范围结论当作通用能力排序。

## 局限与应谨慎阅读的表述

官网仍保留匿名评审文字，摘要已有作者名单；以 arXiv 记录作为书目信息依据，发布状态以两者交叉核查。其比较表的 “Hum.” 使用“专门面向人形”的口径，不能据此说 VLN-PE 不支持 H1／G1。[VLN-PE 正式论文](https://openaccess.thecvf.com/content/ICCV2025/html/Wang_Rethinking_the_Embodied_Gap_in_Vision-and-Language_Navigation_A_Holistic_Study_ICCV_2025_paper.html)

**本调研分析**：基准发表与资源开放之后，还需核对身体尺寸、控制器训练域、每场景抽样权重、失败和跌倒的计数单位。物理真实性、图像逼真度和语言标注质量是不同维度，不应仅靠一个主分数替代。

## 初学者阅读与资源状态

建议先读 VLN-CE、NaVILA、VLN-PE，再读本文，看自己能否解释“为什么同一模型换身体会改变结果”。将它加入跟踪列表，当前先复现已有开放 baseline。来源包括 [arXiv 摘要](https://arxiv.org/abs/2608.12860)、[HTML](https://arxiv.org/html/2608.12860v1)、[官方项目页](https://humanoid-vln.github.io/)；**官方代码 URL 尚未核得**。

**证据深度**：已查摘要、HTML 平台/配对试验/数据范围、项目页；未下载论文或数据，未获得代码，未独立验证作者实验。

---

[返回文献总索引](../../README.md) · [方法对比](../../03_method_comparison.md)
