# DualVLN／InternVLA-N1：慢速理解与快速轨迹执行

**主论文**：Ground Slow, Move Fast: A Dual-System Foundation Model for Generalizable Vision-and-Language Navigation，简称 **DualVLN**。arXiv 首次提交 **2025-12-09**；官方仓库引用项确认为 **ICLR 2026**。优先级 **P0**。核查日期：2026-09-29。

## 先读总结

DualVLN 将耗时的语言与场景理解交给 System 2，将持续响应观察的局部轨迹生成交给 System 1，再由机器人控制器执行。它的关键不是简单串联两个模块，而是利用显式像素目标和学习的隐变量连接两层，并异步更新。原论文报告 G1 人形实机，与本调研直接相关。[论文摘要](https://arxiv.org/abs/2512.08186)

## 名称与版本先厘清

**InternNav** 是开源工具平台；**InternVLA-N1** 是模型系列及 2025 年技术报告名称；**DualVLN** 是其中后续论文与具体配置。官方 README 同时列出 RGB-D 的 `InternVLA-N1 w/ NavDP*` 和 RGB 的 `InternVLA-N1 DualVLN`，并要求引用 ICLR 论文与早期报告。不能把全部名称当完全相同的模型，也不应将两个配置的成绩混为一条记录。[官方 README](https://github.com/InternRobotics/InternNav)

早期报告全题为 *InternVLA-N1: An Open Dual-System Vision-Language Navigation Foundation Model with Learned Latent Plans*。官方发布记录标注技术报告于 2025 年 10 月发布；未核得独立 arXiv 编号，故不替它杜撰“首次 arXiv 日期”。[报告项目页](https://internrobotics.github.io/internvla-n1.github.io/)

## 输入、输出与方法

System 2 读取指令和第一视角历史，输出图像中的下一阶段目标或视角调整动作；隐变量提取与指令、图像、目标相关的上下文。System 1 使用该条件及较新的 RGB 观察，通过 Diffusion Transformer 生成连续局部路径。语义系统更新期间，快速系统仍能根据新观察重新规划；最终稳定迈步仍是低层控制器的工作。[HTML §3](https://arxiv.org/html/2512.08186v1)

**本调研分析**：像素目标直观，但同一个像素可能落在障碍物、门的远处或无法到达的区域。隐变量提供更丰富条件，却增加了调试难度。因此学习时应同时检查目标点可视化和执行轨迹，而不是只把它理解成“VLM 加 diffusion”。

## 实验到底证明了什么

论文评估 VLN-CE、VLN-PE 和 Social-VLN，并报告 Turtlebot4、Go2、G1 的实机实验。Social-VLN 中出现 humanoid agents 主要指环境里的行人交互对象，不能仅凭这一措辞判断受控机器人就是人形；G1 实机证据来自独立的实验设置描述。[HTML §4、§5](https://arxiv.org/html/2512.08186v1)

作者同时报告远程服务器推理与机器人传感配置。RGB 模型不意味着整套部署硬件只有 RGB：系统可采集 RGB-D，具体配置中 depth 是否参与规划或控制需另行核对。官方表也明确区分 Flash 和 physical controller；两种执行条件的成绩不应互换。[官方评测表](https://github.com/InternRobotics/InternNav)

## 局限与研究切入分析

**本调研分析**：异步系统会遇到“旧目标、新画面”的时间错配，局部策略能处理小偏差并不保证修正语义错误。人形还会因相机摇摆、步态执行延迟产生额外偏移。建议在复现后记录目标生成时间、轨迹生成时间和执行时间，固定控制器后再测试延迟和目标扰动，避免把系统工程变化误认作模型进步。

## 初学者阅读与证据范围

先读 NaVILA 和 NavDP，再对照两者学习“双系统条件接口”；随后看异步推理和消融。先复现官方某一个精确配置，不同时更换传感器、数据与底层策略。

**证据深度**：已查 DualVLN 摘要、HTML 方法及实机段落、InternVLA-N1 官方项目页、InternNav README 与引用项。OpenReview 页面受验证限制，会议身份依据官方仓库；未安装、未运行、未下载论文或数据。技术报告项目的“arXiv”按钮实际指向作者托管 PDF，不能据此认定有独立 arXiv 记录。

---

[返回文献总索引](../../README.md) · [方法对比](../../03_method_comparison.md)
