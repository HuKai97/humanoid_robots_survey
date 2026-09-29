# FAST：为机器人动作设计更合适的词表

## 论文与阅读状态

- **原题**：FAST: Efficient Action Tokenization for Vision-Language-Action Models。
- **作者/机构**：Karl Pertsch、Kyle Stachowicz、Brian Ichter 等；Physical Intelligence 等。
- **首次提交**：2025-01-16；[arXiv](https://arxiv.org/abs/2501.09747)。
- **原文**：[HTML v1](https://arxiv.org/html/2501.09747v1)；[官方 tokenizer 项目与代码](https://huggingface.co/physical-intelligence/fast)；[π0-FAST 实现](https://github.com/Physical-Intelligence/openpi)。
- **核验日期**：2026-09-29。阅读深度：HTML 问题分析、算法、实验及官方使用说明；未逐页精读、未运行。

## 先读总结

1. FAST 是动作编码方法；π0-FAST 才是使用它的 VLA 实例。
2. 先压缩整段轨迹，再让模型预测 token，减少重复信息。
3. “训练更快”不自动等于“闭环控制更快”。
4. 很适合作为理解动作表示的第一篇方法论文。

## 详细介绍

### 为什么动作也需要 tokenizer

语言模型看有限词表中的编号；机器人动作常是连续角度、位移或夹爪开合。若每个关节、每个时刻都独立分箱，缓慢运动会产生大量近似符号。教学例子：把匀速抬手逐帧写成一长串数字，远不如描述其轨迹规律紧凑。这是表示问题，不等于硬件速度不足。

### 具体 pipeline

FAST 接收归一化动作块：逐维做离散余弦变换 DCT，把时间变化转为频率系数；缩放取整、展平，再由 BPE 合并成离散 token。推理时反向解码恢复动作，VLA 仍以自回归交叉熵训练。作者分析逐步分箱的高频冗余，并在灵巧操作与大规模 π0-FAST 训练中验证；“最高 5 倍”指特定训练比较。[原文算法与实验](https://arxiv.org/html/2501.09747v1#S5)

**教学理解**：DCT 提取趋势和细节变化，BPE 压缩常见系数组合；前者有可控量化误差，后者负责离散序列压缩。因此不能简单称为无损关节轨迹压缩。

### 贡献与公开条件

FAST+ 是预训练通用 tokenizer。官方提供自定义拟合和编码/解码接口；输入须先归一化，解码须知道动作维度与时间长度。[官方模型卡](https://huggingface.co/physical-intelligence/fast)

相对 π0 的连续 flow matching，FAST 保留自回归路线，改变表示；相对 OpenVLA-OFT，它没有直接转为并行连续回归。openpi 分别列出 π0 与 π0-FAST，使用时要确认模型分支及框架支持。[官方模型目录](https://github.com/Physical-Intelligence/openpi#model-checkpoints)

### 局限与人形相关性

本笔记的判断：压缩率、重建误差、策略成功率必须分别测。tokenizer 能重建轨迹，不代表策略预测会成功；接触变化、动作尺度和分布都会影响结果。token 少仍可能有串行解码开销。

其多动作维度设计适合思考双臂和多关节人形表示，但论文操作结果不是双足稳定性证明。人形应用尤其要关注手指细动作是否在量化中丢失，以及不同关节相同数值误差是否具有相同物理后果。

## 初学者精读与小练习

画一条平滑曲线与一条突然跳变曲线，比较 DCT 后需要多少显著系数，再问：相同重建误差为何可能对应不同抓取成功率？DCT 与 BPE 各解决什么？改变采样频率后应怎样验证？

初步练习可只用合成轨迹，记录 token 数、最大误差和轨迹图，再接策略训练。完整 VLA 复现仍依赖基座、动作数据和资源。本轮只建立笔记，未执行编码实验。
