# REVERIE：导航到目标并指认物体

## 一分钟总结

REVERIE 把“走到一句路线指令的终点”拓展成“根据语言找到远处被描述的具体物体”。机器人必须移动到能观察目标的位置，并从候选物体中指认目标。对人形服务机器人，这有助于理解“导航完成”与“已经确认正确对象”之间的区别。指令虽然可能含“拿”“擦”等动词，基准本身不要求完成这些操作。

## 文献信息与阅读范围

- 全名：*REVERIE: Remote Embodied Visual Referring Expression in Real Indoor Environments*。
- 作者：Yuankai Qi 等；arXiv 首发 2019-04-23，CVPR 2020。
- 任务：远程物体指代、导航与定位；优先级 P1。
- 本次依据：作者 arXiv 摘要、CVF 官方论文页及其可检索正文片段、官方仓库任务/数据说明。未下载论文、未运行代码；不是逐公式精读。

## 为什么要有这个任务

“经过沙发右转”大致告诉了行走路线，而“去找书房窗边那盏灯”只描述目标及关系。后一种指令要求智能体主动探索，并排除外观相似的物体。REVERIE 的目标初始时可能不可见，不能把任务简化成对当前一张图做指代表达理解。[原文](https://arxiv.org/abs/1904.10151)

## 输入、输出和假设

输入是语言指令、当前位置的视觉观察和图环境中的移动机会；输出包括导航轨迹以及目标物体的定位结果。官方设置建立在 Matterport3D 图式环境和物体标注之上。这里的真实室内图像，并不意味着机器人在真实房屋里做了双足控制实验。[官方任务与数据说明](https://github.com/YuankaiQi/REVERIE)

## 方法怎样理解

论文给出 Interactive Navigator-Pointer 基线。可以把它理解为两个协作问题：navigator 决定去哪里获得更好的观察；pointer 根据语言和候选物体判断谁是目标。两者的联系在于，定位目标的线索应影响探索，而探索结果又改变候选集合。[CVPR 官方摘要](https://openaccess.thecvf.com/content_CVPR_2020/html/Qi_REVERIE_Remote_Embodied_Visual_Referring_Expression_in_Real_Indoor_Environments_CVPR_2020_paper.html)

本次不根据摘要推断具体网络层数或训练权重。要实现原模型，应进一步对照原文方法节和仓库导航、grounding 两部分环境。当前官方 README 区分原版及后续版本，以及不同 grounding 模型，因此“用了 REVERIE”不足以确认实验设置一致。[官方仓库](https://github.com/YuankaiQi/REVERIE)

## 实验告诉我们什么

原文对导航与指代表达方法的组合进行比较，并建立联合任务基线；意义是表明“能导航”和“能在单张图片找物体”的简单组合仍有困难。评价时必须分别看导航成功和目标定位成功。本文不转录缺少版本上下文的 leaderboard 数字。

## 局限与人形关联（分析）

对人形机器人，找到正确物体仍然只是后续操作的前提：可见不等于可抓取，距离近不等于身体姿态可执行。若将此任务迁移到实机，应单独记录目标识别错误、停靠位置错误和身体遮挡，而不能把它们都归入一个“导航失败”。本研究没有直接证明人形操控能力。

## 初学者学习与复现要点

1. 写两个失败例子：走进正确房间但指错灯；指认正确的灯但没有走到允许的位置。
2. 阅读官方结果文件格式，找出轨迹和 object ID 分别在哪一项。
3. 复现前锁定数据版本和 grounding 模型；先确认评测器如何定义成功，再比较方法。
4. 第一阶段读任务定义即可；只有研究目标指代导航时，才把旧环境移植作为主任务。

## 来源

- [arXiv 元信息和摘要](https://arxiv.org/abs/1904.10151)
- [CVPR 2020 正式论文页](https://openaccess.thecvf.com/content_CVPR_2020/html/Qi_REVERIE_Remote_Embodied_Visual_Referring_Expression_in_Real_Indoor_Environments_CVPR_2020_paper.html)
- [作者代码与数据说明](https://github.com/YuankaiQi/REVERIE)

核查日期：2026-09-29。

---

[返回文献总索引](../../README.md) · [方法对比](../../03_method_comparison.md)
