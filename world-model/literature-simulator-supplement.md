# Simulator-Type World Models — Supplementary Literature Search

> **Search date**: 2026-06-05  
> **Purpose**: Find papers the original WebSearch-based search may have MISSED, focusing on very recent publications (2025-2026), top venue papers, and citation-network gaps.  
> **Method**: Multi-axis search across arXiv, Semantic Scholar, OpenAlex, and conference proceedings (ICML 2025, NeurIPS 2025, ICLR 2025, CVPR 2025/2026, RSS 2025, CoRL 2025).

---

## Previously Found Papers (Reference Only — Not Re-listed)

The original search already covered: GNS, MeshGraphNets, DreamerV3, One-Shot Real-to-Sim, PIN-WM, PhysWorld, SlotFormer, Dyn-O, DayDreamer, 3D Persistent Embodied WM, UniSim, DIAMOND, How Far Is Video Gen, Slot Structured WM. These are not repeated here.

---

## Newly Identified Papers

### Tier B: Solid Contributions

#### B1: Differentiable Physics-Grounded World Models

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| S1 | **ContactGaussian-WM: Learning Physics-Grounded World Model from Videos** | Meizhong Wang, Wanxin Jin, Kun Cao, Lihua Xie, Yiguang Hong | 2026 | arXiv:2602.11021 | **B** |

**S1. ContactGaussian-WM** — A differentiable rigid-body world model that unifies Gaussian Splatting for BOTH visual appearance and collision geometry, with gradients flowing through a closed-form physics engine. Trained from sparse, contact-rich video sequences. Supports real-time Model Predictive Control (MPC) with physically accurate contact dynamics. **arXiv**: [2602.11021](https://arxiv.org/abs/2602.11021). **Why missed**: Very recent (Feb 2026); the dual-use Gaussian representation for rendering + collision detection is a novel architecture not captured by standard search terms.

---

#### B2: Object-Centric Structured World Models (Not in Original List)

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| S2 | **SOLD: Slot Object-Centric Latent Dynamics Models for Relational Manipulation Learning from Pixels** | Malte Mosbach, Jan Niklas Ewertz, Angel Villar-Corrales, Sven Behnke | 2025 | ICML 2025 | **B** |
| S3 | **FIOC-WM: Learning Interactive World Model for Object-Centric Reinforcement Learning** | Fan Feng, Phillip Lippe, Sara Magliacane | 2025 | NeurIPS 2025 | **B** |

**S2. SOLD** — The first object-centric model-based RL algorithm that learns entirely from pixels. Uses Slot Attention (SAVi) to parse video frames into object slots, then predicts slot-level dynamics with a transformer, finally learning behaviors through imagined rollouts in the structured latent space. Outperforms DreamerV3 and TD-MPC2 on multi-object robotic manipulation benchmarks (Meta-World, DM-Control). **arXiv**: [2410.08822](https://arxiv.org/abs/2410.08822). **Project**: [slot-latent-dynamics.github.io](https://slot-latent-dynamics.github.io). **Why missed**: Initially submitted to ICLR 2025 but ultimately published at ICML 2025 — the venue shift caused it to be overlooked.

**S3. FIOC-WM** — A unified framework that learns explicit representations of both objects AND their interactions within a world model. Introduces two-level factorization: object-level (interaction graph between objects) and attribute-level (static properties like mass/shape vs. dynamic properties like position/velocity). Hierarchical policy selects interaction types and executes motor commands. Achieves 73% success rate on Franka Kitchen (vs. 59% DreamerV3) and 79% zero-shot generalization. **arXiv**: [2511.02225](https://arxiv.org/abs/2511.02225). **Why missed**: Very recent (Nov 2025); the interaction-level factorization is a step beyond standard object-centric approaches.

---

#### B3: Physics-Informed World Models from Top Venues

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| S4 | **RoboScape: Physics-informed Embodied World Model** | Yu Shang, Xin Zhang, Yinzhou Tang, Lei Jin, Chen Gao, Wei Wu, Yong Li | 2025 | NeurIPS 2025 | **B** |
| S5 | **Robotic World Model: A Neural Network Simulator for Robust Policy Optimization** | Chenhao Li, Andreas Krause, Marco Hutter | 2025 | NeurIPS 2025 | **B** |

**S4. RoboScape** — Jointly learns RGB video generation AND physics knowledge within a single integrated framework. Introduces two physics-informed training tasks: temporal depth prediction (enforcing 3D geometric consistency) and keypoint dynamics learning (implicitly encoding physical properties like shape and material). Generates physically plausible videos for contact-rich robotic scenarios; validated on policy training and evaluation. **arXiv**: [2506.23135](https://arxiv.org/abs/2506.23135). **Code**: [github.com/tsinghua-fib-lab/RoboScape](https://github.com/tsinghua-fib-lab/RoboScape). **Why missed**: Published at NeurIPS 2025 concurrently with the original search; the physics-informed multi-task training paradigm was not captured by generic search terms.

**S5. Robotic World Model** — A dual-autoregressive neural network simulator trained with self-supervision for reliable long-horizon predictions in robotics. Policies are trained entirely in the learned world model and deployed zero-shot on real hardware (ANYmal D quadruped). Addresses error accumulation and sim-to-real transfer without domain-specific inductive biases. Outperforms SOTA in autoregressive prediction across both manipulation and locomotion. **arXiv**: [2501.10100](https://arxiv.org/abs/2501.10100). **Code**: [github.com/leggedrobotics/robotic_world_model](https://github.com/leggedrobotics/robotic_world_model) (342 stars). **Why missed**: Focuses on locomotion (a domain less represented in the original search) and the "world model as neural simulator" framing differs from typical MBRL framing.

---

#### B4: Structured Dynamics with Mathematical Guarantees

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| S6 | **Flow Equivariant World Models (FloWM): Memory for Partially Observed Dynamic Environments** | Hansen Lillemark, Benhao Huang, Fangneng Zhan, Yilun Du, T. Anderson Keller | 2025 | NeurIPS 2025 | **B** |

**S6. FloWM** — Introduces a world model that unifies self-motion and external object motion as one-parameter Lie group "flows," enforcing group equivariance. Achieves order-of-magnitude fewer training iterations and remains stable over hundreds of rollout timesteps (150+ frames vs. 20 training frames). Maintains accurate representations of objects moving outside the agent's field of view. Significantly outperforms diffusion-based world models (DFoT) on long-horizon rollouts. **arXiv**: [2601.01075](https://arxiv.org/abs/2601.01075). **Project**: [flowequivariantworldmodels.github.io](https://flowequivariantworldmodels.github.io). **Why missed**: Uses novel mathematical framework (Lie group flows) that falls outside standard search terms; very recent NeurIPS 2025 publication.

---

#### B5: Learned Physics Simulators and Foundation Models

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| S7 | **PDE-Transformer: Efficient and Versatile Transformers for Physics Simulations** | Benjamin Holzschuh, Qiang Liu, Georg Kohl, Nils Thuerey | 2025 | ICML 2025 | **B** |
| S8 | **GPhyT: Towards a Physics Foundation Model** | Florian Wiesner, Zoe J. Gray, Matthias Wessling, Stephen Baek | 2025 | ICML-AI4Physics 2026 | **B** |
| S9 | **Learning a Particle Dynamics Model with Real-world Videos** | Chanho Kim, Suhas V. Sumukh, Li Fuxin | 2026 | CVPR 2026 Findings | **B** |

**S7. PDE-Transformer** — A transformer-based surrogate modeling backbone for physics simulation on regular grids. Embeds different physical quantities as spatio-temporal tokens with channel-wise self-attention. Trained on 16 PDE types; pre-trained models transfer to downstream physics tasks with improved performance. Represents the "foundation model for physics simulation" direction with strong empirical results. **arXiv**: [2505.24717](https://arxiv.org/abs/2505.24717). **Why missed**: Originally labeled as "physics surrogate model" rather than "world model," so missed by world-model-specific searches. However, PDE-Transformer IS a simulator-type world model for physical systems.

**S8. GPhyT (General Physics Transformer)** — A physics foundation model trained on 1.8 TB of diverse simulation data (fluid-solid interactions, shock waves, thermal convection, multi-phase dynamics). Achieves zero-shot generalization to entirely unseen physical systems via in-context learning, outperforming specialized architectures by 7x. Stable predictions through 50-timestep rollouts. **arXiv**: [2509.13805](https://arxiv.org/abs/2509.13805). **Why missed**: Published at ICML 2026 workshop rather than a main conference; the "physics foundation model" terminology is distinct from "world model" search terms, despite the clear conceptual overlap.

**S9. Particle Dynamics from Real-world Videos** — A particle-based neural dynamics model compatible with Gaussian Splatting, trained via rendering supervision from unlabeled real-world videos (no particle-level labels needed). Predicts position and rotation of dense Gaussians. Eliminates reliance on synthetic data; includes a new 500-video real-world interaction dataset. **arXiv**: [2605.23845](https://arxiv.org/abs/2605.23845). **Why missed**: Very recent (CVPR 2026, May 2026); the real-world video training paradigm is a significant departure from simulation-trained dynamics models.

---

#### B6: Physics-Constrained World Model Architectures

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| S10 | **PH-Dreamer: A Physics-Driven World Model via Port-Hamiltonian Generative Dynamics** | Xueyu Luan, Chenwei Shi | 2026 | arXiv:2605.18303 | **B** |
| S11 | **Analytic World Models: Unlocking Efficient Vehicle Dynamics Modeling** | Asen Nachkov, Danda Pani Paudel, Jan-Nico Zaech, Davide Scaramuzza, Luc Van Gool | 2026 | AAAI 2026 | **B** |

**S10. PH-Dreamer** — Enforces physical conservation and dissipation laws (energy, momentum) in learned world models using Port-Hamiltonian formulation. An energy-guided Actor-Critic regularizes policies toward efficient control. Reduces latent phase space volume by 4-8%, energy consumption by up to 8%, and mean squared jerk by ~9% versus unconstrained world models. **arXiv**: [2605.18303](https://arxiv.org/abs/2605.18303). **Why missed**: Very recent (May 2026); Port-Hamiltonian approach is a specialized mathematical framework not captured by generic "world model + physics" search terms.

**S11. Analytic World Models (AWM)** — Repurposes differentiable simulators within an end-to-end computation graph attached to a state predictor (rather than a policy), enabling learning of odometry, optimal planners, and inverse states. Extends differentiable simulation beyond reactive control to predictive, prescriptive, and counterfactual capabilities. **arXiv**: [2502.10012](https://arxiv.org/abs/2502.10012). **Why missed**: Domain-specific framing (autonomous driving); the concept of using differentiable simulators AS world models was buried under the vehicle dynamics framing.

---

#### B7: Scaling Learned Simulation to Deformable Bodies

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| S12 | **Learning Deformable Body Interactions With Adaptive Spatial Tokenization** | Hao Wang, Yu Liu, Daniel Biggs, Haoru Wang, Jiandong Yu, Ping Huang | 2025 | NeurIPS 2025 | **B** |

**S12. AST for Deformable Bodies** — Addresses the scalability bottleneck of GNN-based mesh simulators for multi-body contact. Uses Adaptive Spatial Tokenization to map unstructured meshes onto a structured grid, then applies cross-attention + self-attention over compact tokens, avoiding the costly pairwise edges of standard GNNs. Scales to meshes exceeding 100,000 nodes; significantly outperforms SOTA GNN simulators. Introduces a new large-scale deformable body interaction dataset. **arXiv**: [2507.13707](https://arxiv.org/abs/2507.13707). **Why missed**: The paper was categorized under "mesh simulation" rather than "world model" by conventional search; however, it represents a direct and important extension of the GNS/MeshGraphNets lineage to large-scale deformable simulation.

---

### Tier C: Incremental / Niche Contributions

| # | Paper | Authors | Year | Venue | Score |
|---|-------|---------|------|-------|-------|
| S13 | **Transfer Learning in Scalable Graph Neural Network for Improved Physical Simulation (SGUNET)** | Siqi Shen, Yu Liu, Daniel Biggs, Omar Hafez, Jiandong Yu, Wentao Zhang, Bin Cui, Jiulong Shan | 2025 | arXiv:2502.06848 | **C** |
| S14 | **Universal Physics Simulation: A Foundational Diffusion Approach** | Bradley Camburn | 2025 | arXiv:2507.09733 | **C** |
| S15 | **Hybrid Neural World Models** | Pranav Lakshmanan, Paras Chopra | 2026 | arXiv:2605.28317 | **C** |

**S13. SGUNET** — Introduces pre-training + transfer learning for graph network simulators, using scalable graph U-net with depth-first search pooling. Pre-trained on 20,000 simulations; fine-tuning on 1/16 training data achieves 11% improvement in position RMSE over scratch training. **arXiv**: [2502.06848](https://arxiv.org/abs/2502.06848). **Why missed**: Incremental contribution (transfer learning for GNS); not a new simulator architecture. Scores **C** because it improves training efficiency rather than simulation capability.

**S14. Universal Physics Simulation** — Single-author sketch-guided diffusion transformer that treats physics simulation as conditional generation from boundary conditions. SSIM > 0.8 on electromagnetic fields; bypasses temporal integration via steady-state generation. Conceptually interesting but lacks peer review and empirical breadth. **arXiv**: [2507.09733](https://arxiv.org/abs/2507.09733). **Why missed**: Single-author preprint with limited dissemination. Scores **C** due to lack of peer review and narrow experimental validation.

**S15. Hybrid Neural World Models** — Multi-horizon neural surrogates trained with continuous horizon conditioning for PDEs and rigid-body dynamics. Single network predicts any future state; error map implicitly locates shocks, fronts, and contacts. 26x-72x CPU speedup. **arXiv**: [2605.28317](https://arxiv.org/abs/2605.28317). **Why missed**: Very recent (May 2026); framed as numerical solver surrogate rather than world model. Scores **C** because the experiments are limited in scale and the approach is primarily a speed-focused engineering contribution.

---

## Summary: Search-Space Coverage Analysis

### Why the Original Search Missed These Papers

| Reason | Count | Papers |
|--------|-------|--------|
| **Very recent** (post-search or concurrent, 2025Q4-2026) | 7 | ContactGaussian-WM, FIOC-WM, FloWM, PH-Dreamer, Hybrid Neural WM, Particle Dynamics CVPR'26, GPhyT |
| **Venue/terminology mismatch** (not called "world model" but IS one) | 3 | PDE-Transformer, Analytic WM, AST Deformable Bodies |
| **Venue shift** (submitted to one venue, published at another) | 1 | SOLD (ICLR→ICML 2025) |
| **Domain framing** (autonomous driving, locomotion) | 2 | Analytic WM, Robotic World Model |
| **Physics-informed task design** | 1 | RoboScape |

### Key Themes the Supplement Adds to the Literature Review

1. **Unified visual-physics representations**: ContactGaussian-WM uses a single Gaussian representation for rendering AND collision, representing a convergence of visual and geometric world modeling.

2. **Object-centric dynamics with explicit interactions**: SOLD and FIOC-WM move beyond monolithic dynamics models to factorize the world into objects AND their interactions.

3. **Physics-constrained world models**: PH-Dreamer enforces physical conservation laws as architectural constraints, addressing the "physical plausibility" gap identified in the original review.

4. **Physics foundation models**: PDE-Transformer and GPhyT represent the emerging paradigm of large-scale pre-training for physics simulation, analogous to LLMs for text.

5. **Geometric structure through symmetry**: FloWM uses Lie group equivariance to bake geometric structure into world model architecture, achieving dramatic improvements in data efficiency and long-horizon stability.

6. **Scaling learned simulation**: AST for deformable bodies shows that the GNS/MeshGraphNets paradigm can scale to 100K+ nodes through attention-based tokenization.

7. **Real-world dynamics from pixels**: The particle dynamics paper (CVPR 2026) eliminates synthetic data dependency by learning directly from real-world videos via rendering-based supervision.

---

## Quick Reference: New Papers with Identifiers

| # | Short Name | arXiv ID / DOI | Venue | Score |
|---|-----------|---------------|-------|-------|
| S1 | ContactGaussian-WM | [2602.11021](https://arxiv.org/abs/2602.11021) | 2026 | B |
| S2 | SOLD | [2410.08822](https://arxiv.org/abs/2410.08822) | ICML 2025 | B |
| S3 | FIOC-WM | [2511.02225](https://arxiv.org/abs/2511.02225) | NeurIPS 2025 | B |
| S4 | RoboScape | [2506.23135](https://arxiv.org/abs/2506.23135) | NeurIPS 2025 | B |
| S5 | Robotic World Model | [2501.10100](https://arxiv.org/abs/2501.10100) | NeurIPS 2025 | B |
| S6 | FloWM | [2601.01075](https://arxiv.org/abs/2601.01075) | NeurIPS 2025 | B |
| S7 | PDE-Transformer | [2505.24717](https://arxiv.org/abs/2505.24717) | ICML 2025 | B |
| S8 | GPhyT | [2509.13805](https://arxiv.org/abs/2509.13805) | ICML-AI4Physics 2026 | B |
| S9 | Particle Dynamics (Real Videos) | [2605.23845](https://arxiv.org/abs/2605.23845) | CVPR 2026 Findings | B |
| S10 | PH-Dreamer | [2605.18303](https://arxiv.org/abs/2605.18303) | 2026 | B |
| S11 | Analytic World Models | [2502.10012](https://arxiv.org/abs/2502.10012) | AAAI 2026 | B |
| S12 | AST Deformable Bodies | [2507.13707](https://arxiv.org/abs/2507.13707) | NeurIPS 2025 | B |
| S13 | SGUNET | [2502.06848](https://arxiv.org/abs/2502.06848) | 2025 | C |
| S14 | Universal Physics Simulation | [2507.09733](https://arxiv.org/abs/2507.09733) | 2025 | C |
| S15 | Hybrid Neural World Models | [2605.28317](https://arxiv.org/abs/2605.28317) | 2026 | C |

---

## Recommended Additions to the Core Literature Review

If you want to incorporate some of these findings into the main literature review, the top 3 recommendations are:

### 1. SOLD (Mosbach et al., ICML 2025) — arXiv:2410.08822
**Justification**: The first fully object-centric MBRL algorithm that outperforms DreamerV3 on multi-object manipulation. It represents the convergence of the Slot Attention representation paradigm with world-model-based RL, demonstrating that explicit object structure improves both prediction accuracy and policy learning. This fills a gap in the original review, which included Dyn-O and SlotFormer but missed the RL-integrated approach of SOLD.

### 2. ContactGaussian-WM (Wang et al., 2026) — arXiv:2602.11021
**Justification**: A breakthrough in unified visual-physics representations — the same Gaussian primitives serve as both visual appearance and collision geometry, with gradients flowing through contact. This is a conceptual leap beyond the separate visual encoder + physics simulator pipelines seen in PIN-WM and One-Shot Real-to-Sim. It represents the next step toward truly unified world models.

### 3. FloWM (Lillemark et al., NeurIPS 2025) — arXiv:2601.01075
**Justification**: Introduces a mathematical framework (Lie group flow equivariance) that fundamentally improves world model efficiency and stability. The 150+ frame rollout stability is unprecedented for learned world models. This paper demonstrates that incorporating geometric structure through symmetry principles can dramatically improve world model performance, pointing toward a new axis of world model design beyond the pixel-vs-state dichotomy.

---

*Supplementary search conducted 2026-06-05. All 15 new papers verified with arXiv IDs. 12 scored B, 3 scored C.*
