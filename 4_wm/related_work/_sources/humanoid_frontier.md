# 人形世界模型前沿追踪：已核验入口、尚未完成详细阅读

检索截止：2026-09-29。本文件条目仅用于下一轮阅读，不计入已详细解析论文数量；没有下载 PDF 或源码。以下使用论文摘要及作者项目，未把搜索结果中的第三方自动解读当作证据。

## MotionWAM（2026-06）

- 标题：MotionWAM: Towards Foundation World Action Models for Real-Time Humanoid Loco-Manipulation。
- 作者：Jia Zheng、Teli Ma、Yudong Fan、Zifan Wang、Shuo Yang、Junwei Liang。
- 状态：arXiv:2606.09215，预印本；阅读深度为官方摘要。
- 已确认内容：将视频世界模型的中间去噪特征用于策略条件，通过统一运动潜变量表达全身动作；摘要报告单第一视角相机、真实 G1 移动操作任务。没有逐表核验数值或实时速度，故这里不转录性能提升百分比。[官方摘要](https://arxiv.org/abs/2606.09215)
- 为什么值得跟踪（本笔记判断）：连接视频预训练与真正全身行动，适合与 Puppeteer、只做下肢感知行走的方法对读。
- 待核验：视频模型是否显式行动条件；中间特征是否带来超过等容量视觉骨干的收益；全身动作接口；任务次数与失效；训练/部署代码和权重。
- 资源状态：检索到作者项目静态源页面，但项目站访问失败，不视为已检查可用代码。[项目静态页面源](https://github.com/DiT4DiT/DiT4DiT.github.io/blob/main/MotionWAM/index.html)

## WM-LOCO（2026-09）

- 标题：World-Model-Augmented Visual Locomotion for Humanoids on Foothold-Constrained Terrain。
- 作者：Yuxi Liu、Lijun Han、Ziming Wang、Ao Zhang、Cong Yang、Wei Sui。
- 状态：arXiv:2609.02542，预印本；阅读深度为官方摘要及作者项目方法/实验介绍。
- 已确认内容：RSSM 与 PPO 联合训练，输入本体历史和单目深度流，预测记忆特征增强策略；推理不需要想象展开。项目列出真实 G1 踏石、楼梯和间隙测试，每类十次。这里不是大规模闭环可靠性证明。[官方摘要](https://arxiv.org/abs/2609.02542) [项目](https://m0puppet.github.io/wm-loco/)
- 为什么值得跟踪（本笔记判断）：落脚约束使几何误差直接影响失败，适合研究地图时效、深度不确定性及风险感知控制。
- 待核验：世界模型预测与增加循环记忆的贡献能否分离；不同地形奖励是否改变结论；域外材质/深度退化；接触误差与失败定义。
- 资源状态：项目仍标注 Code coming soon；GitHub 仓库为项目页资源，不能当作训练实现。[官方项目仓库](https://github.com/M0PUPPET/wm-loco)

本轮已经详细写卡的 2026 论文是 CAP、DWMP；以上两篇尚待全文方法、附录与代码交叉核验。此追踪表不声称穷尽 2026 年文献。
