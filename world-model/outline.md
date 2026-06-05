# World Models Survey — Outline & Merged Literature

> Checkpoint A · 2026-06-05

---

## 合并去重结果

三路搜索共 43 篇，去重后 35 篇独立论文 + 4 篇综述。去重冲突：DIAMOND (Renderer/Planner), Genie (Renderer/Planner), UniSim (Renderer/Simulator), DreamerV3 (Simulator/Planner)。按主要贡献分类归属。

---

## 提纲 (5 chapters, ~10 pages)

### §1 Introduction (1.5 pages)

**逻辑链：**
1. 世界模型概念起源 — Ha & Schmidhuber (2018) 用 VAE+RNN 预测 Atari 下一帧，agent 在"梦里"训练。一句话讲清楚：世界模型就是 AI 对环境的内部模拟。
2. 为什么 2024-2025 突然火了 — Sora 把视频生成和世界模拟混在一起，NVIDIA 说自己在做世界模型，机器人公司说自己在做世界模型，术语混乱。李飞飞 2026-06-04 发文指出"所有人都在做世界模型，但根本不是同一件事"。
3. 本文做什么 — 以李飞飞三分类（Renderer / Simulator / Planner）为组织框架，梳理各类的代表工作和核心进展。不提出新分类，不做价值判断，只做清晰认知地图。
4. 与已有综述的区别 — 已有的要么只覆盖视频生成（Zhu et al. 2024），要么只覆盖自动驾驶，要么太宽泛（Ding et al. 2025, ACM CSUR）。本文是第一个用李飞飞三分类全面梳理 AI/ML 世界模型的综述。
5. 范围说明 — 仅 AI/ML。认知神经科学起源一句话提及。机器人仅作为 Planner 自然载体提及。

**核心论文（不限数量，以讲清楚为准）：**
- Ha & Schmidhuber 2018 — 世界模型概念起源
- Li Fei-Fei 2026 X post — 三分类框架
- Zhu et al. 2024 survey — 已有综述对比
- Ding et al. 2025 ACM CSUR — 已有综述对比
- Sora 2024 — 引爆点

---

### §2 Renderer: Video Generation as World Rendering (2.5 pages)

**逻辑链：**
1. 什么是 Renderer — 输出像素，追求视觉逼真度。典型问题：给定过去几帧和一个动作（如"左转"），生成未来帧。
2. 开山之作 Sora — OpenAI 2024-02 发布，扩散 Transformer 在海量视频上训练，涌现 3D 一致性、物体永久性。未开源，但定义了整个方向。
3. 可交互的环境生成 Genie — DeepMind ICML 2024 Best Paper。11B 参数，从无标签互联网视频中自学 Latent Action Model，能用单张图片生成可操作的世界。突破：不需要人类标注动作标签。
4. 工业级开源 Cosmos — NVIDIA 2025。目前最大最完整的开源世界模型平台（2B-14B 模型、数据管线、tokenizer、后训练配方）。Cosmos-Predict2.5 统一了 Text2World/Image2World/Video2World。意味着 Renderer 从研究概念进入工程部署。
5. 关键挑战 — 物理准确性仍然是弱项。Kang et al. (2025, ICML) 系统证明：放缩模型规模不自动带来物理规律理解，视频模型做的是"案例匹配"而非"规律发现"。长时一致性（>30 秒）未解决。评估基准仍在早期（WorldScore, WorldModelBench）。

**核心论文（3 篇，无第 4 篇）：**
1. Sora (OpenAI, 2024) — 方向定义者
2. Genie (DeepMind, ICML 2024 Best Paper) — 可交互环境生成
3. Cosmos (NVIDIA, 2025) — 开源工业级平台

**辅助引用：** Diffusion Forcing (NeurIPS 2024), DIAMOND (NeurIPS 2024), Kang et al. "How Far" (ICML 2025), Matrix-Game 2.0 (2025)

---

### §3 Simulator: Physics and Geometry as World Simulation (2.5 pages)

**逻辑链：**
1. 什么是 Simulator — 输出环境状态（粒子位置、速度、3D 姿态），不是像素。追求结构真实。李飞飞说这是"最被低估但最关键"的一类——掌握物理模拟后能向上渲染像素、向下推导动作。
2. 基座 GNS — DeepMind ICML 2020。图神经网络替代传统数值求解器，统一处理流体/刚体/颗粒/可变形体。1000+ 引用，开辟"学出来的物理引擎"这个方向。
3. 从观测到物理模拟 One-Shot Real-to-Sim — Zhu et al. RA-L 2025。当前最完整的可微分 real-to-sim 管线：单次机器人推一下 → 联合优化几何+外观+物理参数 → 可仿真的数字孪生。
4. 物理融入世界模型 PIN-WM — Li et al. RSS 2025。可微分物理引擎(NVIDIA Warp) + 高斯泼溅视觉观测 → 端到端学习 3D 刚体动力学。在真实机器人上验证。代表"物理知情世界模型"的最实用部署。
5. 从物理准确到通用模拟 DreamerV3 — 虽然不是纯 Simulator，但它的 RSSM 学习紧凑的潜在状态转移模型，150+ 任务零超参调整，包括 Minecraft 中从零采集钻石。展示了 Simulator 和 Planner 的融合趋势。
6. 关键挑战 — 多材料/多物理统一模拟未解决。长时物理一致性（>1000 步）不可靠。可变形体（布料、软组织）在学习世界模型框架中极少。能耗/动量等硬约束未被显式执行。

**核心论文（3 篇，无第 4 篇）：**
1. GNS (Sanchez-Gonzalez et al., ICML 2020) — 学出来的物理引擎基座
2. One-Shot Real-to-Sim (Zhu et al., RA-L 2025) — 观测→物理模拟的完整管线
3. PIN-WM (Li et al., RSS 2025) — 物理知情世界模型的最实用部署

**辅助引用：** MeshGraphNets (ICLR 2021), SlotFormer (ICLR 2023), DayDreamer (CoRL 2022), PhysWorld (2025)

---

### §4 Planner: From World Understanding to Action (2.5 pages)

**逻辑链：**
1. 什么是 Planner — 输出动作指令。核心问题：agent 如何用内部世界模型来决定下一步做什么。从 Atari 按键到 Minecraft 合成钻石。
2. 学出来的世界模型+策略学习 Dreamer 系列 — 从 Dreamer (ICLR 2020) 到 DreamerV3 (2023)。核心思想：在学出来的潜在世界模型的"想象"中训练策略，而非真实环境。DreamerV3 在 150+ 领域、固定超参、从零采集 Minecraft 钻石——证明"在梦里学"可规模化。
3. LLM 作为规划器 Voyager — Wang et al. NeurIPS 2023。范式转移：LLM 本身充当世界模型和规划器。GPT-4 提出子目标 → 写代码执行 → 观察反馈 → 修正。Minecraft 中持续探索，获取 3.3x 更多物品。将 Atari/Minecraft 从 RL benchmark 变成了 LLM agent benchmark。
4. 统一视觉-语言-动作 OmniJARVIS — Wang et al. NeurIPS 2024。最新趋势：一个模型同时"想"（文本）和"做"（动作标记），自回归生成推理+行为。代表世界模型和 VLM 的融合方向。
5. 两类规划范式的对比 — Dreamer 路线（学潜在动力学+在想象中训练策略）vs. Voyager/OmniJARVIS 路线（LLM/VLM 直接推理出动作）。前者数据效率高（Atari 100k 两小时游戏数据就够了），后者泛化能力强（zero-shot 到新任务）。
6. 关键挑战 — 显式规划算法（MCTS、MPC）在学出来的世界模型上的研究太少（EfficientZero V2 是例外）。多 Agent 世界模型规划几乎空白。大世界模型的实时推理延迟无解决方案。标准化规划质量基准缺失。

**核心论文（3 篇，无第 4 篇）：**
1. DreamerV3 (Hafner et al., 2023) — 学出来的世界模型+策略学习集大成
2. Voyager (Wang et al., NeurIPS 2023) — LLM 作为世界模型+规划器
3. OmniJARVIS (Wang et al., NeurIPS 2024) — 统一 VLA，感知-推理-行动一体

**辅助引用：** Ha & Schmidhuber 2018 (起源), Dreamer (ICLR 2020), DreamerV2 (ICLR 2021), IRIS (ICLR 2023), DIAMOND (NeurIPS 2024), EfficientZero V2 (ICML 2024)

---

### §5 Open Problems and Future Directions (1 page)

**结构：6 个具体开放问题，每个写清壁垒+攻击向量+难度。**

1. **物理准确性：从视觉逼真到物理真实**
   - 壁垒：当前 Renderer 的"物理理解"是训练分布的统计相关性，不是因果规律。Kang et al. (ICML 2025) 实验证据：视频模型做案例匹配不做规律发现。
   - 攻击向量：可微分物理引擎（Warp, Brax）作为硬约束嵌入世界模型训练管线。物理知情损失函数。
   - 难度：高。需要跨物理模拟和深度学习的工程整合。

2. **长时一致性与因果推理**
   - 壁垒：自回归误差累积。>30 秒视频逐帧退化。>1000 步物理模拟发散。
   - 攻击向量：Diffusion Forcing 的因果扩散范式。层次化时间抽象（先规划子目标再生成细节）。外部记忆增强。
   - 难度：中-高。架构创新+训练范式改进。

3. **Renderer-Simulator-Planner 的统一**
   - 壁垒：三类模型的内部表示互不兼容（像素 vs. 物理状态 vs. 动作标记）。当前各自为政。
   - 攻击向量：统一 tokenization（视频帧+物理状态+动作都映射到共享 token 空间）。OmniJARVIS 的行为 tokenization 是早期尝试。Vid2World 的因果化转换管线是另一个方向。
   - 难度：高。可能需要全新的基础架构。

4. **评估标准化**
   - 壁垒：FVD/PSNR 测视觉质量不测物理准确性。Atari 100k 测策略不测世界模型本身好不好。每篇论文自己定义评估。
   - 攻击向量：开发结构化 benchmark，分别测 (a) 物理规律学习, (b) 长时一致性, (c) 因果推理。PhyWorld (Kang et al.), WorldScore (Stanford), MCU (Minecraft) 是早期尝试。组合使用。
   - 难度：中。需要领域共识。

5. **数据效率与泛化的平衡**
   - 壁垒：Dreamer 类数据效率高但泛化弱（每个环境重新训练）。LLM Agent 类泛化强但依赖巨型预训练模型，推理成本高、延迟大。
   - 攻击向量：预训练通用世界模型 + 少量环境样本微调（Cosmos 的模式）。或小世界模型 + 大 LLM 规划器混合架构（ROCKET-1 的模式）。
   - 难度：中。工程优化问题。

6. **多模态世界建模：超越视觉**
   - 壁垒：几乎所有世界模型是纯视觉（RGB 视频）。音频、触觉、力反馈等模态缺失。人类理解世界靠多感官融合。
   - 攻击向量：多模态编码器（音频、触觉传感器）接入世界模型训练。游戏环境（Minecraft 有音效）可做初始试验台。
   - 难度：中。数据采集+多模态对齐。

---

## 核心论文总表

| 章节 | 核心论文 | 年份 | 为什么重要 |
|------|---------|------|-----------|
| §1 | Ha & Schmidhuber "World Models" | 2018 | 起源 |
| §1 | Li Fei-Fei "World Model Taxonomy" | 2026 | 分类框架 |
| §2 | Sora (OpenAI) | 2024 | 方向定义 |
| §2 | Genie (DeepMind) | 2024 | 可交互环境 |
| §2 | Cosmos (NVIDIA) | 2025 | 开源平台 |
| §3 | GNS (DeepMind) | 2020 | 物理引擎基座 |
| §3 | One-Shot Real-to-Sim | 2025 | 观测→模拟管线 |
| §3 | PIN-WM | 2025 | 物理知情部署 |
| §4 | DreamerV3 | 2023 | 想象中训练集大成 |
| §4 | Voyager | 2023 | LLM 作为规划器 |
| §4 | OmniJARVIS | 2024 | 统一 VLA |

共 12 篇核心论文。§2/3/4 严格 3 篇，无多余。总引用目标 ~55 篇（含辅助引用+综述+benchmark 论文）。
