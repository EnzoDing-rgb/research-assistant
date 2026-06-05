# Literature Review: Planner-Type World Models for Game Environments

**Research Focus:** World models that output action directives for agents, enabling them to decide what to do next. Primary domains: Atari games, Minecraft, and decision-making. Robotics mentioned only as a natural carrier.

**Date:** 2026-06-05

---

## 1. Complete Paper List with Quality Scores

### Foundational Papers

#### Paper 1: World Models / Recurrent World Models Facilitate Policy Evolution
- **Authors:** David Ha, Jurgen Schmidhuber
- **Year:** 2018
- **Venue:** NeurIPS 2018 (published as "Recurrent World Models Facilitate Policy Evolution")
- **arXiv ID:** [1803.10122](https://arxiv.org/abs/1803.10122)
- **Code:** [github.com/hardmaru/WorldModelsExperiments](https://github.com/hardmaru/WorldModelsExperiments)
- **Summary:** Introduces the foundational VAE + MDN-RNN + Controller architecture, where a world model is trained to compress visual observations and predict future latent states, and a simple linear controller is evolved entirely within the learned world model to play Atari and VizDoom games.
- **Score: A** (Seminal; >1,000 citations; established the entire paradigm of training agents inside learned world models)

---

#### Paper 2: Dream to Control: Learning Behaviors by Latent Imagination (Dreamer)
- **Authors:** Danijar Hafner, Timothy Lillicrap, Jimmy Ba, Mohammad Norouzi
- **Year:** 2020
- **Venue:** ICLR 2020
- **arXiv ID:** [1912.01603](https://arxiv.org/abs/1912.01603)
- **Code:** [github.com/danijar/dreamer](https://github.com/danijar/dreamer)
- **Summary:** Introduces Dreamer, the first agent to learn long-horizon behaviors purely from pixels by backpropagating value gradients through trajectories imagined in the compact latent space of a learned world model, outperforming prior model-based and model-free methods on DeepMind Control Suite tasks.
- **Score: A** (Seminal; introduced analytic value gradients through imagined rollouts; established the Dreamer lineage)

---

#### Paper 3: Mastering Atari with Discrete World Models (DreamerV2)
- **Authors:** Danijar Hafner, Timothy Lillicrap, Mohammad Norouzi, Jimmy Ba
- **Year:** 2021
- **Venue:** ICLR 2021
- **arXiv ID:** [2010.02193](https://arxiv.org/abs/2010.02193)
- **Code:** [github.com/danijar/dreamerv2](https://github.com/danijar/dreamerv2)
- **Summary:** Replaces continuous latent variables with categorical latents and introduces KL balancing, achieving the first human-level performance on the 55-game Atari benchmark by a model-based agent with a single GPU.
- **Score: A** (Seminal; first model-based agent to achieve human-level performance on Atari-55; directly influenced all subsequent world model work)

---

#### Paper 4: Mastering Diverse Domains through World Models (DreamerV3)
- **Authors:** Danijar Hafner, Jurgis Pasukonis, Jimmy Ba, Timothy Lillicrap
- **Year:** 2023
- **Venue:** arXiv preprint (2023); widely cited
- **arXiv ID:** [2301.04104](https://arxiv.org/abs/2301.04104)
- **Code:** [github.com/danijar/dreamerv3](https://github.com/danijar/dreamerv3)
- **Summary:** A general-purpose world-model-based RL algorithm that masters over 150 diverse domains (Atari, DMLab, Minecraft, DeepMind Control Suite) with fixed hyperparameters; the first algorithm to collect diamonds in Minecraft from scratch without human data or curricula.
- **Score: A** (Seminal; the capstone of the Dreamer series; widely used as a foundation for subsequent world model research; open-source implementation on PyPI)

---

#### Paper 5: Transformers are Sample-Efficient World Models (IRIS)
- **Authors:** Vincent Micheli, Eloi Alonso, Francois Fleuret
- **Year:** 2023
- **Venue:** ICLR 2023 (Notable Top 5%)
- **arXiv ID:** [2209.00588](https://arxiv.org/abs/2209.00588)
- **Code:** [github.com/eloialonso/iris](https://github.com/eloialonso/iris)
- **Summary:** Casts world model learning as a sequence modeling problem using a discrete autoencoder (VQ-VAE) plus autoregressive Transformer, achieving a mean human-normalized score of 1.046 on Atari 100k with only 2 hours of gameplay data.
- **Score: A** (Highly cited; pioneered the Transformer-as-world-model paradigm; directly influenced STORM and DIAMOND)

---

### Recent High-Impact Papers (2023-2025)

#### Paper 6: STORM: Efficient Stochastic Transformer based World Models for Reinforcement Learning
- **Authors:** Weipu Zhang, Gang Wang, Jian Sun, Yetian Yuan, Gao Huang
- **Year:** 2023 (published in proceedings February 2024)
- **Venue:** NeurIPS 2023
- **arXiv ID:** [2310.09615](https://arxiv.org/abs/2310.09615)
- **Code:** [github.com/weipu-zhang/STORM](https://github.com/weipu-zhang/STORM)
- **Summary:** Combines a GPT-style Transformer backbone with categorical variational autoencoders to efficiently model stochastic environment dynamics, achieving 126.7% mean human-normalized score on Atari 100k while training in only ~4.3 hours on a single RTX 3090 GPU.
- **Score: B** (Solid contribution; efficient architecture with strong Atari 100k results; spawned follow-up works on multi-task world models)

---

#### Paper 7: EfficientZero V2: Mastering Discrete and Continuous Control with Limited Data
- **Authors:** Shengjie Wang, Shaohuai Liu, Weirui Ye, Jiacheng You, Yang Gao
- **Year:** 2024
- **Venue:** ICML 2024 (Spotlight, top 3.5%)
- **arXiv ID:** [2403.00564](https://arxiv.org/abs/2403.00564)
- **Code:** [github.com/Shengjiewang-Jason/EfficientZeroV2](https://github.com/Shengjiewang-Jason/EfficientZeroV2)
- **Summary:** Extends EfficientZero's model-based planning framework to continuous control via sampling-based tree search in the learned world model, outperforming DreamerV3 in 50 of 66 evaluated tasks across Atari 100k and continuous control benchmarks.
- **Score: A** (Top-venue spotlight; unified planning-based world model spanning discrete and continuous action spaces; strong open-source implementation)

---

#### Paper 8: Diffusion for World Modeling: Visual Details Matter in Atari (DIAMOND)
- **Authors:** Eloi Alonso, Adam Jelley, Vincent Micheli, Anssi Kanervisto, Amos Storkey, Tim Pearce, Francois Fleuret
- **Year:** 2024
- **Venue:** NeurIPS 2024 (Spotlight)
- **arXiv ID:** [2405.12399](https://arxiv.org/abs/2405.12399)
- **Code:** [github.com/eloialonso/diamond](https://github.com/eloialonso/diamond)
- **Summary:** Replaces discrete latent variables with a diffusion-based world model, achieving 1.46 mean human-normalized score on Atari 100k -- the best for agents trained purely within a world model -- by preserving visual details that discrete tokenization loses; also demonstrated as an interactive neural game engine for CS:GO.
- **Score: A** (NeurIPS Spotlight; state-of-the-art Atari 100k; represents the diffusion-model paradigm shift for world models; open-source code and pretrained models on HuggingFace)

---

#### Paper 9: Genie: Generative Interactive Environments
- **Authors:** Jake Bruce, Michael Dennis, Ashley Edwards, Jack Parker-Holder, Yuge Shi, Edward Hughes, et al. (DeepMind)
- **Year:** 2024
- **Venue:** ICML 2024 (Best Paper Award)
- **arXiv ID:** [2402.15391](https://arxiv.org/abs/2402.15391)
- **Code:** Not open-source (DeepMind)
- **Summary:** An 11B-parameter foundation world model trained unsupervised on internet videos that discovers a latent action space and generates action-controllable interactive environments from a single image prompt, enabling agents to "play" through generated worlds.
- **Score: A** (ICML Best Paper; generative world model with unsupervised action discovery; influential for foundation world model research; however, focused more on environment generation than agent action directives)

---

### LLM-based and VLA/VLM Planning Agents for Games

#### Paper 10: Voyager: An Open-Ended Embodied Agent with Large Language Models
- **Authors:** Guanzhi Wang, Yuqi Xie, Yunfan Jiang, Ajay Mandlekar, Chaowei Xiao, Yuke Zhu, Linxi Fan, Anima Anandkumar
- **Year:** 2023
- **Venue:** NeurIPS 2023
- **arXiv ID:** [2305.16291](https://arxiv.org/abs/2305.16291)
- **Code:** [github.com/MineDojo/Voyager](https://github.com/MineDojo/Voyager)
- **Summary:** The first LLM-powered embodied lifelong learning agent that uses GPT-4, an automatic curriculum, an executable skill library, and iterative prompting to continuously explore Minecraft, collecting 3.3x more unique items and unlocking tech tree milestones up to 15.3x faster than prior state-of-the-art.
- **Score: A** (Seminal; highly cited ~1,000+; pioneered LLM-as-planner for game agents; open-source)

---

#### Paper 11: OmniJARVIS: Unified Vision-Language-Action Tokenization Enables Open-World Instruction Following Agents
- **Authors:** Zihao Wang, Shaofei Cai, Zhancun Mu, Haowei Lin, Ceyao Zhang, Xuejie Liu, Qing Li, Anji Liu, Xiaojian Ma, Yitao Liang
- **Year:** 2024
- **Venue:** NeurIPS 2024
- **arXiv ID:** [2407.00114](https://arxiv.org/abs/2407.00114)
- **Code:** [github.com/CraftJarvis/OmniJARVIS](https://github.com/CraftJarvis/OmniJARVIS)
- **Summary:** Introduces unified VLA tokenization that compresses action trajectories into discrete behavior tokens and jointly autoregressively models reasoning and actions, producing a single model that can think in language and act in Minecraft simultaneously.
- **Score: A** (NeurIPS 2024; influential VLA paradigm; unified tokenization is a key architectural contribution; open-source code and models)

---

#### Paper 12: ROCKET-1: Master Open-World Interaction with Visual-Temporal Context Prompting
- **Authors:** Shaofei Cai, Zihao Wang, Kewei Lian, Zhancun Mu, Xiaojian Ma, Anji Liu, Yitao Liang
- **Year:** 2024
- **Venue:** CVPR 2025
- **arXiv ID:** [2410.17856](https://arxiv.org/abs/2410.17856)
- **Code:** [github.com/CraftJarvis/ROCKET-1](https://github.com/CraftJarvis/ROCKET-1)
- **Summary:** A hierarchical agent architecture where a VLM (GPT-4o) decomposes tasks and communicates object-level spatial intent to a low-level TransformerXL policy via SAM-2 segmentation masks, achieving 76% absolute improvement on open-world Minecraft interaction tasks.
- **Score: B** (Solid contribution at CVPR 2025; novel visual-temporal communication protocol; open-source; represents the hierarchical VLM-policy paradigm)

---

#### Paper 13: JARVIS-VLA: Post-Training Large-Scale Vision Language Models to Play Visual Games with Keyboards and Mouse
- **Authors:** Muyao Li, Zihao Wang, Kaichen He, Xiaojian Ma, Yitao Liang
- **Year:** 2025
- **Venue:** ACL 2025 (Findings)
- **DOI:** [10.18653/v1/2025.findings-acl.920](https://doi.org/10.18653/v1/2025.findings-acl.920)
- **arXiv ID:** [2503.16365](https://arxiv.org/abs/2503.16365)
- **Code:** [github.com/CraftJarvis/JarvisVLA](https://github.com/CraftJarvis/JarvisVLA)
- **Summary:** Proposes ActVLP, a self-supervised post-training paradigm for VLMs that enhances world understanding before action fine-tuning, achieving a ~40% improvement over prior baselines on 1,000+ atomic Minecraft tasks (crafting, smelting, cooking, mining, combat).
- **Score: B** (Solid contribution; systematic VLM-to-VLA pipeline; demonstrates the value of environment-specific post-training before action tuning; fully open-source with code, models, and datasets)

---

#### Paper 14: STEVE-1: A Generative Model for Text-to-Behavior in Minecraft
- **Authors:** Shalev Lifshitz, Keiran Paster, Harris Chan, Jimmy Ba, Sheila McIlraith
- **Year:** 2023
- **Venue:** NeurIPS 2023 (Spotlight)
- **arXiv ID:** [2306.00937](https://arxiv.org/abs/2306.00937)
- **Code:** [github.com/Shalev-Lifshitz/STEVE-1](https://github.com/Shalev-Lifshitz/STEVE-1)
- **Summary:** Instruction-tuned Video Pretraining (VPT) model that maps text prompts to Minecraft actions via a MineCLIP prior and fine-tuned policy, achieving robust short-horizon instruction following with only ~$60 of compute.
- **Score: B** (NeurIPS Spotlight; elegant unCLIP-style approach applied to decision-making; open-source; however, limited to short-horizon tasks compared to hierarchical planners like Voyager)

---

#### Paper 15: JARVIS-1: Open-world Multi-task Agents with Memory-Augmented Multimodal Language Models
- **Authors:** Zihao Wang, Shaofei Cai, et al.
- **Year:** 2025 (published); 2023 (arXiv preprint)
- **Venue:** IEEE Transactions on Pattern Analysis and Machine Intelligence (T-PAMI), Vol. 47, Issue 3, 2025
- **DOI:** [10.1109/TPAMI.2024.3511593](https://doi.org/10.1109/TPAMI.2024.3511593)
- **arXiv ID:** [2311.05997](https://arxiv.org/abs/2311.05997)
- **Code:** [github.com/CraftJarvis/JARVIS-1](https://github.com/CraftJarvis/JARVIS-1)
- **Summary:** Memory-augmented multimodal language model agent that uses RAG over successful planning experiences, self-checking, and multimodal perception (MineCLIP + LLM) to achieve 5x the diamond-pickaxe crafting success rate of prior methods in Minecraft.
- **Score: B** (Solid contribution in top journal; demonstrated practical long-horizon task completion; memory-augmented planning approach; however, the field has since shifted toward unified VLA approaches)

---

## 2. Core 3 Recommended Papers

For a chapter focused on **Planner-type World Models** -- models that output action directives for agents -- three papers are recommended as the essential reading:

### Core Paper 1: DreamerV3 -- Mastering Diverse Domains through World Models (Hafner et al., 2023)

**Justification:** DreamerV3 represents the most mature and general-purpose world-model-based action planning system. It is the capstone of the Dreamer lineage (2020-2023), demonstrating that a single world model architecture with a single set of hyperparameters can:
- Learn a compact latent dynamics model from raw pixels
- Train an actor-critic policy entirely in latent imagination (never acting in the real environment during policy learning)
- Output action directives that master 150+ diverse domains
- Become the first algorithm to collect diamonds in Minecraft from scratch

DreamerV3 is the purest example of a "planner-type world model": the world model imagines future trajectories, and the actor policy chooses actions to maximize imagined value. It is also fully open-source with an installable Python package (`pip install dreamerv3`). It serves as the foundation upon which many subsequent world model papers build.

### Core Paper 2: Voyager -- An Open-Ended Embodied Agent with Large Language Models (Wang et al., 2023)

**Justification:** Voyager represents a paradigm shift from traditional model-based RL (where the world model is a learned neural network) to LLM-based planning (where the LLM serves as both the world model and the planner). Key innovations with direct relevance to planner-type world models:
- The LLM acts as a **high-level planner** that proposes progressively harder tasks (automatic curriculum)
- The **skill library** stores executable code as reusable action primitives, enabling compositional planning
- The **iterative prompting mechanism** functions as a closed-loop planner: generate plan -> execute -> observe feedback -> revise
- Demonstrates that LLMs can serve as planner-type world models for open-ended game environments

Voyager is the most-cited paper in the LLM-agent-for-games category and established Minecraft as the premier testbed for open-ended agent planning.

### Core Paper 3: OmniJARVIS -- Unified Vision-Language-Action Tokenization (Wang et al., 2024)

**Justification:** OmniJARVIS represents the latest paradigm: unified Vision-Language-Action models that jointly produce reasoning and action tokens autoregressively. This is the most direct instantiation of a "planner-type world model" -- a single neural network that takes observations and instructions as input, reasons through the situation, and directly outputs action directives. Key contributions:
- Behavior tokenization compresses long action sequences into a small number of discrete tokens
- Unified vocabulary augmentation allows the model to "think" (text tokens) and "act" (behavior tokens) in the same autoregressive pass
- Represents the convergence of VLMs and world models for decision-making
- Open-source with code, models, and training methodology

OmniJARVIS exemplifies where the field is headed: unified models that perceive, plan, and act within a single architecture.

---

## 3. Notable Gaps in Coverage

### 3.1 Planning Algorithms within World Models
Most of the identified literature focuses on **policy learning within learned world models** (e.g., Dreamer, IRIS, STORM) or **LLM-based reasoning for action selection** (e.g., Voyager, OmniJARVIS). There is comparatively less work on **explicit planning algorithms** (e.g., MCTS, MPC, A\*) operating over learned world model representations for game environments. The EfficientZero lineage (including EfficientZero V2) is an important exception, using MCTS over a learned latent model. More work is needed on combining learned world models with classical planning techniques.

### 3.2 Multi-Agent Planning with World Models
The literature search revealed limited work on world models for **multi-agent planning** in game environments. Dyna-PSRO (Smith & Wellman, 2024) is a rare example of co-learning world models and game-theoretic strategies. The interaction between world models and multi-agent decision-making in complex games (e.g., StarCraft, Dota 2) remains underexplored.

### 3.3 World Models for Non-Visual Game Domains
Most game-focused world model research targets visually rich domains (Atari pixels, Minecraft first-person views). There is a gap in applying world models to:
- **Text-based games and interactive fiction** (where world models could learn narrative/state dynamics)
- **Strategic/board games** (where world models could complement or replace explicit search)
- **Abstract simulation games** (city builders, economy simulators)

### 3.4 Benchmarking and Standardization
While Atari 100k and Atari-55 serve as standard benchmarks for world model evaluation, there is no widely adopted benchmark specifically for evaluating **planning quality** (vs. policy quality) of world models. The MCU framework (Lin et al., 2025, ICML Spotlight) makes progress on this front for Minecraft, but cross-environment standardized planning benchmarks remain absent.

### 3.5 Real-Time Planning with Large World Models
As world models grow larger (Genie at 11B parameters) and VLA models become more compute-intensive, the **real-time planning latency** problem becomes critical for interactive game agents. Papers rarely report inference latency or discuss approaches for trading off planning depth against decision frequency. This is a practical gap for deploying planner-type world models in real-time game settings.

### 3.6 Brief Note on Robotics
Robotics serves as a natural carrier and application domain for planner-type world models. Several papers in this survey (e.g., Genie, DreamerV3, EfficientZero V2) include robotics experiments or mention robotics as a target domain. The skills and architectures developed for game- and decision-making world models transfer directly to robot action planning. However, a detailed treatment of robotics-specific world model planning is beyond the scope of this literature review.

---

## 4. Supplementary Resources

### Survey Papers (not scored; useful for broader context)
- Dong et al. (2026). "Learning to Model the World: A Survey of World Models in Artificial Intelligence." arXiv preprint. [GitHub: Awesome-World-Models](https://github.com/JiahuaDong/Awesome-World-Models)
- Tsinghua FIB Lab (2025). "Understanding World or Predicting Future? A Comprehensive Survey of World Models." ACM Computing Surveys. [GitHub](https://github.com/tsinghua-fib-lab/world-model)

### Related Benchmarks
- **Atari 100k** -- Standard benchmark for sample-efficient world model evaluation (26 games, 100k frames each)
- **Atari-55** -- Full Atari benchmark for general game-playing capability
- **MCU (Minecraft Universe)** -- Task-centric evaluation framework for open-ended agent planning in Minecraft
- **Crafter** -- Open-world survival game benchmark used by Dreamer-based methods

---

## 5. Citation Quality Verification

All papers listed above have been verified through arXiv IDs or DOIs. The following were cross-checked:

| # | Paper | Identifier | Verified |
|---|-------|-----------|----------|
| 1 | World Models (Ha & Schmidhuber) | arXiv:1803.10122, NeurIPS 2018 | Yes |
| 2 | Dreamer (Dream to Control) | arXiv:1912.01603, ICLR 2020 | Yes |
| 3 | DreamerV2 | arXiv:2010.02193, ICLR 2021 | Yes |
| 4 | DreamerV3 | arXiv:2301.04104 | Yes |
| 5 | IRIS | arXiv:2209.00588, ICLR 2023 | Yes |
| 6 | STORM | arXiv:2310.09615, NeurIPS 2023 | Yes |
| 7 | EfficientZero V2 | arXiv:2403.00564, ICML 2024 | Yes |
| 8 | DIAMOND | arXiv:2405.12399, NeurIPS 2024 | Yes |
| 9 | Genie | arXiv:2402.15391, ICML 2024 | Yes |
| 10 | Voyager | arXiv:2305.16291, NeurIPS 2023 | Yes |
| 11 | OmniJARVIS | arXiv:2407.00114, NeurIPS 2024 | Yes |
| 12 | ROCKET-1 | arXiv:2410.17856, CVPR 2025 | Yes |
| 13 | JARVIS-VLA | DOI:10.18653/v1/2025.findings-acl.920, ACL 2025 | Yes |
| 14 | STEVE-1 | arXiv:2306.00937, NeurIPS 2023 | Yes |
| 15 | JARVIS-1 | DOI:10.1109/TPAMI.2024.3511593, T-PAMI 2025 | Yes |
