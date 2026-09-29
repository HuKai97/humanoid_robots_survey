# SparseOcc（Liu/ECCV）：全流程稀疏预测与 RayIoU

## 一分钟总结

**定位：效率路线与评价协议都值得精读。** 本页讨论 Liu 等人的 SparseOcc：先以粗到细的稀疏体素解码恢复几何，再以稀疏 mask 查询预测语义/实例；同时提出 RayIoU，检查首个可见表面的距离和类别。对人形部署，最大的启发是同时问“计算花在哪里”和“分数究竟测到了什么”。[原始论文](https://arxiv.org/abs/2312.17118)

## 论文、消歧与证据

- **最终论文标题**：Fully Sparse 3D Occupancy Prediction；Haisong Liu 等；ECCV 2024；arXiv 首发 2023。早期及官方仓库推荐引用标题含 Panoptic，属于版本演化。[官方版本说明](https://github.com/MCG-NJU/SparseOcc)
- **官方代码**：[MCG-NJU/SparseOcc](https://github.com/MCG-NJU/SparseOcc)，已核验 README、版本新闻、训练/评估入口，未运行。
- **同名但不同论文**：Tang 等，SparseOcc: Rethinking Sparse Latent Representation for Vision-Based Semantic Occupancy Prediction，CVPR 2024，[VISION-SJTU 官方仓库](https://github.com/VISION-SJTU/SparseOcc)。该作的 sparse diffuser 等模块不能写入本篇的方法描述。
- **实际阅读级别**：原文 HTML §3 方法、§4 RayIoU、实验设置与局限段，以及官方 README；未复现。未下载论文。核验日期：2026-09-29。

## 输入输出与方法步骤

输入是当前和历史多相机图像及投影关系；输出由稀疏占据体素上的语义/实例构成。先提取二维特征，稀疏 voxel decoder 逐级细化、预测占据分数并裁剪候选；mask Transformer 在保留的空间内预测分组与类别。mask-guided sparse sampling 仅取掩码内部分三维点，再投影到图像取特征；历史信息通过变换采样点后查询历史图像融合。[论文 §3](https://arxiv.org/html/2312.17118#S3)

这与 VoxFormer 的差别在于不再使用稀疏到完整稠密特征恢复模块；但“完全稀疏”不代表没有候选召回问题，也不代表完整工程没有输出转换成本。

## RayIoU 与关键概念

体素 mIoU 在特定可见性 mask 下可能偏爱变厚的表面，也可能严厉惩罚一个体素的深度错位。RayIoU 从指定位置投射查询射线，以首先命中的占据体素的距离和类别判定；在过去/未来经过的位置投射，可评估场景补全。它改变评价对象，不等于把训练标签变成激光测量。[论文 §4](https://arxiv.org/html/2312.17118#S4)

**Pruning** 是计算资源选择：没有保留的体素并不因而获得“确认自由”的证据。**Panoptic** 额外区分对象实例，但一个实例 mask 不是可跟踪的跨时刻身份。这里还需要读者区别时序输入、实例分割与长期地图维护。

## 实验应看什么

重点核对候选数量、时序帧数、主干、图像大小以及 GPU/精度配置；官方版本更新改变过训练和损失设置，引用成绩要绑定版本。[官方 README](https://github.com/MCG-NJU/SparseOcc)

人形复现建议同时记录早期稀疏阶段的障碍 recall 和最终语义精度。对细杆、桌角、悬空线缆，若粗阶段已裁掉，后续 decoder 很难补救。RayIoU 也应与局部碰撞空间指标联合使用：车载距离阈值不能直接作为足边障碍容差。论文报告的 FPS 不可直接换算到机器人嵌入式平台。

## 局限与人形迁移分析（本调研推断）

稀疏计算适合把资源集中到近距离结构，但场景更拥挤、机器人手臂频繁出现时，固定候选预算可能不再适配。可以尝试按区域分配预算，在足部、手部与头部运动空间保留更多候选；这是待验证改法，不能保证优于原方案。

头部六自由度运动让历史图像采样更依赖精确位姿。小角度误差在近距离边缘同样可能造成特征错配；需结合关节状态、自遮挡 mask 和时间同步测试。几何稀疏结构还应与 observed/free/unknown 层独立维护，避免所有未输出体素在规划接口中默认为 free。

## 阅读与复现检查点

- 先记录 arXiv ID、作者、年份、代码 URL，避免同名引用错误。
- 按阶段画候选数量与真实障碍保留率，确认计算节省来自哪里。
- 在同一预测上同时计算原协议 mIoU 与 RayIoU，检查厚表面和漏掉第一障碍的案例。
- 人形验证将射线距离容差与动作所需精度联系起来，另测全身扫掠体积内的漏检。
- 与 [VoxFormer](../voxformer/README.md)、[GaussianFormer](../gaussianformer/README.md) 对比：候选 voxel、连续高斯都在降低表示冗余，但失败机制不同。
