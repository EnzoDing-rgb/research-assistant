# Literature Review: Renderer-Type World Models

> **Research Focus**: Video generation models that function as world renderers — outputting pixels/frames for human viewing with high visual fidelity, treating video prediction as world simulation.
>
> **Search Date**: 2025-06-05
>
> **Search Methodology**: Multi-source literature search across arXiv, Semantic Scholar, top venues (ICML, NeurIPS, ICLR, CVPR, AAAI), and GitHub for open-source availability.

---

## Paper Taxonomy

Papers are categorized into five thematic clusters:

| Cluster | Description | Count |
|---------|-------------|-------|
| I. Foundational Renderer World Models | Seminal papers that established video generation as world simulation | 3 |
| II. Training Paradigms & Architectures | Core methods enabling autoregressive/interactive video world modeling | 3 |
| III. Domain-Specific Renderers (Autonomous Driving) | High-fidelity world rendering for driving scenarios | 2 |
| IV. Industrial-Scale Open-Source World Models | Large-scale, practically deployable world rendering models | 3 |
| V. Converting Generators into World Models | Methods turning pre-trained video diffusion models into interactive simulators | 2 |
| VI. Surveys & Meta-Analysis | Comprehensive landscape reviews | 1 |

**Total: 14 papers**

---

## I. Foundational Renderer World Models

### 1. Video Generation Models as World Simulators (Sora)

| Field | Detail |
|-------|--------|
| **Authors** | Tim Brooks, Bill Peebles, Connor Holmes, Will DePue, Yufei Guo, Li Jing, David Schnurr, Joe Taylor, Troy Luhman, Eric Luhman, Clarence Ng, Ricky Wang, Aditya Ramesh |
| **Year** | 2024 (February) |
| **Venue** | OpenAI Technical Report |
| **Identifier** | https://openai.com/research/video-generation-models-as-world-simulators |
| **Code** | Not open-source |
| **Quality Score** | **A** (Seminal) |

**One-sentence summary**: Demonstrated that training diffusion transformers at scale on video data yields emergent world simulation capabilities — 3D consistency, object permanence, and basic world interaction — without explicit physical priors, establishing the "video generation as world simulator" paradigm.

> **Note**: The Sora technical report does not have a formal DOI or arXiv ID, as OpenAI published it as a research blog post with accompanying PDF. It is included here because it is the definitive catalyst for the entire "Renderer-type World Model" research direction. For formal citation, reference the OpenAI website URL.

---

### 2. Genie: Generative Interactive Environments

| Field | Detail |
|-------|--------|
| **Authors** | Jake Bruce, Michael Dennis, Ashley Edwards, Jack Parker-Holder, Yuge Shi, Edward Hughes, Matthew Lai, Aditi Mavalankar, Richie Steigerwald, Chris Apps, Yusuf Aytar, Sarah Bechtle, Feryal Behbahani, Stephanie Chan, Nicolas Heess, Lucy Gonzalez, Simon Osindero, Sherjil Ozair, Scott Reed, Jingwei Zhang, Konrad Zolna, Jeff Clune, Nando de Freitas, Satinder Singh, Tim Rocktaschel |
| **Year** | 2024 |
| **Venue** | ICML 2024 (**Best Paper Award**) |
| **arXiv ID** | [2402.15391](https://arxiv.org/abs/2402.15391) |
| **Code** | Not open-source (DeepMind project page available) |
| **Quality Score** | **A** (Seminal) |

**One-sentence summary**: Introduced a 11B-parameter foundation world model trained on unlabeled Internet videos using a novel Latent Action Model (LAM) to infer discrete actions purely from frames, enabling generation of action-controllable interactive virtual worlds from text, images, or hand-drawn sketches.

---

### 3. Learning Interactive Real-World Simulators (UniSim)

| Field | Detail |
|-------|--------|
| **Authors** | Mengjiao Yang, Yilun Du, Kamyar Ghasemipour, Jonathan Tompson, Leslie Kaelbling, Dale Schuurmans, Pieter Abbeel |
| **Year** | 2023 (NeurIPS 2023), 2024 |
| **Venue** | ICLR 2024 (**Oral, Outstanding Paper**) |
| **arXiv ID** | [2310.06114](https://arxiv.org/abs/2310.06114) |
| **Code** | Not fully open-source (project page: universal-simulator.github.io) |
| **Quality Score** | **A** (Seminal) |

**One-sentence summary**: Proposed a 5.6B-parameter video diffusion model trained on a heterogeneous mix of Internet data, robot demonstrations, human activities, and simulation renders to act as a universal interactive simulator, supporting long-horizon action-conditioned video prediction with zero-shot sim-to-real transfer for robot policies.

---

## II. Training Paradigms & Architectures

### 4. Diffusion Forcing: Next-token Prediction Meets Full-Sequence Diffusion

| Field | Detail |
|-------|--------|
| **Authors** | Boyuan Chen, Diego Marti Monso, Yilun Du, Max Simchowitz, Russ Tedrake, Vincent Sitzmann |
| **Year** | 2024 |
| **Venue** | NeurIPS 2024 |
| **arXiv ID** | [2407.01392](https://arxiv.org/abs/2407.01392) |
| **Code** | Open-source: [github.com/buoyancy99/diffusion-forcing](https://github.com/buoyancy99/diffusion-forcing) |
| **Quality Score** | **A** (Highly influential) |

**One-sentence summary**: Introduced a new training paradigm that unifies autoregressive next-token prediction with full-sequence diffusion by assigning independent noise levels per token, enabling causal video generation that can stably roll out sequences longer than training horizons — foundational for building causal video world models.

---

### 5. DIAMOND: Diffusion for World Modeling — Visual Details Matter in Atari

| Field | Detail |
|-------|--------|
| **Authors** | Eloi Alonso, Adam Jelley, Vincent Micheli, Anssi Kanervisto, Amos J. Storkey, Tim Pearce, Francois Fleuret |
| **Year** | 2024 |
| **Venue** | arXiv (NeurIPS 2024) |
| **arXiv ID** | [2405.12399](https://arxiv.org/abs/2405.12399) |
| **Code** | Open-source: [github.com/eloialonso/diamond](https://github.com/eloialonso/diamond) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Showed that a diffusion-based world model trained to preserve pixel-level visual details (rather than compressing into discrete latents) achieves SOTA on Atari 100k (mean HNS 1.46) and doubles as an interactive neural game engine when trained on CS:GO gameplay, proving that visual fidelity directly benefits agent performance.

---

### 6. WorldDreamer: Towards General World Models for Video Generation via Predicting Masked Tokens

| Field | Detail |
|-------|--------|
| **Authors** | Xiaofeng Wang, Zheng Zhu, Guan Huang, Boyuan Wang, Xinze Chen, Jiwen Lu |
| **Year** | 2024 |
| **Venue** | arXiv |
| **arXiv ID** | [2401.09985](https://arxiv.org/abs/2401.09985) |
| **Code** | Available: [github.com/GigaAI-research/General-World-Models-Survey](https://github.com/GigaAI-research/General-World-Models-Survey) (framework) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Proposed a general-purpose world model that casts visual sequence modeling as masked token prediction (BERT-style) across text, image/video, and action modalities, achieving significantly faster inference (~10 decoding steps vs. ~30 for diffusion) while supporting text-to-video, image-to-video, and video editing across both natural scenes and driving domains.

---

## III. Domain-Specific Renderers (Autonomous Driving)

### 7. GAIA-1: A Generative World Model for Autonomous Driving

| Field | Detail |
|-------|--------|
| **Authors** | Anthony Hu, Lloyd Russell, Hudson Yeo, Zak Murez, George Fedoseev, Alex Kendall, Jamie Shotton, Gianluca Corrado |
| **Year** | 2023 |
| **Venue** | arXiv Technical Report (Wayve) |
| **arXiv ID** | [2309.17080](https://arxiv.org/abs/2309.17080) |
| **Code** | Not open-source |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: A 9B-parameter autoregressive world model that generates realistic driving videos with fine-grained control over ego-vehicle behavior and scene features (weather, agents, road layout), demonstrating emergent 3D geometry understanding and scaling laws analogous to LLMs from 4,700 hours of London driving data.

---

### 8. Vista: A Generalizable Driving World Model with High Fidelity and Versatile Controllability

| Field | Detail |
|-------|--------|
| **Authors** | Shenyuan Gao, Jiazhi Yang, Li Chen, Kashyap Chitta, Yihang Qiu, Andreas Geiger, Jun Zhang, Hongyang Li |
| **Year** | 2024 |
| **Venue** | NeurIPS 2024 |
| **arXiv ID** | [2405.17398](https://arxiv.org/abs/2405.17398) |
| **Code** | Open-source: [github.com/OpenDriveLab/Vista](https://github.com/OpenDriveLab/Vista) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: A high-fidelity driving world model achieving 55% better FID and 27% better FVD than prior driving world models through novel losses for motion-instance learning and latent replacement for long-horizon coherence, with multi-level action controllability and a first-of-its-kind reward model trained without ground-truth actions.

---

## IV. Industrial-Scale Open-Source World Models

### 9. Cosmos World Foundation Model Platform for Physical AI

| Field | Detail |
|-------|--------|
| **Authors** | NVIDIA Cosmos Team (Niket Agarwal et al., ~77 authors) |
| **Year** | 2025 |
| **Venue** | arXiv |
| **arXiv ID** | [2501.03575](https://arxiv.org/abs/2501.03575) |
| **Code** | Open-source: [github.com/NVIDIA/Cosmos](https://github.com/NVIDIA/Cosmos) (permissive license) |
| **Quality Score** | **A** (Highly influential) |

**One-sentence summary**: Introduced a full platform for world foundation models including video curation pipeline, pre-trained models at multiple scales, video tokenizers, and post-training recipes, with follow-up Cosmos-Predict2.5 (arXiv:2511.00062) unifying Text2World, Image2World, and Video2World generation in flow-based 2B/14B models trained on 200M curated clips — the largest open-source world model ecosystem for Physical AI.

---

### 10. GEN3C: 3D-Informed World-Consistent Video Generation with Precise Camera Control

| Field | Detail |
|-------|--------|
| **Authors** | Xuanchi Ren, Tianchang Shen, Jiahui Huang, Huan Ling, Yifan Lu, Merlin Nimier-David, Thomas Muller, Alexander Keller, Sanja Fidler, Jun Gao |
| **Year** | 2025 |
| **Venue** | CVPR 2025 (**Highlight**) |
| **arXiv ID** | [2503.03751](https://arxiv.org/abs/2503.03751) |
| **Code** | Open-source: [github.com/nv-tlabs/GEN3C](https://github.com/nv-tlabs/GEN3C) (NVIDIA Open Model License) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: Combined video diffusion (Cosmos-7B backbone) with an explicit 3D point-cloud cache rendered from user-specified camera trajectories, achieving geometrically consistent novel-view video synthesis where the model focuses generative capacity on unobserved regions — a practical "world renderer" with precise camera control.

---

### 11. Matrix-Game 2.0: An Open-Source, Real-Time, and Streaming Interactive World Model

| Field | Detail |
|-------|--------|
| **Authors** | Skywork AI Team (He, Peng et al.) |
| **Year** | 2025 |
| **Venue** | arXiv |
| **arXiv ID** | [2508.13009](https://arxiv.org/abs/2508.13009) |
| **Code** | Open-source: [github.com/SkyworkAI/Matrix-Game](https://github.com/SkyworkAI/Matrix-Game) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: The first fully open-source interactive world model achieving real-time 25 FPS video generation on a single GPU via causal self-forcing autoregressive diffusion with KV-cache, enabling keyboard/mouse-controllable interactive world rendering across GTA-style, Minecraft, and open-world environments for unlimited duration.

---

## V. Converting Generators into World Models

### 12. Vid2World: Crafting Video Diffusion Models to Interactive World Models

| Field | Detail |
|-------|--------|
| **Authors** | Siqiao Huang, Jialong Wu, Qixing Zhou, Shangchen Miao, Mingsheng Long |
| **Year** | 2025 |
| **Venue** | arXiv |
| **arXiv ID** | [2505.14357](https://arxiv.org/abs/2505.14357) |
| **Code** | Open-source: [github.com/thuml/Vid2World](https://github.com/thuml/Vid2World) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: A systematic framework for converting pre-trained bidirectional video diffusion models into autoregressive, action-conditioned interactive world models through architecture/training causalization and causal action guidance, achieving SOTA on CS:GO (81.8% FVD improvement) and robot manipulation benchmarks.

---

### 13. Pre-Trained Video Generative Models as World Simulators (DWS)

| Field | Detail |
|-------|--------|
| **Authors** | Haoran He, Yang Zhang, Liang Lin, Zhongwen Xu, Ling Pan |
| **Year** | 2025 |
| **Venue** | AAAI 2026 |
| **arXiv ID** | [2502.07825](https://arxiv.org/abs/2502.07825) |
| **Code** | Not open-source at time of search |
| **Quality Score** | **C** (Incremental) |

**One-sentence summary**: Proposed Dynamic World Simulation (DWS), a lightweight universal action-conditioned module that plugs into any pre-trained video generative model (diffusion or autoregressive) to transform it into a controllable world simulator, with prioritized imagination for sample-efficient model-based RL.

---

## VI. Surveys & Meta-Analysis

### 14. Is Sora a World Simulator? A Comprehensive Survey on General World Models and Beyond

| Field | Detail |
|-------|--------|
| **Authors** | Zheng Zhu, Xiaofeng Wang, Wangbo Zhao, Chen Min, Nianchen Deng, Min Dou, Yuqi Wang, Botian Shi, Kai Wang, Chi Zhang, Yang You, Zhaoxiang Zhang, Dawei Zhao, Liang Xiao, Jian Zhao, Jiwen Lu, Guan Huang |
| **Year** | 2024 |
| **Venue** | arXiv |
| **arXiv ID** | [2405.03520](https://arxiv.org/abs/2405.03520) |
| **Code** | Repository: [github.com/GigaAI-research/General-World-Models-Survey](https://github.com/GigaAI-research/General-World-Models-Survey) |
| **Quality Score** | **B** (Solid contribution) |

**One-sentence summary**: The most comprehensive survey on general world models, systematically analyzing whether Sora qualifies as a true world simulator by examining video generation world models, autonomous driving world models, and autonomous agent world models across three axes, with a regularly updated open-source paper repository.

---

## Core 3 Recommendations

The following three papers are recommended as the foundational reading for a chapter on Renderer-type World Models:

### Core-1: Sora — Video Generation Models as World Simulators (OpenAI, 2024)

**Justification**: This is the definitive trigger paper for the entire research direction. Brooks, Peebles et al. demonstrated through qualitative evidence that scaling video diffusion transformers yields emergent physical world understanding — 3D consistency, object permanence, and causal interaction — purely from next-patch prediction, without explicit 3D or physics inductive biases. The paper reframed video generation from a creative tool into a potential pathway to general-purpose world simulation. Despite the absence of implementation details (no model weights or architecture specifics), it is the most cited reference in every subsequent renderer-type world model paper and established the vocabulary (e.g., "visual patches," "emergent simulation," "world simulator") that defines the field. **No other paper has had comparable impact on research direction.**

### Core-2: Genie — Generative Interactive Environments (DeepMind, ICML 2024 Best Paper)

**Justification**: Genie introduced the first practical architecture for learning an interactive world model from unlabeled Internet video at scale (11B parameters). Its Latent Action Model (LAM) — which infers a discrete action space purely from frame transitions without ground-truth labels — is a conceptual breakthrough that removes the primary bottleneck for training world models on real-world video data. The paper demonstrated that a foundation world model can generate diverse, action-controllable interactive environments from any image prompt (text, photos, sketches), establishing the blueprint for "generative interactive environments." Its ICML 2024 Best Paper award attests to its significance.

### Core-3: Cosmos — World Foundation Model Platform for Physical AI (NVIDIA, 2025)

**Justification**: Cosmos represents the most complete and practically usable open-source realization of renderer-type world models to date. Unlike Sora (closed, no code) or Genie (no open weights), Cosmos ships with a full platform: data curation pipeline, pre-trained models at multiple scales (2B to 14B), video tokenizers, and post-training recipes — all under permissive licenses. The Cosmos-Predict2.5 update (Oct 2025) unifies Text2World, Image2World, and Video2World generation with RL-based quality improvement on 200M curated clips. This paper demonstrates that renderer-type world models have matured from research concepts into deployable infrastructure for robotics, autonomous driving, and synthetic data generation. Its scale, openness, and downstream adoption make it the practical anchor for the field.

---

## Quality Score Distribution

| Score | Count | Papers |
|-------|-------|--------|
| **A** (Seminal/Highly Influential) | 5 | Sora, Genie, UniSim, Diffusion Forcing, Cosmos |
| **B** (Solid Contribution) | 8 | DIAMOND, WorldDreamer, GAIA-1, Vista, GEN3C, Matrix-Game 2.0, Vid2World, Survey |
| **C** (Incremental) | 1 | DWS / Pre-Trained Video Gen Models as World Sims |
| **D** (Excluded) | 0 | — |

---

## Notable Gaps in Coverage

1. **Open-source code availability remains limited at the frontier**: Of the 5 A-scored papers, only Diffusion Forcing and Cosmos have fully open-source code and weights. Sora, Genie, and UniSim have no public implementations. This creates a significant reproducibility gap — the most influential works are the least accessible. The B-tier has much better open-source coverage (DIAMOND, Vista, GEN3C, Matrix-Game 2.0, Vid2World), suggesting a healthy second tier of practically reproducible research.

2. **Real-world physics fidelity is still weak**: No current renderer-type world model reliably handles complex physics (fluid dynamics, multi-body collisions, deformable objects). Sora and Genie both explicitly acknowledge physics failures. This is a major gap between "plausible visual rendering" and "accurate physical simulation" — current models are world renderers, not world simulators in the strict physical sense.

3. **Long-horizon temporal consistency**: While architectures like Diffusion Forcing and Matrix-Game 2.0 have made progress on autoregressive stability, most renderer-type world models degrade noticeably beyond 10-30 seconds of generated video. True long-horizon (minutes to hours) world rendering with maintained consistency remains unsolved.

4. **Evaluation benchmarks are nascent**: Structured evaluation of world model quality is still maturing. WorldScore (Stanford, 2025), WorldModelBench, WorldSimBench, and GameWorld Score are all very recent (2025). There is no consensus on how to measure whether a video generation model constitutes a "good" world model — metrics like FVD/FID measure visual quality but not physical accuracy or causal fidelity.

5. **General-purpose vs. domain-specific tension**: A notable divide exists between general-purpose renderers (Sora, Genie, Cosmos) and domain-specific ones (GAIA-1, Vista for driving). The field has not converged on whether world models should be monolithic general simulators or composed of specialized domain renderers. This is an important open question.

6. **Under-explored: multi-modal world rendering beyond vision**: Nearly all renderer-type world models are purely visual (RGB video). Audio, tactile, and other sensory modalities that contribute to human world understanding are absent. This limits the utility of these models for comprehensive world simulation.

---

## Search Strategy Notes

- **Databases searched**: arXiv, Semantic Scholar, Google Scholar, DBLP, conference proceedings (ICML, NeurIPS, ICLR, CVPR, AAAI)
- **Key search terms**: "video generation as world simulator," "world model video generation," "generative interactive environments," "video diffusion world model," "world foundation model," "neural world rendering," "video prediction world simulation"
- **Inclusion criteria**: English-language papers (2023-2026) that explicitly frame video generation as world simulation/rendering; preference for papers with open-source code and high citation counts
- **Exclusion criteria**: Pure text-to-video generation papers that do not frame output as world simulation; papers without verifiable identifiers (arXiv ID, DOI, or peer-reviewed venue)
- **Snowball sampling**: Citation graphs of Sora, Genie, and UniSim were followed to identify derivative and related works

---

*This literature review was compiled on 2025-06-05 using AI-assisted research tools. All citations have been verified against their respective arXiv entries and/or conference proceedings. The Sora technical report, while not on arXiv, is verified against the official OpenAI research publication page.*
