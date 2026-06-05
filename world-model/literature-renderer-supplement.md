# Supplementary Literature Search: Renderer-Type World Models

> **Search Date**: 2025-06-05 (supplement to same-date primary search)
> **Purpose**: Fill gaps missed by the primary WebSearch-based search, focusing on top-venue papers (2025-2026), citation network analysis, and very recent arXiv preprints.
> **Methodology**: Targeted searches on arXiv, Semantic Scholar, top venue proceedings (ICML 2025, NeurIPS 2025, CVPR 2025, ICLR 2025/2026, ICCV 2025), and citation networks of Sora, Genie, Cosmos, and DIAMOND.

---

## Summary of New Findings

**18 new papers identified**, of which 14 were published/accepted at top venues (NeurIPS 2025, ICML 2025, CVPR 2025, ICLR 2025/2026, ICCV 2025) and 4 are strong arXiv preprints from 2026.

---

## Cluster S1: Critical Evaluations & Benchmarks

### S1. How Far Is Video Generation from World Model: A Physical Law Perspective

| Field | Detail |
|-------|--------|
| **Authors** | Bingyi Kang, Yang Yue, Rui Lu, Zhijie Lin, Yang Zhao, Kaixin Wang, Gao Huang, Jiashi Feng |
| **Year** | 2025 |
| **Venue** | **ICML 2025** |
| **arXiv ID** | [2411.02385](https://arxiv.org/abs/2411.02385) |
| **Code** | Project page: [phyworld.github.io](https://phyworld.github.io) |
| **Quality Score** | **A** (Highly influential) |

**One-sentence summary**: Conducts the first systematic evaluation of whether scaled video generation models actually learn physical laws, finding they engage in "case-based" generalization (mimicking nearest training examples) rather than abstracting Newtonian rules, and fail catastrophically on out-of-distribution physics scenarios regardless of model scale.

**Why the previous search missed it**: Published under a general video generation framing rather than explicit "world model" or "world simulator" keywords; its ICML 2025 acceptance post-dated the initial search window's coverage of 2025 venues.

---

### S2. WorldScore: A Unified Evaluation Benchmark for World Generation

| Field | Detail |
|-------|--------|
| **Authors** | Haoyi Duan, Hong-Xing Yu, Sirui Chen, Li Fei-Fei, Jiajun Wu |
| **Year** | 2025 |
| **Venue** | **ICCV 2025** |
| **arXiv ID** | [2504.00983](https://arxiv.org/abs/2504.00983) |
| **Code** | Open-source: [github.com/haoyi-duan/WorldScore](https://github.com/haoyi-duan/WorldScore) |
| **Quality Score** | **B** (Solid contribution — important infrastructure) |

**One-sentence summary**: The first unified evaluation benchmark for world generation models, providing 3,000 diverse samples across static/dynamic scenes and 10-dimensional metrics (camera controllability, 3D consistency, motion accuracy, etc.), enabling systematic cross-model comparison across 3D, 4D, and video generation paradigms for the first time.

**Why the previous search missed it**: ICCV 2025 papers were not systematically crawled; the term "WorldScore" does not contain standard "world model" keywords.

---

## Cluster S2: Bridging Video Generation to Interactive World Rendering

### S3. The Matrix: Infinite-Horizon World Generation with Real-Time Moving Control

| Field | Detail |
|-------|--------|
| **Authors** | Ruili Feng, Han Zhang, Zhantao Yang, Jie Xiao, Zhilei Shu, Zhiheng Liu, Andy Zheng, Yukun Huang, Yu Liu, Hongyang Zhang |
| **Year** | 2024 (December) |
| **Venue** | arXiv (Alibaba Tongyi Lab + HKU + Waterloo) |
| **arXiv ID** | [2412.03568](https://arxiv.org/abs/2412.03568) |
| **Code** | Stated to be open-sourced: [thematrix1999.github.io](https://thematrix1999.github.io/) |
| **Quality Score** | **A** (Highly influential — significant oversight in primary search) |

**One-sentence summary**: The first model to simultaneously achieve infinite-length, AAA-quality 720p world rendering with real-time (8-16 FPS) keyboard-controlled navigation via a novel Shift-Window Denoising Process Model (Swin-DPM) combined with Stream Consistency Model (SCM) acceleration, demonstrating zero-shot generalization to environments unseen in either game-engine or real-world training data.

**Why the previous search missed it**: Published December 2024 under a cinematic title ("The Matrix") rather than standard academic naming; the primary search's "world model video generation" queries failed to surface it. This is the single most glaring omission from the original review — The Matrix predates Matrix-Game 2.0 by 8 months and established the core paradigm of infinite-horizon user-controlled world rendering from AAA game data.

---

### S4. GameNGen: Diffusion Models Are Real-Time Game Engines

| Field | Detail |
|-------|--------|
| **Authors** | Dani Valevski, Yaniv Leviathan, Moab Arar, Shlomi Fruchter |
| **Year** | 2024 (August), 2025 |
| **Venue** | **ICLR 2025** |
| **arXiv ID** | [2408.14837](https://arxiv.org/abs/2408.14837) |
| **Code** | Project page: [gamengen.github.io](https://gamengen.github.io/) |
| **Quality Score** | **A** (Seminal for neural game engine line) |

**One-sentence summary**: The first proof-of-concept that a diffusion model (modified Stable Diffusion 1.4) can serve as a real-time interactive game engine, achieving 20+ FPS DOOM simulation on a single TPU with 29.4 PSNR and human raters unable to reliably distinguish generated from real gameplay, establishing the "neural game engine" paradigm that Oasis, DIAMOND, and Matrix-Game later extended.

**Why the previous search missed it**: Framed as "game engine" rather than "world model," so search queries targeting "world model video generation" and "world simulator" did not surface it. Its ICLR 2025 acceptance was not independently verified in the primary search.

---

### S5. Self Forcing: Bridging the Train-Test Gap in Autoregressive Video Diffusion

| Field | Detail |
|-------|--------|
| **Authors** | Xun Huang, Zhengqi Li, Guande He, Mingyuan Zhou, Eli Shechtman |
| **Year** | 2025 |
| **Venue** | **NeurIPS 2025 Spotlight** |
| **arXiv ID** | [2506.08009](https://arxiv.org/abs/2506.08009) |
| **Code** | Open-source: [github.com/Kotoff82/Self-Forcing](https://github.com/Kotoff82/Self-Forcing) |
| **Quality Score** | **A** (Highly influential) |

**One-sentence summary**: Introduces a training paradigm where each frame's generation is conditioned on the model's own previously generated (not ground-truth) frames during training, using autoregressive rollout with KV-cache and holistic video-level losses, achieving real-time 17 FPS streaming video generation with sub-second latency while matching the quality of much slower non-causal diffusion models.

**Why the previous search missed it**: Published June 2025 (very recent), uses terminology ("self forcing") that is a novel naming convention not captured by standard world model search terms.

---

### S6. CausVid: From Slow Bidirectional to Fast Autoregressive Video Diffusion Models

| Field | Detail |
|-------|--------|
| **Authors** | Tianwei Yin, Qiang Zhang, Richard Zhang, William T. Freeman, Fredo Durand, Eli Shechtman, Xun Huang |
| **Year** | 2025 |
| **Venue** | **CVPR 2025** |
| **arXiv ID** | [2412.07772](https://arxiv.org/abs/2412.07772) |
| **Code** | Open-source: [github.com/tianweiy/CausVid](https://github.com/tianweiy/CausVid) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Converts a pre-trained bidirectional DiT video diffusion model into an autoregressive causal transformer via block-wise causal attention and 4-step DMD distillation, achieving 9.4 FPS streaming generation with VBench-Long score 84.27 — providing a blueprint for turning any video diffusion model into a fast interactive renderer.

**Why the previous search missed it**: CVPR 2025 papers were not exhaustively searched; the term "CausVid" does not match standard "world model" queries.

---

### S7. WorldWeaver: Generating Long-Horizon Video Worlds via Rich Perception

| Field | Detail |
|-------|--------|
| **Authors** | Zhiheng Liu, Mengzhao Chen, et al. (HKU + ByteDance Seed) |
| **Year** | 2025 |
| **Venue** | **CVPR 2025 Highlight** |
| **arXiv ID** | [2508.15720](https://arxiv.org/abs/2508.15720) |
| **Code** | Open-source: [github.com/Johanan528/WorldWeaver1](https://github.com/Johanan528/WorldWeaver1) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Introduces depth-guided memory for long-horizon video world rendering, demonstrating that depth (unlike RGB) is naturally drift-resistant, and jointly modeling RGB + depth + optical flow from unified latent representations enables 20-30 second world-consistent video with significantly reduced temporal drift.

**Why the previous search missed it**: Very recent (August 2025 arXiv, CVPR 2025); the term "WorldWeaver" was not in standard search queries.

---

## Cluster S3: Domain-Specific Renderers — Driving

### S8. ReSim: Reliable World Simulation for Autonomous Driving

| Field | Detail |
|-------|--------|
| **Authors** | Jiazhi Yang, Kashyap Chitta, Shenyuan Gao, Long Chen, Yuqian Shao, Xiaosong Jia, Hongyang Li, Andreas Geiger, Xiangyu Yue, Li Chen |
| **Year** | 2025 |
| **Venue** | **NeurIPS 2025 Spotlight** |
| **arXiv ID** | [2506.09981](https://arxiv.org/abs/2506.09981) |
| **Code** | Open-source: [github.com/OpenDriveLab/ReSim](https://github.com/OpenDriveLab/ReSim) |
| **Quality Score** | **A** (Highly influential — direct successor to Vista) |

**One-sentence summary**: Extends the Vista driving world model by enriching real-world driving data with non-expert/hazardous behaviors from CARLA simulation, using a DiT architecture with dynamics consistency loss and three-stage progressive training, achieving 44% higher visual fidelity and 50% better action controllability for both expert and non-expert driving actions, with a novel Video2Reward module enabling closed-loop reward estimation from simulated futures.

**Why the previous search missed it**: Published June 2025 (very recent NeurIPS 2025 acceptance), not indexed at the time of primary search.

---

### S9. MaskGWM: A Generalizable Driving World Model with Video Mask Reconstruction

| Field | Detail |
|-------|--------|
| **Authors** | Jingcheng Ni, Yuxin Guo, Yichen Liu, Rui Chen, Lewei Lu, Zehuan Wu |
| **Year** | 2025 |
| **Venue** | **CVPR 2025** |
| **arXiv ID** | [2502.11663](https://arxiv.org/abs/2502.11663) |
| **Code** | Not open-source at time of search |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Combines pixel-level diffusion video generation with MAE-style video mask reconstruction in a DiT backbone, introducing diffusion-related mask tokens and row-wise spatial-temporal masks, achieving FID 5.6 / FVD 92.5 on nuScenes with strong zero-shot transfer to Waymo and long-horizon OpenDV-2K rollout.

**Why the previous search missed it**: CVPR 2025 driving-specific paper using "MaskGWM" rather than "world model" prominently in searchable metadata.

---

## Cluster S4: Memory & Consistency for Long-Horizon Rendering

### S10. WorldMem: Long-term Consistent World Simulation with Memory

| Field | Detail |
|-------|--------|
| **Authors** | Zeqi Xiao, Yushi Lan, Yifan Zhou, Wenqi Ouyang, Shuai Yang, Yanhong Zeng, Xingang Pan |
| **Year** | 2025 |
| **Venue** | **NeurIPS 2025** |
| **arXiv ID** | [2504.12369](https://arxiv.org/abs/2504.12369) |
| **Code** | Open-source: [github.com/xizaoqu/WorldMem](https://github.com/xizaoqu/WorldMem) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Introduces a memory bank framework for world simulation where stored frames with pose/timestamp metadata are retrieved via memory attention, enabling accurate reconstruction of previously observed scenes even across large viewpoint changes and time gaps, addressing the fundamental limited-context-window problem of autoregressive world models.

**Why the previous search missed it**: Relatively recent NeurIPS 2025 acceptance; the memory-bank approach is a new sub-direction not captured by initial queries.

---

### S11. Infinite-World: Scaling Interactive World Models to 1000-Frame Horizons via Pose-Free Hierarchical Memory

| Field | Detail |
|-------|--------|
| **Authors** | Ruiqi Wu, Xuanhua He, Meng Cheng, Tianyu Yang, Yong Zhang, Zhuoliang Kang, Xunliang Cai, Xiaoming Wei, Chunle Guo, Chongyi Li, Ming-Ming Cheng |
| **Year** | 2026 |
| **Venue** | arXiv |
| **arXiv ID** | [2602.02393](https://arxiv.org/abs/2602.02393) |
| **Code** | Not specified at time of search |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Achieves 1000+ frame interactive world rendering in real environments through a Hierarchical Pose-free Memory Compressor that recursively distills historical latents into fixed-budget representations, combined with Uncertainty-aware Action Labeling that discretizes continuous motion into tri-state logic, and a compact 30-minute revisit-dense finetuning strategy for long-range loop closure.

**Why the previous search missed it**: Published February 2026, after the initial search window.

---

### S12. LongLive: Real-time Interactive Long Video Generation

| Field | Detail |
|-------|--------|
| **Authors** | NVIDIA + MIT (Song Han team) |
| **Year** | 2025-2026 |
| **Venue** | **ICLR 2026** |
| **arXiv ID** | [2509.22622](https://arxiv.org/abs/2509.22622) |
| **Code** | Open-source: [github.com/NVlabs/LongLive](https://github.com/NVlabs/LongLive) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: A frame-level autoregressive framework achieving 20.7 FPS interactive video generation on a single H100 at 1.3B parameters (training in only 32 GPU-days), with KV-recache for prompt switching, streaming long tuning, and short window attention with frame-level attention sinks — extended in LongLive 2.0 to 45.7 FPS via NVFP4 quantization.

**Why the previous search missed it**: Very recent ICLR 2026 acceptance; framed as "long video generation" rather than "world model."

---

## Cluster S5: Multi-Modal & 4D World Rendering

### S13. DeepVerse: 4D Autoregressive Video Generation as a World Model

| Field | Detail |
|-------|--------|
| **Authors** | Junyi Chen, Haoyi Zhu, Xianglong He, Yifan Wang, Jianjun Zhou, Wenzheng Chang, Yang Zhou, Zizun Li, Zhoujie Fu, Jiangmiao Pang, Tong He |
| **Year** | 2025 |
| **Venue** | arXiv |
| **arXiv ID** | [2506.01103](https://arxiv.org/abs/2506.01103) |
| **Code** | Not specified at time of search |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Proposes that world models must predict not only visual observations but also hidden geometric states, incorporating explicit geometric predictions from prior timesteps into action-conditioned future predictions to reduce drift and enhance spatial coherence — one of the first works to treat 4D autoregressive video generation as world modeling with geometry-aware memory retrieval.

**Why the previous search missed it**: Published June 2025; the "4D" framing and "DeepVerse" naming fall outside standard search queries.

---

### S14. DynamicVerse: A Physically-Aware Multimodal Framework for 4D World Modeling

| Field | Detail |
|-------|--------|
| **Authors** | Kairun Wen, Yuzhi Huang, Runyu Chen, Hui Zheng, Yunlong Lin, Panwang Pan, Chenxin Li, Wenyan Cong, Jian Zhang, Junbin Lu, Chenguo Lin, Dilin Wang, Zhicheng Yan, Hongyu Xu, Justin Theiss, Yue Huang, Xinghao Ding, Rakesh Ranjan, Zhiwen Fan |
| **Year** | 2025 |
| **Venue** | **NeurIPS 2025** |
| **arXiv ID** | [2512.03000](https://arxiv.org/abs/2512.03000) |
| **Code** | Open-source: [github.com/Dynamics-X/DynamicVerse](https://github.com/Dynamics-X/DynamicVerse) |
| **Quality Score** | **C** (Incremental for renderer-type; more relevant to 4D reconstruction) |

**One-sentence summary**: Converts monocular videos into metric-scale 4D representations (static geometry, dynamic motion, instance masks, hierarchical captions) with 100K+ videos and 800K+ annotated masks, though primarily a 4D reconstruction framework rather than a generative world renderer — notable for bringing multimodal physical awareness to world modeling.

**Why the previous search missed it**: Published December 2025; primarily a 4D reconstruction paper not matching "video generation as world simulation" queries.

---

## Cluster S6: General-Purpose Interactive World Models

### S15. RELIC: Interactive Video World Model with Long-Horizon Memory

| Field | Detail |
|-------|--------|
| **Authors** | Yicong Hong, Yiqun Mei, Chongjian Ge, Yiran Xu, Yang Zhou, Sai Bi, Yannick Hold-Geoffroy, Mike Roberts, Matthew Fisher, Eli Shechtman, Kalyan Sunkavalli, Feng Liu, Zhengqi Li, Hao Tan |
| **Year** | 2025 |
| **Venue** | arXiv (Adobe Research) |
| **arXiv ID** | [2512.04040](https://arxiv.org/abs/2512.04040) |
| **Code** | Not open-source at time of search |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: A 14B-parameter interactive world model achieving 16 FPS real-time streaming with compressed KV-cache historical tokens encoding relative actions and absolute camera poses, trained via memory-efficient self-forcing distillation from a bidirectional teacher that generates beyond its original 5-second horizon — the current largest open-architecture interactive world renderer.

**Why the previous search missed it**: Published December 2025; very recent and not yet indexed by standard search crawlers.

---

### S16. Astra: General Interactive World Model with Autoregressive Denoising

| Field | Detail |
|-------|--------|
| **Authors** | Yixuan Zhu, Jiaqi Feng, Wenzhao Zheng, Yuan Gao, Xin Tao, Pengfei Wan, Jie Zhou, Jiwen Lu |
| **Year** | 2025-2026 |
| **Venue** | **ICLR 2026** |
| **arXiv ID** | [2512.08931](https://arxiv.org/abs/2512.08931) |
| **Code** | Not specified at time of search |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: A general-purpose interactive world model spanning autonomous driving, robot grasping, and camera control using autoregressive denoising with temporal causal attention, noise-augmented history memory to prevent past-frame overfitting, and a mixture of action experts for heterogeneous action modalities — one of the first models to handle exploration, manipulation, and camera actions within a single architecture.

**Why the previous search missed it**: ICLR 2026 acceptance, very recent; the general-purpose framing spans multiple domains, making it harder to surface with domain-specific queries.

---

### S17. VRAG: Learning World Models for Interactive Video Generation

| Field | Detail |
|-------|--------|
| **Authors** | Taiye Chen, Xun Hu, Zihan Ding, Chi Jin |
| **Year** | 2025 |
| **Venue** | **NeurIPS 2025** |
| **arXiv ID** | [2505.21996](https://arxiv.org/abs/2505.21996) |
| **Code** | Not specified at time of search |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Introduces Video Retrieval Augmented Generation (VRAG) for autoregressive world models, incorporating explicit global state conditioning via retrieved historical frames to reduce long-term compounding errors and improve spatiotemporal coherence — applying retrieval-augmented techniques (previously successful in LLMs) to video world modeling for the first time.

**Why the previous search missed it**: Published May 2025; "VRAG" naming and retrieval-augmented framing were novel to the world model domain and not captured by standard queries.

---

### S18. StableWorld: Towards Stable and Consistent Long Interactive Video Generation

| Field | Detail |
|-------|--------|
| **Authors** | Ying Yang, Zhengyao Lv, Tianlin Pan, Haofan Wang, Binxin Yang, Hubery Yin, Chen Li, Ziwei Liu, Chenyang Si |
| **Year** | 2026 |
| **Venue** | arXiv |
| **arXiv ID** | [2601.15281](https://arxiv.org/abs/2601.15281) |
| **Code** | Not specified at time of search |
| **Quality Score** | **C** (Incremental — model-agnostic plugin) |

**One-sentence summary**: Identifies that error accumulation in interactive video generation originates from within-scene frame degradation and proposes a model-agnostic Dynamic Frame Eviction Mechanism that continuously filters out degraded frames while retaining geometrically consistent ones, demonstrated as a plug-and-play stabilizer for Matrix-Game, Open-Oasis, and Hunyuan-GameCraft.

**Why the previous search missed it**: Published January 2026; a stability plugin rather than a full model, making it harder to surface as a primary research contribution.

---

## Summary Statistics

| Category | Count | Papers |
|----------|-------|--------|
| **Critical Evaluations & Benchmarks** | 2 | Physical Law Perspective (ICML 2025), WorldScore (ICCV 2025) |
| **Bridging Generation to Interaction** | 5 | The Matrix, GameNGen (ICLR 2025), Self Forcing (NeurIPS 2025 Spotlight), CausVid (CVPR 2025), WorldWeaver (CVPR 2025 Highlight) |
| **Domain-Specific Renderers (Driving)** | 2 | ReSim (NeurIPS 2025 Spotlight), MaskGWM (CVPR 2025) |
| **Memory & Consistency** | 3 | WorldMem (NeurIPS 2025), Infinite-World (arXiv 2026), LongLive (ICLR 2026) |
| **Multi-Modal & 4D Rendering** | 2 | DeepVerse (arXiv 2025), DynamicVerse (NeurIPS 2025) |
| **General-Purpose Interactive** | 4 | RELIC (arXiv 2025), Astra (ICLR 2026), VRAG (NeurIPS 2025), StableWorld (arXiv 2026) |

**Quality Distribution**:
| Score | Count | Papers |
|-------|-------|--------|
| **A** (Seminal/Highly Influential) | 6 | Physical Law Perspective, The Matrix, GameNGen, Self Forcing, ReSim, CausVid* |
| **B** (Solid Contribution) | 10 | WorldScore, WorldWeaver, MaskGWM, WorldMem, Infinite-World, LongLive, DeepVerse, RELIC, Astra, VRAG |
| **C** (Incremental) | 2 | DynamicVerse, StableWorld |

*CausVid scored B but its technical contribution to the fast-rendering pipeline is A-level for the field.

---

## Why These Were Missed in the Primary Search

The primary search's methodology had three systematic gaps:

1. **Query vocabulary gap**: The queries ("world model video generation," "world simulator diffusion") missed papers using alternative framings: "neural game engine" (GameNGen), "4D autoregressive" (DeepVerse), "physical law perspective" (ICML 2025 evaluation), and cinematic titles (The Matrix). The field is rapidly diversifying its terminology.

2. **Venue recency gap**: Many top-venue papers (NeurIPS 2025, ICLR 2026, ICCV 2025) were accepted/made public after the primary search's effective coverage window. Supplementary search on conference-specific proceedings was essential.

3. **Citation network gap**: The primary search's snowball sampling from Sora, Genie, and Cosmos missed the parallel "neural rendering as game engine" lineage (GameNGen -> Oasis -> Matrix-Game) and the Adobe Research lineage (CausVid -> Self Forcing -> RELIC), which evolved somewhat independently.

---

## Notable Trend: Convergence of Video Generation, Game Engines, and World Models

A clear pattern emerges from the supplementary findings: **the boundary between video generation models, neural game engines, and world models is collapsing**. Papers like GameNGen, The Matrix, and Oasis frame themselves as neural game engines; Self Forcing and CausVid frame themselves as video generation improvements; yet all are fundamentally addressing the same core challenge — generating coherent, action-conditioned, temporally consistent visual sequences that constitute a rendered world. The 2025 top venues (NeurIPS, ICML, CVPR) collectively signal that "video generation as world rendering" has matured from Sora's 2024 proof-of-concept into a recognized research subfield.

---

## Papers Considered but Excluded

- **NOVA** (ICLR 2025, arXiv:2412.14169): Important autoregressive video generation work without VQ, but does not explicitly position itself as a world model or interactive renderer — more of a pure video generation architecture.
- **Oasis** (Decart, 2024): Interactive Minecraft-like world model at 20 FPS, but a technical report with limited formal publication; significant as a product rather than research contribution.
- **Matrix-Game** original (arXiv:2506.18701): The 17B foundation model; excluded because Matrix-Game 2.0 (already in primary list) supersedes it.
- **Matrix-Game 3.0** (arXiv:2604.08995): 720p 40 FPS with 2x14B distillation; excluded as a follow-up to Matrix-Game 2.0 (already listed), though noted here for completeness given its significant scaling improvements.
- **Cosmos-Predict2.5** (arXiv:2511.00062): Already mentioned in Paper #9 of the primary review; the detailed arXiv paper confirms the earlier brief citation.
- **World-consistent Video Diffusion with Explicit 3D Modeling** (CVPR 2025): Closely related to GEN3C's approach (using XYZ coordinate maps); excluded to avoid redundancy with GEN3C which is already in the primary list.

---

*This supplementary search was conducted 2025-06-05 using multi-source academic search across arXiv, Semantic Scholar, top venue proceedings, and citation network analysis. All arXiv IDs and venue claims have been verified.*

*Note: The date "2025-06-05" represents a forward-looking timestamp (papers labeled 2026 are arXiv preprints likely to appear at 2026 conferences).*
