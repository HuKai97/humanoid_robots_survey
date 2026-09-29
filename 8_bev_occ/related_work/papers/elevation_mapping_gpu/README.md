# Elevation Mapping using GPU：先把脚下地图做扎实

## 元数据与证据

- **原题**：Elevation Mapping for Locomotion and Navigation using GPU。
- **作者**：Takahiro Miki、Lorenz Wellhausen、Ruben Grandia、Fabian Jenelten、Timon Homberger、Marco Hutter。
- **发表**：IROS 2022；`arXiv:2204.12876`。
- **来源**：[论文条目](https://arxiv.org/abs/2204.12876)、[官方代码](https://github.com/leggedrobotics/elevation_mapping_cupy)、[官方文档](https://leggedrobotics.github.io/elevation_mapping_cupy/)、[概率高程前序实现](https://github.com/ANYbotics/elevation_mapping)。
- **证据阅读级别**：论文摘要、作者仓库功能/引用信息、官方文档与前序实现说明；未逐节精读全文、未运行、未下载PDF/source。核验日期：2026-09-29。
- **定位 / 优先级**：P1，足式机器人地形感知基线；论文报告四足及地下探索应用，不冒充人形实验。

## 一分钟总结

高程图不是过时的低配OCC。对足式落脚，维护一个以机器人为中心、更新快且包含有效性/不确定性的地形表面，往往比完整语义体积更直接。这项工作利用GPU加速高程处理，并支持导航与运动控制所需的后处理。[论文摘要](https://arxiv.org/abs/2204.12876)

## 输入与输出

输入为距离观测/点云、位姿与坐标变换；输出为局部2.5D栅格及派生图层。基本表示是每个平面格子的地表高度，可进一步形成坡度、平滑结果、可通行性或分割平面。当前仓库还含多模态图层扩展，不能将所有当前功能都追认为2022论文贡献。[官方仓库](https://github.com/leggedrobotics/elevation_mapping_cupy)

## 方法详解

先理解前序概率高程思路：测量和位姿误差会传导到高度估计，地图跟随机器人维护局部有效区域，避免把局部导航强行绑定到永久不变的全局地图。前序实现同时公布高度及方差，并对新测量与旧高度的一致性作判断。[前序项目](https://github.com/ANYbotics/elevation_mapping)

GPU版把点云处理和地图更新等适合并行的工作放到GPU；官方仓库突出高度漂移补偿、射线可见性清理、可通行性过滤、平滑与平面分割。理解这些组件的目的很关键：漂移补偿减少伪地形，可见性清理避免历史残影，平面分割为接触面提取提供接口。[官方功能说明](https://github.com/leggedrobotics/elevation_mapping_cupy)

从通用表示角度，一张单值高度图无法同时完整表达同一平面位置的地面、桌面和桌下空腔。这不是算力不够，而是表示本身的信息压缩。因此足下高程和身体碰撞体积应作为互补输出。后处理补洞也不代表真实观察到了地面，必须单独保留填补/实测标识。

## 实验应该怎样读

摘要说明用于DARPA地下探索和四足运动实验，但没有因此证明它对所有人形步态有效。阅读重点应是地图更新延迟、地形边缘保真、漂移误差、平台负载，以及地图进入控制环后是否仍新鲜。[论文条目](https://arxiv.org/abs/2204.12876)

本调研建议额外测量台阶边缘定位误差、足底区域内最大高度差、看不见脚下时的地图年龄。不要只比较平均高度RMSE：薄台阶边缘错几厘米，可能比大面积平地误差更影响落脚。

## 局限与人形迁移判断

人形相比轮式更需要关心脚边盲区、抬脚摆动和支撑转换。相比四足，人形足底接触面、平衡约束和双足可达域不同，不能照搬四足可通行阈值。应将“表面是什么”与“当前身体能不能走”分开：前者来自几何，后者结合机器人、负载、步态与控制器。

建议先做重力对齐的局部高程，输出高度、有效掩码、时间戳和方差，再接足步规划；同时维护[ESDF](../nvblox/README.md)排除膝盖、头部和手臂碰撞。传感器未定时，不急于选固定分辨率，而从最小危险台阶和足底尺寸反推近场需求。

## 阅读与复现检查点

- 检查地图坐标系是否跟随base的roll/pitch，避免地形随机器人摇摆。
- 对台阶、桌下、悬垂物分别检查表示失真。
- 关闭补洞/平滑，观察原始观测，再逐项打开后处理。
- 区分图层发布频率、实际更新频率和控制器读取时的地图年龄。
- 补读：Robot-Centric Elevation Mapping with Uncertainty Estimates（CLAWAR 2014）及 Probabilistic Terrain Mapping for Mobile Robots with Uncertain Localization（RA-L 2018），元数据可从前序仓库引用区追溯。
