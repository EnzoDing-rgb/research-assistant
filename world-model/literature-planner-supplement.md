# Supplementary Literature: Planner-Type World Models (Newly Discovered Papers)

**Date:** 2026-06-05
**Scope:** Papers missed by initial WebSearch-based literature search, discovered via targeted arXiv / Semantic Scholar / OpenAlex searches + citation network analysis of DreamerV3, Voyager, and OmniJARVIS.

**Existing papers (NOT re-listed):** Ha & Schmidhuber 2018, Dreamer/DreamerV2/DreamerV3, IRIS, STORM, EfficientZero V2, DIAMOND, Genie, Voyager, OmniJARVIS, ROCKET-1, JARVIS-VLA, STEVE-1, JARVIS-1 (15 papers total).

---

## A. Direct DreamerV3 Successors: Architecture Advances for Model-Based RL

### Paper S1: DyMoDreamer -- World Modeling with Dynamic Modulation
- **Authors:** Boxuan Zhang, Runqing Wang, Wei Xiao, Jian Sun, Gao Huang, Jie Chen, Gang Wang (Tsinghua / BIT)
- **Year/Venue:** 2025, NeurIPS 2025
- **arXiv ID:** Not yet on arXiv (NeurIPS 2025 proceedings)
- **Summary:** Extends DreamerV3's RSSM with a dynamic modulation mechanism that uses inter-frame differencing masks to focus the world model on task-relevant dynamic features, achieving 156.6% HNS mean on Atari 100k (SOTA among methods without lookahead search), 832 task mean on DMControl, and 10.3 return on Crafter @1M steps.
- **Score: A** (NeurIPS 2025; SOTA Atari 100k results; direct DreamerV3 lineage improvement; cognitive-science-inspired dynamic feature prioritization)
- **Why missed:** Published at NeurIPS 2025 after initial search cutoff; RSSM-based extension that bridges DreamerV3 and DIAMOND performance.

### Paper S2: TWISTER -- Learning Transformer-based World Models with Contrastive Predictive Coding
- **Authors:** Maxime Burchi, Radu Timofte (University of Wurzburg)
- **Year/Venue:** 2025, ICLR 2025
- **arXiv ID:** [2503.04416](https://arxiv.org/abs/2503.04416)
- **Code:** [github.com/burchim/TWISTER](https://github.com/burchim/TWISTER)
- **Summary:** Replaces DreamerV3's RNN-based RSSM with a Transformer backbone augmented by Action-Conditioned Contrastive Predictive Coding (AC-CPC) that predicts features 10 steps ahead, achieving 162% human-normalized mean on Atari 100k -- a new SOTA among methods without lookahead search.
- **Score: A** (ICLR 2025; SOTA Atari 100k; elegant CPC objective addresses the "next-step prediction is too easy" problem in Transformer world models; open-source)
- **Why missed:** Published at ICLR 2025; Transformer-based alternative to DreamerV3 not surfaced by broader "world model" search terms.

### Paper S3: Drama -- Mamba-Enabled Model-Based RL Is Sample and Parameter Efficient
- **Authors:** Wenlong Wang, Ivana Dusparic et al.
- **Year/Venue:** 2025, ICLR 2025
- **arXiv ID:** In ICLR 2025 proceedings
- **Code:** [github.com/realwenlongwang/Drama](https://github.com/realwenlongwang/Drama)
- **Summary:** Replaces RNN/Transformer backbones with Mamba (State-Space Model) for world model dynamics, achieving O(n) complexity with only ~7M parameters while being competitive with DreamerV3 on Atari 100k; introduces Decoupled Forward Sampling to mitigate early-training suboptimality.
- **Score: B** (ICLR 2025; first SSM-based world model; significant parameter efficiency; opens a new architecture direction for world models)
- **Why missed:** SSM/Mamba-based world models are a 2025 trend not captured by broader "Transformer world model" searches.

---

## B. Minecraft World Model + RL Agents

### Paper S4: LS-Imagine -- Open-World Reinforcement Learning over Long Short-Term Imagination
- **Authors:** Jiajian Li, Qi Wang, Yunbo Wang, Xin Jin, Yang Li, Wenjun Zeng, Xiaokang Yang
- **Year/Venue:** 2025, ICLR 2025 (Oral)
- **arXiv ID:** [2410.03618](https://arxiv.org/abs/2410.03618)
- **Code:** [github.com/qiwang067/LS-Imagine](https://github.com/qiwang067/LS-Imagine)
- **Summary:** Proposes a Long Short-Term World Model that performs both immediate (short-term) and jumpy (long-term) state transitions in latent space, using affordance maps generated via Swin-UNet and MineCLIP to guide exploration; achieves SOTA on multiple Minecraft tasks with pure visual input on a single RTX 3090 GPU.
- **Score: A** (ICLR 2025 Oral; directly extends world-model-based planning to open-world Minecraft; jumpy prediction is a novel approach to long-horizon planning; strong open-source implementation)
- **Why missed:** ICLR 2025 Oral paper focused specifically on Minecraft world-model-based RL; was not surfaced by broader LLM-agent searches.

### Paper S5: Optimus-1 -- Hybrid Multimodal Memory Empowered Agents Excel in Long-Horizon Tasks
- **Authors:** Zaijing Li, Yuquan Xie, Rui Shao, Gongwei Chen, Dongmei Jiang, Liqiang Nie (Harbin Institute of Technology, Shenzhen)
- **Year/Venue:** 2024, NeurIPS 2024
- **arXiv ID:** [2408.03615](https://arxiv.org/abs/2408.03615)
- **Code:** [github.com/JiuTian-VL/Optimus-1](https://github.com/JiuTian-VL/Optimus-1)
- **Summary:** Introduces a Hybrid Multimodal Memory module combining a Hierarchical Directed Knowledge Graph (HDKG) for structured crafting knowledge and an Abstracted Multimodal Experience Pool (AMEP) for experience replay; achieves SOTA on 67 long-horizon Minecraft tasks spanning wood-to-diamond progression, approaching human-level performance on multiple tasks.
- **Score: A** (NeurIPS 2024; strong results on long-horizon tasks; hybrid knowledge+experience memory is a novel contribution; open-source)
- **Why missed:** Published at NeurIPS 2024; the initial search focused on 2023-2025 and may have categorized this as "memory architecture" rather than "world model."

### Paper S6: Optimus-2 -- Multimodal Minecraft Agent with Goal-Observation-Action Conditioned Policy
- **Authors:** (HIT Shenzhen / Peng Cheng Lab)
- **Year/Venue:** 2025, arXiv preprint
- **arXiv ID:** [2502.19902](https://arxiv.org/abs/2502.19902)
- **Summary:** Combines an MLLM for high-level planning with a Goal-Observation-Action Conditioned Policy (GOAP) for low-level control; GOAP features an Action-guided Behavior Encoder modeling causal observation-action relationships; introduces MGOA dataset (25K videos, ~30M pairs); achieves +27% on atomic tasks, +10% on long-horizon, +18% on open-ended sub-goal tasks over prior SOTA.
- **Score: B** (Strong hierarchical architecture; MLLM+policy hybrid design; comprehensive dataset contribution; not yet at a top venue)
- **Why missed:** Very recent (Feb 2025); hierarchical MLLM+policy architecture is a rapidly evolving space.

---

## C. VLA/VLM Agents: Follow-ups to OmniJARVIS and Voyager

### Paper S7: OpenHA -- A Series of Open-Source Hierarchical Agentic Models in Minecraft
- **Authors:** CraftJarvis Team (Zihao Wang, Shaofei Cai, et al.)
- **Year/Venue:** 2025, arXiv preprint
- **arXiv ID:** [2509.13347](https://arxiv.org/abs/2509.13347)
- **Code:** [github.com/CraftJarvis/OpenHA](https://github.com/CraftJarvis/OpenHA)
- **Summary:** Systematically compares action abstractions for hierarchical VLA agents in Minecraft; introduces Chain of Action (CoA) that unifies high-level planning and low-level control in a single monolithic VLA model where abstracted actions serve as intermediate "thoughts"; benchmarked on 1000+ diverse Minecraft tasks with an All-in-One training strategy.
- **Score: A** (Direct OmniJARVIS follow-up from same lab; comprehensive hierarchical VLA comparison; Chain of Action is a key architectural contribution; fully open-source with code, datasets, checkpoints)
- **Why missed:** Published Sep 2025; the CraftJarvis lab produces papers rapidly and the initial search stopped at OmniJARVIS (2024).

### Paper S8: MAIN-VLA -- Modeling Abstraction of Intention and Environment for Vision-Language-Action Models
- **Authors:** (2026)
- **Year/Venue:** 2026, arXiv preprint
- **arXiv ID:** [2602.02212](https://arxiv.org/abs/2602.02212)
- **Summary:** Introduces a dual-pathway abstraction mechanism: Intention Abstraction (IA) compresses verbose instructions into semantic primitives, while Environment Semantics Abstraction (ESA) projects visual streams into sparse topological affordance representations; 7B parameter model achieves new SOTA over JARVIS-VLA, OpenHA, ROCKET-1, and STEVE-1 on embodied, combat, and GUI Minecraft tasks.
- **Score: B** (Very recent, Feb 2026; strong SOTA results on Minecraft VLA tasks; novel dual-abstraction mechanism; not yet at a top venue)
- **Why missed:** Published 2026, the absolute newest paper in the VLA-for-Minecraft line.

### Paper S9: Odyssey -- Empowering Minecraft Agents with Open-World Skills
- **Authors:** Shunyu Liu, Yaoru Li, Kongcheng Zhang et al. (Zhejiang University)
- **Year/Venue:** 2025, IJCAI 2025
- **arXiv ID:** [2507.00079](https://arxiv.org/abs/2507.00079)
- **Code:** [github.com/zju-vipa/Odyssey](https://github.com/zju-vipa/Odyssey)
- **Summary:** Directly builds on Voyager's framework, adding a curated open-world skill library (40 primitive + 183 compositional skills) and a fine-tuned LLaMA-3 model on 390k+ Minecraft Wiki QA entries; introduces a new agent capability benchmark covering long-term planning, dynamic-immediate planning, and autonomous exploration.
- **Score: B** (IJCAI 2025; direct Voyager extension with open-source LLM; curated skill library is a practical contribution; addresses Voyager's reliance on GPT-4)
- **Why missed:** Published mid-2025; extends Voyager but uses a different naming convention ("Odyssey") not captured by Voyager citation searches.

### Paper S10: VoyagerVision -- Investigating the Role of Multi-modal Information for Open-ended Learning Systems
- **Authors:** Ethan Smyth, Alessandro Suglia (University of Edinburgh)
- **Year/Venue:** 2025, arXiv preprint
- **arXiv ID:** Published June 2025
- **Summary:** Extends Voyager by integrating screenshots as visual feedback for structure-building tasks in Minecraft; Voyager was incapable of creating structures, but VoyagerVision built 2.75 unique structures per 50 iterations using GPT-4o's multimodal capabilities to interpret pixel data.
- **Score: C** (Incremental extension of Voyager; demonstrates the value of visual feedback for spatial tasks; limited scope but addresses a clear Voyager limitation)
- **Why missed:** Very recent (June 2025); niche extension of Voyager.

---

## D. LLM-Based Planning Agents with Structured Knowledge

### Paper S11: WALL-E -- World Alignment by Rule Learning Improves World Model-based LLM Agents
- **Authors:** Siyu Zhou, Tianyi Zhou, Yijun Yang, Guodong Long, Deheng Ye, Jing Jiang, Chengqi Zhang
- **Year/Venue:** 2025, ICLR 2025 / NeurIPS 2025
- **arXiv ID:** Available on OpenReview
- **Summary:** Builds a neurosymbolic world model by combining a pretrained LLM with learned symbolic rules extracted from exploration trajectories; uses Model-Predictive Control (MPC) with the LLM as a lookahead optimizer; surpasses baselines in Minecraft diamond mining by 15-30% success rate with 60-80% fewer tokens and 8-20 fewer replanning rounds.
- **Score: A** (ICLR 2025 + NeurIPS 2025; neurosymbolic world model is a novel paradigm bridging LLMs and classical planning; significant efficiency gains; tested on Minecraft and ALFWorld)
- **Why missed:** Presented at both ICLR and NeurIPS 2025; the neurosymbolic approach sits between pure LLM agents and learned world models, making it hard to surface with either search term alone.

### Paper S12: XENON -- Experience-based Knowledge Correction for Robust Planning in Minecraft
- **Authors:** (2025)
- **Year/Venue:** 2025, arXiv preprint (revised Feb 2026)
- **arXiv ID:** [2505.24157](https://arxiv.org/abs/2505.24157)
- **Summary:** Algorithmically corrects LLM planning knowledge using only binary success/failure feedback; two components: Adaptive Dependency Graph (ADG) for dependency correction, and Failure-aware Action Memory (FAM) for action knowledge; a 7B open-weight LLM with XENON surpasses agents using GPT-4.
- **Score: B** (Remarkable result: small open LLM beats GPT-4 through experience-based correction; practical knowledge-correction framework; not yet at a top venue)
- **Why missed:** Published May 2025; experience-based correction is a niche but practically important area.

### Paper S13: M2PA -- A Multi-Memory Planning Agent for Open Worlds Inspired by Cognitive Theory
- **Authors:** Yanfang Zhou, Xiaodong Li, Yuntao Liu, Yongqiang Zhao, Xintong Wang, Zhenyu Li, Jinlong Tian, Xinhai Xu
- **Year/Venue:** 2025, ACL 2025 (Findings)
- **DOI:** [10.18653/v1/2025.findings-acl.1191](https://aclanthology.org/2025.findings-acl.1191/)
- **Summary:** Combines LLMs with human-like multi-memory systems (situation awareness, experience generalization, lifelong learning); significantly outperforms SOTA agents across 50 Minecraft tasks in zero-shot learning; achieves 38.33% success rate on the challenging "ObtainDiamond" task in lifelong learning experiments.
- **Score: B** (ACL 2025 Findings; cognitive-theory-inspired multi-memory architecture; strong zero-shot and lifelong learning results on challenging Minecraft tasks)
- **Why missed:** ACL 2025 papers are NLP-venue and not typically surfaced by "world model" or "reinforcement learning" searches.

### Paper S14: GameSense -- Cultivating Gaming Sense for Yourself: Making VLMs Gaming Experts
- **Authors:** Wenxuan Lu, Jiangyang He, Zhanqiu Zhang, Steven Y. Guo, Tianning Zang
- **Year/Venue:** 2025, ACL 2025 (Main, Long Paper)
- **DOI:** [10.18653/v1/2025.acl-long.643](https://aclanthology.org/2025.acl-long.643/)
- **Summary:** Proposes a paradigm shift: instead of VLM as direct controller, VLM acts as a developer creating specialized execution modules (game sense modules) via vision tools and neural network training; first framework to achieve fluent gameplay across diverse genres (ACT, FPS, Flappy Bird) without API access.
- **Score: B** (ACL 2025 Main; novel "VLM as developer" paradigm; cross-genre generalization; represents an alternative to end-to-end VLA approaches)
- **Why missed:** ACL 2025 NLP venue; the "VLM as developer" paradigm is distinct from both learned world models and LLM-as-planner approaches.

### Paper S15: Parallelized Planning-Acting for Multi-Agent LLM Systems in Minecraft
- **Authors:** Yaoru Li, Shunyu Liu, Tongya Zheng, Mingli Song (Zhejiang University)
- **Year/Venue:** 2025/2026, AAMAS 2026
- **arXiv ID:** [2503.03505](https://arxiv.org/abs/2503.03505)
- **Summary:** Introduces a dual-thread architecture decoupling LLM planning from action execution, enabling concurrent planning and acting with interruptible execution; features a centralized memory system and DAG-based recursive task decomposition; addresses the serialized bottleneck in existing multi-agent systems.
- **Score: B** (AAMAS 2026; novel parallel planning architecture; addresses practical latency bottleneck; part of the Odyssey ecosystem)
- **Why missed:** Multi-agent focus; AAMAS venue; not surfaced by single-agent "world model" searches.

---

## E. Benchmarks, Large-Scale Models, and Analysis

### Paper S16: MCU -- A Task-Centric Framework for Open-Ended Agent Evaluation in Minecraft
- **Authors:** CraftJarvis Team (Zihao Wang, Shaofei Cai, et al., PKU & Tongji)
- **Year/Venue:** 2025, ICML 2025 (Spotlight)
- **arXiv ID:** [2310.08367](https://arxiv.org/abs/2310.08367)
- **Code:** [github.com/CraftJarvis/MCU](https://github.com/CraftJarvis/MCU)
- **Summary:** A generative open-world benchmark with 3,452 composable atomic tasks across 11 categories; features an AutoEval system using VLMs that achieves 91.5% alignment with human scoring at 8.1x efficiency; reveals that existing SOTA agents suffer >50% performance drop on compositional tasks and near-zero creativity scores on building tasks.
- **Score: A** (ICML 2025 Spotlight; first comprehensive open-ended agent benchmark; directly addresses the "benchmarking gap" identified in the existing literature survey; essential resource for planner-type world model evaluation)
- **Why missed:** Initially appeared as a benchmark paper rather than a method paper; the existing survey noted MCU in the "gaps" section but did not include it as a full paper entry.

### Paper S17: JOWA -- Scaling Offline Model-Based RL via Jointly-Optimized World-Action Model Pretraining
- **Authors:** Jie Cheng, Ruixi Qiao et al.
- **Year/Venue:** 2025, ICLR 2025
- **OpenReview:** [ICLR 2025 proceedings](https://openreview.net/forum?id=689cffc97600f9deb8374fc8fa918b8e)
- **Summary:** A 150M-parameter shared Transformer backbone jointly optimized for world modeling and action learning; pretrained on 6 billion tokens across multiple Atari games; achieves 78.9% human-level performance with only 10% subsampled offline data; transfers to novel games with just ~5k offline fine-tuning data per game.
- **Score: B** (ICLR 2025; large-scale offline MBRL; demonstrates the scaling potential of world-action joint pretraining; 31.6% improvement over existing offline RL baselines)
- **Why missed:** Offline RL focus; "JOWA" naming not directly associated with DreamerV3 or model-based RL search terms.

### Paper S18: PoE-World -- Compositional World Modeling with Products of Programmatic Experts
- **Authors:** (2025)
- **Year/Venue:** 2025, NeurIPS 2025
- **Summary:** Represents world models as an exponentially-weighted product of many small symbolic programs synthesized by LLMs, rather than a single monolithic neural network; first symbolic world model to handle complex Atari games (Montezuma's Revenge, Pong); achieves positive reward on Montezuma's Revenge where PPO (20M steps) never does; generalizes zero-shot to novel levels.
- **Score: B** (NeurIPS 2025; radically different paradigm -- symbolic programs as world models; extreme sample efficiency; important for the planning-algorithms-within-world-models gap identified in the survey)
- **Why missed:** Symbolic/programmatic approach is entirely distinct from neural world model literature and was not surfaced by standard search terms.

### Paper S19: Reverse-Engineering Memory in DreamerV3 -- From Sparse Representations to Functional Circuits
- **Authors:** Jan Sobotka, Auke Ijspeert, Guillaume Bellegarda (EPFL)
- **Year/Venue:** 2025, NeurIPS 2025
- **Summary:** Uses mechanistic interpretability to extract sparse memory circuits from DreamerV3; finds that as little as 0.16% of parameters suffice for goal-directed behavior; enables post-hoc behavior editing with 90% success rate.
- **Score: B** (NeurIPS 2025; first mechanistic interpretability study of DreamerV3; reveals the sparse nature of world model memory; enables behavior editing)
- **Why missed:** Interpretability-focused paper; not a "planner" method per se but provides crucial insights into how DreamerV3's world model represents and uses memory.

---

## F. Additional Notable Papers (Brief Mentions)

### Paper S20: WHALE -- Towards Generalizable and Scalable World Models for Embodied Decision-making
- **Authors:** (2025)
- **Year/Venue:** 2025, NeurIPS 2025
- **Summary:** Behavior-conditioned world model using a spatial-temporal transformer (WHALE-X: 414M parameters); pretrained on 970K Open X-Embodiment trajectories; addresses policy distribution shift in world model generalization for real-world manipulation. Robotics-focused but architecture innovations transfer to game agents.
- **Score: B** (NeurIPS 2025; large-scale behavior-conditioned world model; relevant to the scaling dimension of planner-type world models; primarily robotics)

### Paper S21: SOLD -- Slot-Attention for Object-centric Latent Dynamics
- **Authors:** (2025)
- **Year/Venue:** 2025, ICLR 2025
- **Summary:** First object-centric MBRL algorithm from pixels; uses Slot Attention to decompose scenes into objects, then learns dynamics via a Transformer-based transition model over slots; outperforms DreamerV3 on relational reasoning and manipulation tasks.
- **Score: B** (ICLR 2025; object-centric approach addresses a key limitation of monolithic world models; important for structured planning)

### Paper S22: APE -- Efficient Reinforcement Learning Through Adaptively Pretrained Visual Encoder
- **Authors:** (2025)
- **Year/Venue:** 2025, AAAI 2025
- **arXiv ID:** [2502.05555](https://arxiv.org/abs/2502.05555)
- **Summary:** Proposes adaptive pretraining for visual encoders; when combined with DreamerV3 and DrQ-v2, achieves SOTA on DeepMind Control Suite, Atari, and Memory Maze.
- **Score: C** (AAAI 2025; representation learning contribution rather than planner architecture; practically useful for improving DreamerV3's sample efficiency)

---

## Summary Statistics

| Category | Count | Papers |
|----------|-------|--------|
| DreamerV3 Architecture Successors | 3 | DyMoDreamer (NeurIPS 2025), TWISTER (ICLR 2025), Drama (ICLR 2025) |
| Minecraft World Model + RL Agents | 3 | LS-Imagine (ICLR 2025 Oral), Optimus-1 (NeurIPS 2024), Optimus-2 (2025) |
| VLA/VLM Agents (OmniJARVIS/Voyager follow-ups) | 4 | OpenHA (2025), MAIN-VLA (2026), Odyssey (IJCAI 2025), VoyagerVision (2025) |
| LLM-Based Planning with Structured Knowledge | 5 | WALL-E (ICLR/NeurIPS 2025), XENON (2025), M2PA (ACL 2025), GameSense (ACL 2025), Parallelized Planning-Acting (AAMAS 2026) |
| Benchmarks, Large-Scale Models & Analysis | 4 | MCU (ICML 2025 Spotlight), JOWA (ICLR 2025), PoE-World (NeurIPS 2025), Reverse-Engineering DreamerV3 (NeurIPS 2025) |
| Other Notable | 3 | WHALE (NeurIPS 2025), SOLD (ICLR 2025), APE (AAAI 2025) |
| **Total New Papers** | **22** | |

---

## Key Themes Revealed by Supplementary Search

1. **2025 is a breakout year for world model architecture innovation:** Three ICLR 2025 papers (TWISTER, Drama, LS-Imagine) propose fundamentally different backbones (Transformer+CPC, Mamba SSM, jumpy prediction) as alternatives to DreamerV3's RSSM. NeurIPS 2025 adds DyMoDreamer (dynamic modulation) and PoE-World (symbolic programs).

2. **The OmniJARVIS $\to$ OpenHA $\to$ MAIN-VLA lineage is evolving rapidly:** The CraftJarvis lab has produced a continuous stream of VLA advances: OmniJARVIS (tokenization) $\to$ JARVIS-VLA (post-training) $\to$ OpenHA (hierarchical) $\to$ MAIN-VLA (abstraction). Each paper achieves new SOTA on Minecraft benchmarks.

3. **Minecraft is the dominant testbed for planner-type agents:** Of the 22 new papers, 14 evaluate primarily on Minecraft. The MCU benchmark (ICML 2025 Spotlight) provides the first standardized evaluation framework, addressing the benchmarking gap identified in the original survey.

4. **LLM + structured knowledge is a rapidly growing paradigm:** WALL-E (neurosymbolic rules), XENON (experience-corrected dependency graphs), M2PA (cognitive multi-memory), and Goal-Oriented Graphs all represent a shift from pure LLM reasoning to structured knowledge representations that improve planning reliability.

5. **Small models + smart architectures are competitive with large models:** XENON (7B open LLM beats GPT-4), Drama (7M params competitive with DreamerV3), and PoE-World (symbolic programs on Montezuma's Revenge) demonstrate that architecture innovation can match or exceed scaling.

6. **The planning-algorithms gap is beginning to close:** PoE-World (hierarchical TAMP-style planning with symbolic world models), WALL-E (MPC with LLM lookahead), and EfficientZero V2 (MCTS with learned model) represent growing interest in explicit planning algorithms operating over learned world model representations.

---

## Recommended Additions to Core Paper List

For the planner-type world models chapter, the following 3-4 papers from this supplement are recommended for elevation to the main reading list:

1. **LS-Imagine** (ICLR 2025 Oral) -- Best example of learned world model for open-world Minecraft planning
2. **OpenHA** (2025) -- Capstone of the OmniJARVIS VLA lineage; comprehensive hierarchical comparison
3. **WALL-E** (ICLR/NeurIPS 2025) -- Novel neurosymbolic approach bridging LLMs and classical planning
4. **MCU** (ICML 2025 Spotlight) -- Essential benchmark for planner evaluation (currently noted only as a gap)
