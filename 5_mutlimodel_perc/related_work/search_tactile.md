# 触觉、音频与跨模态分支检索记录

检索日期：2026-09-29。检索目标是建立从接触预测、传感器、数据集到通用表征及策略接口的入门链；不是穷尽全部触觉文献。仅浏览网页/摘要/全文 HTML，未下载 PDF、LaTeX、数据或模型，没有训练和机器人实验。

## 已纳入的文献与核验

| ID | 查询词 | 核验原始来源 | 纳入理由与阅读边界 |
|---|---|---|---|
| 14 | The Feeling of Success touch Calandra arxiv | [PMLR](https://proceedings.mlr.press/v78/calandra17a.html)、[HTML](https://arxiv.org/html/1710.05512v2) | 经典视觉触觉结果预测；读方法、采集、划分。v2 是2025上传，首次2017不能混淆。作者项目访问失败，不声称代码可用。 |
| 15 | Making Sense of Vision and Touch arxiv | [项目](https://sites.google.com/view/visionandtouch)、[首版](https://arxiv.org/abs/1810.10191)、[扩展HTML](https://arxiv.org/html/1907.13098) | 2018首版/2019会议与扩展版分开；详细方法依据扩展版。腕力不等于指尖图像。 |
| 16 | DIGIT low-cost compact high-resolution tactile sensor | [摘要](https://arxiv.org/abs/2005.14679)、[HTML](https://arxiv.org/html/2005.14679)、[官方设计](https://github.com/facebookresearch/digit-design) | 硬件基础；读结构、触觉编码和手内操作；不混淆同名人形机器人，不使用第三方价格描述。 |
| 17 | ImageBind One Embedding Space To Bind Them All official | [摘要](https://arxiv.org/abs/2305.05665)、[HTML](https://arxiv.org/html/2305.05665)、[代码](https://github.com/facebookresearch/ImageBind) | 学习音频/视觉/IMU等模态对齐；原版不含触觉，IMU语义编码不等于VIO。 |
| 18 | Touch and Go Learning from Human-Collected Vision and Touch | [项目](https://touch-and-go.github.io/)、[HTML](https://arxiv.org/html/2211.12498)、[官方代码](https://github.com/fredfyyang/Touch-and-Go) | 人采自然环境数据；读采集、时戳与局限；不下载视频。 |
| 19 | Octo An Open-Source Generalist Robot Policy | [项目](https://octo-models.github.io/)、[v2 HTML](https://arxiv.org/html/2405.12213v2)、[代码](https://github.com/octo-models/octo) | 策略边界和新力觉观测适配；v2与早期材料机器人数量不同，不混用数字。 |
| 20 | AnyTouch Learning Unified Static-Dynamic Representation | [项目](https://gewu-lab.github.io/AnyTouch/)、[HTML](https://arxiv.org/html/2502.12191v1)、[代码](https://github.com/GeWu-Lab/AnyTouch) | 静态/动态、跨传感器表征；读方法、倾倒、生成文字标注及局限。OpenReview遇到验证页，首次公开年份按已核验arXiv 2025记录，更早时间待核验。 |

## 延伸候选，尚未计入七篇精读笔记

- [UniTouch / Binding Touch to Everything（arXiv，2024）](https://arxiv.org/abs/2401.18084)：读到摘要，借助已对齐图像空间连接触觉与其他模态，值得作为 ImageBind 后续；本轮选择 AnyTouch 提供更明确的静态/动态及跨传感器学习入口。
- [AnyTouch 2（arXiv，2026）](https://arxiv.org/abs/2602.09617)：已检索摘要及[官方仓库](https://github.com/GeWu-Lab/AnyTouch2)、[项目](https://gewu-lab.github.io/AnyTouch2/)入口。是后续动态触觉工作，未精读，不将其方法、数据或结果混入 AnyTouch 笔记；首次公开的更早 OpenReview 时间也未核验。

## 检索限制与后续核验

这是定向检索，音频部分主要借 ImageBind 解释表征对齐，尚不足以覆盖机器人声源定位、主动听觉和敲击物性估计；传感器部分偏光学触觉，也没有覆盖电容、压阻和全身电子皮肤。未来扩展应优先补这两个缺口。七篇均未提供直接全身人形验证证据，不能因为与机器人相关就改贴该标签。

搜索结果可能自动展示 PDF 摘录，但本轮未主动打开或下载 PDF 链接；方法笔记依据上述 HTML 和官方页面。部分第三方聚合页对成本、作者、年份或会议的描述与原始来源不一致，未用于实质结论。定量性能没有逐表审计，因此笔记以实验设计与支持范围为主；后续复现前还需冻结版本、划分、指标与资源预算。
