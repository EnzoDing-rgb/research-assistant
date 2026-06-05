# Simulator-Type World Models — Literature Review

> **Definition**: World models that output **physically/geometrically accurate environment states**, focusing on **structural realism** (particle positions, velocities, object poses, 3D geometry, physical parameters) rather than pixel-level visual fidelity. These models function as learned physics engines, differentiable simulators, or structured state predictors.

**Date of search**: 2026-06-05  
**Scope**: 2020–2026, with emphasis on 2024–2026  
**Search methodology**: Multi-axis web search across arXiv, Google Scholar, Semantic Scholar, and conference proceedings (ICML, ICLR, NeurIPS, CVPR, CoRL, RSS, RA-L)

---

## Paper List with Quality Scores

### Tier A: Seminal / Highly-Cited

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| 1 | **Learning to Simulate Complex Physics with Graph Networks (GNS)** | Alvaro Sanchez-Gonzalez, Jonathan Godwin, Tobias Pfaff, Rex Ying, Jure Leskovec, Peter W. Battaglia | 2020 | ICML 2020 | **A** |
| 2 | **Learning Mesh-Based Simulation with Graph Networks (MeshGraphNets)** | Tobias Pfaff, Meire Fortunato, Alvaro Sanchez-Gonzalez, Peter W. Battaglia | 2021 | ICLR 2021 (Spotlight) | **A** |
| 3 | **Mastering Diverse Domains through World Models (DreamerV3)** | Danijar Hafner, Jurgis Pasukonis, Jimmy Ba, Timothy Lillicrap | 2023 | arXiv:2301.04104 | **A** |

**1. GNS** — The foundational work demonstrating that graph neural networks can replace traditional numerical solvers to simulate complex physics (fluids, rigid bodies, granular materials, deformables) with a single architecture. **arXiv**: [2002.09405](https://arxiv.org/abs/2002.09405). **Code**: [github.com/deepmind/deepmind-research/tree/master/learning_to_simulate](https://github.com/deepmind/deepmind-research/tree/master/learning_to_simulate). ~1,000+ citations.

**2. MeshGraphNets** — Extends learned simulation to mesh-based representations (aerodynamics, structural mechanics, cloth), achieving 1–2 orders of magnitude speedup over traditional solvers while adapting to resolution changes. **arXiv**: [2010.03409](https://arxiv.org/abs/2010.03409). **Code**: [github.com/deepmind/deepmind-research/tree/master/meshgraphnets](https://github.com/deepmind/deepmind-research/tree/master/meshgraphnets).

**3. DreamerV3** — A general-purpose latent world model that learns a Recurrent State-Space Model (RSSM) to predict latent state transitions, enabling agents trained purely "in imagination" to master 150+ diverse tasks (including collecting diamonds in Minecraft from scratch). **arXiv**: [2301.04104](https://arxiv.org/abs/2301.04104). **Code**: [github.com/danijar/dreamerv3](https://github.com/danijar/dreamerv3).

---

### Tier B: Solid Contributions

#### B1: Differentiable Physics + Real-to-Sim Pipelines

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| 4 | **One-Shot Real-to-Sim via End-to-End Differentiable Simulation and Rendering** | Yifan Zhu, Tianyi Xiang, Aaron M. Dollar, Zherong Pan | 2024/2025 | IEEE RA-L 2025 | **B** |
| 5 | **PIN-WM: Learning Physics-Informed World Models for Non-Prehensile Manipulation** | Wenxuan Li, Hang Zhao, Zhiyuan Yu, Yu Du, Qin Zou, Ruizhen Hu, Kai Xu | 2025 | RSS 2025 | **B** |
| 6 | **PhysWorld: Robot Learning from a Physical World Model** | Jiageng Mao, Sicheng He, Yue Wang, et al. | 2025 | arXiv:2511.07416 | **B** |

**4. One-Shot Real-to-Sim** — A fully differentiable pipeline that jointly optimizes **geometry, appearance, and physical parameters (GAP)** of rigid objects from a single robot push. Uses point-based geometry + grid-based appearance + differentiable Poisson reconstruction + differentiable rigid body simulation. The most complete differentiable real-to-sim pipeline to date. **arXiv**: [2412.00259](https://arxiv.org/abs/2412.00259). **Code**: available (see paper).

**5. PIN-WM** — Learns 3D rigid-body dynamics from visual observations using differentiable physics simulation (NVIDIA Warp), with Gaussian Splatting-based observation loss (no explicit state estimation needed). Introduces "Digital Cousins" — physics-aware domain randomization for Sim2Real transfer. Demonstrates robust non-prehensile manipulation on real robots. **arXiv**: [2504.16693](https://arxiv.org/abs/2504.16693). **Code**: available (see paper).

**6. PhysWorld** — Couples video generation with physical world reconstruction: from a single image + language command, generates task-conditioned video, reconstructs underlying physics, and grounds into executable robot trajectories via object-centric residual RL. Zero-shot generalizable manipulation. **arXiv**: [2511.07416](https://arxiv.org/abs/2511.07416).

#### B2: Object-Centric Structured World Models

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| 7 | **SlotFormer: Unsupervised Visual Dynamics Simulation with Object-Centric Models** | Ziyi Wu, Nikita Dvornik, Klaus Greff, Thomas Kipf, Animesh Garg | 2023 | ICLR 2023 | **B** |
| 8 | **Dyn-O: Building Structured World Models with Object-Centric Representations** | Zizhao Wang, Kaixin Wang, Li Zhao, Peter Stone, Jiang Bian | 2025 | NeurIPS 2025 | **B** |

**7. SlotFormer** — A transformer-based autoregressive dynamics model operating over learned object-centric slot representations. Enables unsupervised video prediction and model-based planning by explicitly modeling pairwise object interactions. **arXiv**: [2210.05861](https://arxiv.org/abs/2210.05861). **Code**: [github.com/pairlab/SlotFormer](https://github.com/pairlab/SlotFormer).

**8. Dyn-O** — Enhanced structured world model with object-centric representations that decouple dynamics-agnostic from dynamics-aware features. Outperforms DreamerV3 on Procgen games in rollout prediction accuracy. A strong demonstration that explicit object structure improves world model fidelity. **arXiv**: [2507.03298](https://arxiv.org/abs/2507.03298). **Code**: [github.com/wangzizhao/dyn-O](https://github.com/wangzizhao/dyn-O).

#### B3: World Models for Physical Robot Learning

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| 9 | **DayDreamer: World Models for Physical Robot Learning** | Philipp Wu, Alejandro Escontrela, Danijar Hafner, Ken Goldberg, Pieter Abbeel | 2022 | CoRL 2022 | **B** |

**9. DayDreamer** — First demonstration that Dreamer-style world models enable sample-efficient online learning on physical robots without simulators. Learned quadruped walking from scratch in 1 hour, visual pick-and-place from sparse rewards, and navigation — all with the same hyperparameters. **arXiv**: [2206.14176](https://arxiv.org/abs/2206.14176). **Code**: [github.com/danijar/daydreamer](https://github.com/danijar/daydreamer).

#### B4: 3D Geometry-Aware World Models

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| 10 | **Learning 3D Persistent Embodied World Models** | Siyuan Zhou, Yilun Du, Yuncong Yang, Lei Han, Peihao Chen, Dit-Yan Yeung, Chuang Gan | 2025 | arXiv:2505.05495 | **B** |

**10. 3D Persistent Embodied World Models** — A video diffusion model that predicts RGB-D future observations and aggregates them into a persistent 3D map. Conditions future generation on this spatial map, enabling faithful simulation of both seen and unseen parts of the world. A key bridge between video generation and 3D geometry. **arXiv**: [2505.05495](https://arxiv.org/abs/2505.05495).

#### B5: Video Generation World Models (with structural ambitions)

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| 11 | **UniSim: Learning Interactive Real-World Simulators** | Sherry Yang, Yilun Du, Kamyar Ghasemipour, Jonathan Tompson, Leslie Kaelbling, Dale Schuurmans, Pieter Abbeel | 2024 | ICLR 2024 (Outstanding Paper) | **B** |
| 12 | **DIAMOND: Diffusion for World Modeling — Visual Details Matter in Atari** | Eloi Alonso, Adam Jelley, Vincent Micheli, Anssi Kanervisto, Amos Storkey, Tim Pearce, Francois Fleuret | 2024 | NeurIPS 2024 | **B** |

**11. UniSim** — A universal video diffusion simulator trained on diverse datasets (robotics, human activity, navigation). Actions as input, videos as output. Demonstrates that policies trained purely in simulated video rollouts transfer zero-shot to real robots. **arXiv**: [2310.06114](https://arxiv.org/abs/2310.06114). **Project**: [universal-simulator.github.io](https://universal-simulator.github.io).

**12. DIAMOND** — First work to use a diffusion model as a reinforcement learning world model, operating directly in pixel space. Achieves SOTA human-normalized score of 1.46 on Atari 100k benchmark, surpassing human performance on 11 games. **arXiv**: [2405.12399](https://arxiv.org/abs/2405.12399). **Code**: [github.com/eloialonso/diamond](https://github.com/eloialonso/diamond).

#### B6: Physical Law Analysis

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| 13 | **How Far is Video Generation from World Model: A Physical Law Perspective** | Bingyi Kang, Yang Yue, Rui Lu, Zhijie Lin, Yang Zhao, Kaixin Wang, Gao Huang, Jiashi Feng | 2024/2025 | ICML 2025 | **B** |

**13. How Far is Video Generation from World Model** — Systematic investigation of whether video diffusion models learn physical laws. Finds that scaling alone is insufficient: models exhibit "case-based" generalization (mimicking nearest training example) rather than discovering general physical principles. Provides the PhyWorld benchmark for testing physical law discovery. **arXiv**: [2411.02385](https://arxiv.org/abs/2411.02385). **Project**: [phyworld.github.io](https://phyworld.github.io).

---

### Tier C: Incremental / Niche Contributions

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| 14 | **Slot Structured World Models** | Jonathan Collu, Riccardo Majellaro, Aske Plaat, Thomas Moerland | 2024 | arXiv:2402.03326 | **C** |

**14. Slot Structured World Models** — Combines Slot Attention object-centric encoder with a latent graph-based dynamics model. Solid approach but evaluated only on simple Spriteworld benchmarks with limited physical interaction complexity. **arXiv**: [2402.03326](https://arxiv.org/abs/2402.03326). **Code**: [github.com/JonathanCollu/Slot-Structured-World-Models](https://github.com/JonathanCollu/Slot-Structured-World-Models).

---

### Supplementary: Relevant Surveys (Not Scored)

| # | Paper | Authors | Year | Venue |
|---|-------|---------|------|-------|
| S1 | **Understanding World or Predicting Future? A Comprehensive Survey of World Models** | Jingtao Ding, Yunke Zhang, et al. (Tsinghua University) | 2024/2025 | ACM Computing Surveys, Vol. 58 |
| S2 | **3D and 4D World Modeling: A Survey** | Lingdong Kong, Wesley Yang, Jianbiao Mei, et al. (23 authors, NUS/NTU/HKUST/Tsinghua) | 2025 | arXiv:2509.07996 |

**S1.** Comprehensive taxonomy dividing world models into "understanding" (internal representations) and "predicting" (future state simulation), covering autonomous driving, robotics, and social simulation. **arXiv**: [2411.14499](https://arxiv.org/abs/2411.14499). **Code**: [github.com/tsinghua-fib-lab/World-Model](https://github.com/tsinghua-fib-lab/World-Model).

**S2.** First survey dedicated to 3D/4D world modeling. Establishes taxonomy: Data Engines, Action Interpreters, Neural Simulators, Scene Reconstructors. Covers geometry, dynamics, perception, and evaluation. **arXiv**: [2509.07996](https://arxiv.org/abs/2509.07996). **Code**: [github.com/worldbench/survey](https://github.com/worldbench/survey).

---

## Core 3 Recommended Papers

The following three papers are recommended as the "core 3" for a chapter on **Simulator-type World Models** (structural realism focus):

### 1. Learning to Simulate Complex Physics with Graph Networks (GNS)
**Sanchez-Gonzalez et al., ICML 2020** — arXiv: [2002.09405](https://arxiv.org/abs/2002.09405)

**Justification**: This is the **foundational work** for the entire category of simulator-type world models. It demonstrated that a single graph neural network architecture can replace traditional numerical solvers across multiple physical domains (fluids, rigid bodies, granular materials, deformables). The paper established the paradigm of learned physics simulation: encode particle states into a latent graph, use message-passing to compute interactions, and decode per-particle accelerations for forward integration. With 1,000+ citations and open-source code, it has spawned an entire research lineage (MeshGraphNets, GNS-RL, and many follow-ups). It is the purest example of a "simulator-type" world model — its output is physically meaningful state vectors, not pixels.

**Relevance to chapter**: Establishes the core technical paradigm (graph networks as physics simulators), provides the baseline for all subsequent learned simulation work, and directly addresses the question: "Can we learn a physics simulator from data?"

**Open-source**: Yes — [github.com/deepmind/deepmind-research/tree/master/learning_to_simulate](https://github.com/deepmind/deepmind-research/tree/master/learning_to_simulate)

---

### 2. One-Shot Real-to-Sim via End-to-End Differentiable Simulation and Rendering
**Zhu et al., IEEE RA-L 2025** — arXiv: [2412.00259](https://arxiv.org/abs/2412.00259)

**Justification**: This paper represents the **most complete modern differentiable real-to-sim pipeline**. It jointly optimizes geometry (via point-based Shape-as-Points representation), appearance (via grid-based appearance field), and physical parameters (via differentiable rigid body simulation) — all from a **single robot push**. It integrates three differentiable components (reconstruction, rendering, physics) into one end-to-end optimization, producing a simulation-and-rendering-ready world model. Published in 2024/2025, it represents the state-of-the-art in building physically accurate world models from real-world observations. The paper directly addresses the central challenge of simulator-type world models: how to go from sparse real-world observations to a complete, physically accurate simulation.

**Relevance to chapter**: Demonstrates the complete pipeline from observation → physics simulation, which is the holy grail of simulator-type world models. Shows that differentiable physics + differentiable rendering can be chained together for joint optimization. Represents the cutting edge of what is possible in 2024-2025.

**Open-source**: Yes — code available (see paper)

---

### 3. PIN-WM: Learning Physics-Informed World Models for Non-Prehensile Manipulation
**Li et al., RSS 2025** — arXiv: [2504.16693](https://arxiv.org/abs/2504.16693)

**Justification**: This paper represents the **most practical deployment** of physics-informed world models for real robot learning. It integrates a differentiable physics engine (NVIDIA Warp) with Gaussian Splatting-based visual observation models, learning 3D rigid-body dynamics end-to-end from visual observations. Unlike pure video-generation world models (Sora, Genie, UniSim), PIN-WM explicitly models physics — its internal states are physically meaningful 3D poses and velocities. The key innovation is using Gaussian Splatting as the observation model (no manual state estimation needed) while maintaining a differentiable physics core. The "Digital Cousins" domain randomization strategy bridges the Sim2Real gap. Published at RSS 2025, it demonstrates real-world non-prehensile manipulation with sim-to-real transfer, showing that physics-informed world models can actually work on physical robots.

**Relevance to chapter**: Bridges the gap between pure physics simulation (GNS) and real-world robot deployment. Shows how differentiable physics can be integrated with modern visual representations (Gaussian Splatting). Provides a practical recipe for building simulator-type world models that work in the real world.

**Open-source**: Yes — code available (see paper)

---

### Core 3 Summary

| Role | Paper | What It Provides |
|------|-------|-----------------|
| **Foundation** | GNS (ICML 2020) | The paradigm: learned physics simulation via graph networks |
| **Integration** | One-Shot Real-to-Sim (RA-L 2025) | The pipeline: from observation to complete physics simulation |
| **Deployment** | PIN-WM (RSS 2025) | The application: physics-informed world models for real robots |

Together, these three papers trace the arc from foundational learned simulation (2020) through differentiable real-to-sim pipelines (2024) to practical robot deployment (2025), covering the full spectrum of what makes simulator-type world models distinct from video-generation approaches.

---

## Notable Gaps in Coverage

1. **Multi-material / multi-physics simulation**: GNS (2020) demonstrated multi-material simulation, but there is relatively little follow-up work on world models that can seamlessly handle fluids + rigid bodies + deformables in a unified differentiable framework. Most recent work (PIN-WM, One-Shot Real-to-Sim) focuses exclusively on rigid bodies.

2. **Long-horizon physical consistency**: The "How Far is Video Generation from World Model" paper (ICML 2025) revealed that even the best video models fail at out-of-distribution physical generalization. No current simulator-type world model has demonstrated reliable long-horizon (>1000 timestep) physical simulation of complex multi-object scenes from real-world observations.

3. **Deformable / soft-body world models**: The literature is heavily biased toward rigid-body simulation. Learned simulation of deformables (cloth, soft robots, biological tissues) within world model frameworks is underexplored, despite MeshGraphNets (2021) having demonstrated feasibility.

4. **Uncertainty quantification in learned simulators**: Most learned physics simulators produce deterministic predictions. Probabilistic extensions (e.g., Bayesian graph networks for physics) exist but are not yet integrated into world model frameworks for decision-making.

5. **Real-time differentiable simulation at scale**: Frameworks like NVIDIA Warp and Brax enable fast differentiable simulation, but integrating them into world model training loops at the scale needed for foundation models (e.g., training on internet-scale video) remains an open engineering challenge.

6. **Benchmarks for structural accuracy**: The field lacks standardized benchmarks that specifically measure the physical/geometric accuracy of world model predictions (as opposed to visual fidelity metrics like FVD/PSNR). The PhyWorld benchmark (Kang et al., 2025) is a step in this direction but is limited to 2D.

7. **Integration with LLM/VLM planning**: While PhysWorld (2025) begins to explore language-conditioned physical world reconstruction, the integration of structured physics world models with large language/vision-language model-based planning remains nascent. Most LLM-based agents still operate on symbolic or text-based world representations rather than physically grounded ones.

8. **Energy conservation and physical constraints**: Few learned simulators explicitly enforce conservation laws (energy, momentum) or physical constraints (incompressibility, non-penetration) as hard constraints. Most rely on data-driven learning to approximately satisfy these, which can lead to physically implausible predictions over long horizons.

---

## Quick Reference: All Papers with arXiv IDs

| # | Short Name | arXiv ID | Venue | Score |
|---|-----------|----------|-------|-------|
| 1 | GNS | [2002.09405](https://arxiv.org/abs/2002.09405) | ICML 2020 | A |
| 2 | MeshGraphNets | [2010.03409](https://arxiv.org/abs/2010.03409) | ICLR 2021 | A |
| 3 | DreamerV3 | [2301.04104](https://arxiv.org/abs/2301.04104) | 2023 | A |
| 4 | One-Shot Real-to-Sim | [2412.00259](https://arxiv.org/abs/2412.00259) | RA-L 2025 | B |
| 5 | PIN-WM | [2504.16693](https://arxiv.org/abs/2504.16693) | RSS 2025 | B |
| 6 | PhysWorld | [2511.07416](https://arxiv.org/abs/2511.07416) | 2025 | B |
| 7 | SlotFormer | [2210.05861](https://arxiv.org/abs/2210.05861) | ICLR 2023 | B |
| 8 | Dyn-O | [2507.03298](https://arxiv.org/abs/2507.03298) | NeurIPS 2025 | B |
| 9 | DayDreamer | [2206.14176](https://arxiv.org/abs/2206.14176) | CoRL 2022 | B |
| 10 | 3D Persistent Embodied WM | [2505.05495](https://arxiv.org/abs/2505.05495) | 2025 | B |
| 11 | UniSim | [2310.06114](https://arxiv.org/abs/2310.06114) | ICLR 2024 | B |
| 12 | DIAMOND | [2405.12399](https://arxiv.org/abs/2405.12399) | NeurIPS 2024 | B |
| 13 | How Far Is Video Gen | [2411.02385](https://arxiv.org/abs/2411.02385) | ICML 2025 | B |
| 14 | Slot Structured WM | [2402.03326](https://arxiv.org/abs/2402.03326) | 2024 | C |
| S1 | World Model Survey | [2411.14499](https://arxiv.org/abs/2411.14499) | ACM CSUR 2025 | — |
| S2 | 3D/4D World Modeling | [2509.07996](https://arxiv.org/abs/2509.07996) | 2025 | — |

---

*Literature search conducted 2026-06-05. All citations verified with arXiv IDs. Papers in English only.*
