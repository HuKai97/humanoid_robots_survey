# HAF：分阶段动作生成与小空间强化学习适配

## 元数据与阅读状态

- **论文**：HAF: Adapting Generalist VLAs to Humanoid Whole-Body Loco-manipulation via Hierarchical Action Flow and Spectral Latent RL。
- **作者**：Langzhe Gu, Chengkai Hou, Meng Li, Xinhua Wang, Jiaming Liu, Xinyuan Lv, Bowei Zhang, Shuanghao Bai, Guangrun Li, Jingyang He, Gaole Dai, Ziluo Ding, Zhiyuan Xu, Kuan Cheng, Jian Tang, Zhengping Che, Shanghang Zhang。
- **年份/状态**：2026-08-17 首发；完整 HAF 按 arXiv 预印本记录。分类：真实人形 VLA 与 RL 后训练。优先级：P2。
- **来源**：[arXiv](https://arxiv.org/abs/2608.16837) · [HTML](https://arxiv.org/html/2608.16837v1) · [当前项目](https://grange007.github.io/HAF/) · [早期 HAF-VLA 页](https://humanoidvla.github.io/)。代码链接本轮未核验到。
- **核验**：2026-09-29；摘要、两个项目版本、HTML 方法/实验设置；非全文精读，未下载论文、未运行代码。

## 先看总结

1. HAF-VLA 先生成移动/头部，再加入腰部，再加入操作，并传递前序动作上下文。
2. 三个阶段是内部生成过程，最后才执行完整动作块，不能解释为机器人先走完再动腰。
3. HAF-Steer 冻结大 VLA，只在低维噪声空间中学习 RL 修正。
4. 是值得追踪的前沿方法，尚不应当作成熟通用基线。

依据[当前项目](https://grange007.github.io/HAF/)；第 4 点为调研优先级判断。

## 背景与方法

人形的腰和底座位置影响双臂可达空间。如果各部位命令不一致，手臂可能用激烈动作补偿身体误差。HAF 从预训练 flow-matching VLA 出发，输入图像、本体状态和语言，输出结构化全身动作块。分阶段扩大激活的动作维度，并通过 KV cache 保留依赖；后续阶段允许修正之前预测的维度。[HTML §3](https://arxiv.org/html/2608.16837v1)

HAF-Steer 利用固定 flow 模型的数值反向积分，把示范动作映射回噪声，再沿时间维度做 DCT 压缩，以少量低频系数构成 RL 动作。先做示范监督初始化，再用带正则的离线到在线 SAC 更新小策略，大模型保持固定。[摘要](https://arxiv.org/abs/2608.16837)

**初学者解释**：RL 在这里调节“怎样采样一条动作轨迹”，不是重新训练所有语言视觉参数。压缩有助于缩小探索空间，但保留低频变化也会限制可表达的快速修正；是否合适需要任务实验。

## 实验、版本与指标边界

完整 HAF 在天工 2.0/3.0 上评估七项移动操作任务；核心长序列指标是归一化任务得分，不能改写成全部任务成功率。HAF-Steer 的在线适配分析覆盖其中的代表任务，其证据范围小于整个离线任务集合。[HTML 实验](https://arxiv.org/html/2608.16837v1)

早期网页 HAF-VLA 描述六项任务和分层生成；当前 HAF 网页包含 HAF-Steer 与七项任务，并说明 HAF-VLA 作为独立工作获 CoRL 2026 接收。完整 HAF 的作者列表、题目和实验不应与早期页面混合引用。[早期页](https://humanoidvla.github.io/)；[当前页](https://grange007.github.io/HAF/)。

## 与其他工作的联系及局限

**本调研分析**：与 [HEX](../2026_hex/README.md) 相比，两者都关注身体协调，但 HAF 强调生成顺序及执行后的适配。与 [OpenHLM](../2026_openhlm/README.md) 相比，值得问结构设计带来的收益是否超过数据与接口选择的收益。

分层生成会引入额外推理开销；冻结 backbone 也并不自动消除闭环探索风险。论文证明的是选定硬件、任务和数据下的方法有效性，不能从局部任务推出任意双足平台都能稳定学习。若复现实验改变低层控制器，应把这种变化作为系统差异报告。

## 阅读问题与候选复现

读后应说明：三阶段共享什么参数？哪些维度能被后续阶段修改？DCT 系数控制时间变化还是机器人空间自由度？任务得分为何不同于成功率？在线 RL 增益是否和增加相同数量示范进行过公平对比？最后一项是建议检查的问题。

复现门槛高。本轮未核验到可直接使用的官方训练仓库与权重，应先补齐代码/数据/低层接口的开放状态；方法学习可先在已有 flow policy 上做离线噪声重建实验。没有开展硬件探索、训练或资源下载。
