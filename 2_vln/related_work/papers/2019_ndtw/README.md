# nDTW / SDTW：既看终点，也看是否按指令走

**论文：** General Evaluation for Instruction Conditioned Navigation using Dynamic Time Warping，Gabriel Ilharco 等。**年份：** 2019 首发；Google Research 标注为 NeurIPS 2019 **ViGIL Workshop**。**优先级：P0。** 本次范围：HTML 正文 §2–3 与算法附录；作者机构出版页；VLN-CE 官方评测实现入口。未执行代码。

## 先总结

nDTW 用有顺序的轨迹对齐衡量预测路径与参考路径的接近程度；SDTW 再要求任务成功。它能帮助发现“最后到了，但没有按路线指令走”的问题。注意它的原论文不是《On Evaluation of Embodied Navigation Agents》；后者首发于 2018，讨论 SPL 等导航评测规范。[Google Research 出版页](https://research.google/pubs/general-evaluation-for-instruction-conditioned-navigation-using-dynamic-time-warping/)，[SPL 相关文献](https://arxiv.org/abs/1807.06757)

## 背景与输入输出

输入是参考轨迹 `R`、预测轨迹 `Q`、两点间距离函数和成功阈值 `d_th`；输出是轨迹得分。模型本身不读语言，参考轨迹承担了“应当怎样走”的监督角色。图环境可用图上最短距离；有墙体的连续环境应明确距离定义。[正文 §2](https://arxiv.org/html/1907.05446)

**学习解释：** 假设指令要求先经过厨房再到客厅，直接从走廊到客厅可能有很高 SR，却漏掉中间要求。反过来，一条正确绕行的路径可能更长。评测必须区分目标到达、路径效率和指令忠实度，而不能把它们混成一个“导航好坏”。

## 方法与公式

DTW 允许两条长度不同的序列有不同步速，但匹配次序不能倒置。通过动态规划累积匹配点的距离，再归一化：

\[
\mathrm{nDTW}(R,Q)=\exp\!\left[-\frac{\mathrm{DTW}(R,Q)}{|R|\,d_{th}}\right],\qquad
\mathrm{SDTW}=\mathbf{1}[\mathrm{success}]\mathrm{nDTW}.
\]

其中 `|R|` 是参考轨迹的**采样点数量**，不是米制路程。分数越高越好；SDTW 的失败 episode 记为零。论文附录给出递推算法。[正文公式 1–2 与附录 B](https://arxiv.org/html/1907.05446)

## 实验与证据

论文用人工轨迹相似度排序检验指标，并在 R2R / R4R 比较把 nDTW 用作奖励的策略；其结果支持同时报告路径忠实度。这里不把指标与人类判断的相关性扩张成“能够理解所有语言约束”。[作者机构摘要](https://research.google/pubs/general-evaluation-for-instruction-conditioned-navigation-using-dynamic-time-warping/)

## 局限与人形关系

**本项目分析：** 只有一条参考路径时，语义等价的替代路线可能被惩罚；临时出现障碍时，安全绕行也可能降低分数。必须结合指令是否严格规定路径来解释 nDTW。这个指标不直接衡量摔倒、碰撞、躯干晃动、能耗或动作时延，更不证明人形控制稳定。

人形 VLN 可保留 SR / SPL / nDTW，再增加任务相关的执行指标，但新增定义应在实验前冻结。不要试完系统后才调整成功半径来制造改进。若采用不同距离函数或轨迹采样频率，应同时保存原始轨迹，让结果可重新计算。

## 初学者阅读与复现准备

先手算三条小路径：完全重合、终点相同但经过另一侧、经过节点相同但顺序颠倒。随后检查动态规划边界、STOP 成功判断、分数是 `[0,1]` 还是百分制。VLN-CE 官方 `measures.py` 提供 NDTW/SDTW 实现入口；它是后续基准的实现，并非本论文作者仓库。[VLN-CE 官方评测代码](https://github.com/jacobkrantz/VLN-CE/blob/master/habitat_extensions/measures.py)

这组手算练习无需数据集或 GPU，适合作为第一周的评测学习任务；本次仅提出计划，没有创建实验结果。

## 来源与证据级别

- **正文证据：** [HTML 全文入口](https://arxiv.org/html/1907.05446)，公式、实验和算法附录重点阅读。
- **准确发表类型：** [作者机构页面](https://research.google/pubs/general-evaluation-for-instruction-conditioned-navigation-using-dynamic-time-warping/)，ViGIL Workshop。
- **相关实现：** [VLN-CE measures.py](https://github.com/jacobkrantz/VLN-CE/blob/master/habitat_extensions/measures.py)，在线源码入口核查，未运行。
- 核查日期：2026-09-29；上述限制与练习是本项目分析。

[原论文元信息](https://arxiv.org/abs/1907.05446)

---

[返回文献总索引](../../README.md) · [方法对比](../../03_method_comparison.md)
