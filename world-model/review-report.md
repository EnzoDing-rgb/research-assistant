# Peer Review Report: "World Models in Artificial Intelligence: A Functional Taxonomy and Survey"

**Review Date:** 2026-06-05
**Review Mode:** Full (EIC + 3 Reviewers + Devil's Advocate)
**Target Venue:** Top CS Conference (Survey Track)

---

## EIC Summary

**Overall Score: 72/100 — Minor Revision**

**Decision:** The survey fills a genuine need — the "world model" term is indeed chaotic, and Li's taxonomy provides a clean organizing principle. The three-category structure works well. The writing is clear and largely free of the stylistic problems common in AI survey papers (no overclaiming, no unnecessary jargon, no metaphors). The §5 open problems are concrete and actionable — unusually so for a survey paper. The main weaknesses are: (1) the reference list is structured as a reading list rather than proper APA bibliography entries, (2) several §5 attack vectors lean on unpublished or barely-published work as evidence of feasibility, and (3) §3-4 could each use one more paragraph connecting the chapter's findings back to the overall taxonomy.

**Required Revisions:** 2 CRITICAL, 4 MAJOR, 3 MINOR.

---

## Reviewer 1: Methodology & Structure Specialist

**Score: 70/100**

### Strengths
- The Renderer→Simulator→Planner flow creates a natural learning curve. Starting with "what you can see" (video) and progressing to "what you can compute" (physics) to "what you can decide" (actions) is pedagogically sound.
- Each chapter begins with a clear "What is X?" definition. This is rare in surveys and valuable.
- §5's structure (Background → Barrier → Attack Vectors → Difficulty) is rigorous and replicable. Every open problem section follows the same template, which aids comparison.

### CRITICAL Issues
**C1: Missing formal abstract structure.** The abstract is a single paragraph that does not follow any standard structure. A top-conference survey abstract should, at minimum, state: (1) the problem, (2) the taxonomy used, (3) key findings per category, and (4) implications. Currently, items 3-4 are underdeveloped.

### MAJOR Issues
**M1: §2.3 "Notable Advances" is a list, not an analysis.** The Matrix, GameNGen, and GEN3C are described in sequence but are never compared. What are the trade-offs between The Matrix's Swin-DPM approach and GameNGen's diffusion-as-game-engine approach? A comparison table or a single synthetic paragraph connecting them would substantially improve this section.

**M2: §3.4 "Structured Representations" is underdeveloped.** SOLD, ContactGaussian-WM, and FloWM each get one sentence. These represent an important emerging theme (object-centric world models) that deserves at least one synthetic paragraph explaining why object-centric representations matter for simulation — they enable compositional generalization and reduce the search space for dynamics prediction.

### MINOR Issues
**m1:** Line 23: "POMDP" is expanded but not explained. The sentence "a mathematical model of decision-making under uncertainty" is vague. Consider: "a mathematical framework where an agent receives noisy observations of a hidden true state, and must choose actions based on this incomplete information."

---

## Reviewer 2: Domain Expert — World Models & RL

**Score: 74/100**

### Strengths
- The Dreamer lineage summary in §4.2 is excellent — accurate, concise, and correctly identifies the key architectural innovation at each version (RSSM→categorical latents→fixed hyperparameters).
- The Two Paradigms Compared section (§4.4) is the paper's strongest passage. The efficiency-generalization framing is insightful and not present in existing surveys. The Cosmos/LS-Imagine hybrid suggestion is forward-looking.
- The Renderer chapter correctly identifies The Matrix as a major oversight in other surveys — this is the kind of domain expertise that gives the survey authority.

### CRITICAL Issues
**C2: Missing explicit positioning against Chen (2026).** Chen Deli's auto_research_survey.pdf (May 2026) is a closely related survey on autonomous research agents that uses an L1-L5 autonomy taxonomy. While the topics differ, the structural approach — adopt a clean taxonomy, survey systems within each level — is identical. The paper should cite and differentiate from Chen (2026), even if only in §1.4. Currently it is absent, which reads as a gap given the timing and structural similarity.

### MAJOR Issues
**M3: IRIS and DIAMOND are undercited in §4.** These papers are mentioned in the reference list but not discussed in the body text of §4.2 "Beyond RSSMs." IRIS (ICLR 2023 Notable Top 5%) pioneered the Transformer-as-world-model paradigm and directly influenced STORM and DIAMOND. DIAMOND (NeurIPS 2024 Spotlight) achieved SOTA Atari 100k with a diffusion-based world model. Both deserve at least one sentence each in §4.2.

### MINOR Issues
**m2:** The GNS description (line 81) says "it has accumulated over 1,000 citations." Citation counts date quickly. Replace with a qualitative description of impact (e.g., "established the paradigm of learned physics simulation and spawned a substantial follow-up literature").

---

## Reviewer 3: Writing Quality & Accessibility Specialist

**Score: 73/100**

### Strengths
- The paper genuinely avoids metaphors and double negation. I searched for common patterns (not only/but also constructions, "it is not uncommon," spatial metaphors like "landscape/frontier/arena") and found the text remarkably clean. The few borderline cases ("exploded in usage," "cuts through," "capstone") have been caught in self-review.
- Parenthetical explanations of technical terms (VAE, POMDP, RSSM, distribution shift) are present at first use and are genuinely helpful, not condescending.
- Sentence length variety is good. Paragraphs are well-scoped (one idea per paragraph).

### No CRITICAL issues.

### MAJOR Issues
**M4: §5 attack vectors occasionally name-drop papers as if their existence proves feasibility.** For example, §5.1(c) says "WorldMem (NeurIPS 2025) showed that augmenting a video generation model with an external memory module... significantly improves long-term consistency." This paper is not in the main reference list with a full citation. Either provide the full citation and a brief description of the experimental result, or rephrase to describe the general approach without leaning on an uncited paper as evidence.

### MINOR Issues
**m3:** The paper uses em-dashes (—) 17 times. In academic writing, overuse of em-dashes can make prose feel breathless. Consider replacing 8-10 of these with periods or semicolons.

---

## Devil's Advocate: Premise Attack

**DA Score: N/A (advisory role)**

### The Premise Under Attack

The paper's premise is that Li's three-category taxonomy (Renderer/Simulator/Planner) is a valid and useful organizing framework for a world models survey. I attack this premise.

### Attack 1: The categories are not mutually exclusive in practice.

The paper itself acknowledges boundary cases: DIAMOND is both a Renderer (it generates video frames) and a Planner (it trains agents within those frames). Genie is both a Renderer (it generates interactive environments) and a Planner (the LAM infers actions). DreamerV3 appears in both Simulator and Planner discussions. If the taxonomy's categories blur this easily, is it actually clarifying the field, or is it imposing a structure that the field does not respect?

**Rebuttal assessment:** The paper acknowledges these boundary cases (DIAMOND, Genie, DreamerV3 are placed in specific chapters based on primary contribution). The taxonomy is explicitly described as a "functional" classification (by output type) rather than an architectural one, which is a defensible position. The boundary cases actually strengthen the paper's §5.2 argument that unification is an open problem. **Score: 3/5** (attack is valid but the paper has reasonable defenses).

### Attack 2: The Simulator chapter overfits to robotics-adjacent work.

§3's three core papers are GNS (general physics), One-Shot Real-to-Sim (robot manipulation), and PIN-WM (robot manipulation). Two of three core papers and most of the supplementary discussion involve physical robots. The paper's scope says "机器人仅作为自然载体提及," but §3 is substantively about robot manipulation pipelines. If the Simulator category is supposed to be the "conceptual hub" for all world models, why is it so narrowly instantiated in robotics?

**Rebuttal assessment:** This is the stronger attack. The Simulator category has applications in climate modeling, computational chemistry, and structural engineering that are entirely absent. The paper's defense would be that AI/ML world model research has indeed concentrated in robotics-adjacent learned simulation, and the survey reflects the literature rather than an ideal distribution. But the paper should acknowledge this concentration as a limitation. **Score: 4/5** (attack identifies a genuine scope tension).

### Attack 3: Li's taxonomy post is not peer-reviewed.

The organizing framework of the entire survey is a social media post from June 4, 2026 — literally yesterday. Basing a survey's conceptual architecture on a non-peer-reviewed taxonomy carries risk: if the taxonomy is later criticized, revised, or retracted by its author, the survey's structure becomes questionable. The paper says "We do not extend or challenge the taxonomy itself," which compounds the risk — it accepts the framework uncritically.

**Rebuttal assessment:** The taxonomy is from a senior researcher (Li Fei-Fei, Stanford) with deep expertise in the area. The paper uses the taxonomy as an organizational convenience, not as a theoretical claim. The disclaimer "We do not extend or challenge the taxonomy itself" is honest about this. However, the paper should explicitly note the taxonomy's non-peer-reviewed status as a limitation and discuss whether alternative taxonomies would produce different insights. **Score: 3/5** (valid concern but manageable with a disclosure).

### DA Verdict
The premise survives scrutiny with modifications. The attacks identify real tensions (category overlap, Simulator narrowness, non-peer-reviewed taxonomy) that the paper should acknowledge rather than resolve. The paper does not need to abandon the taxonomy, but it needs a "Limitations of This Survey" paragraph in §1.4 that addresses these three concerns.

---

## Revision Checklist

### CRITICAL (must fix)
- [ ] **C1:** Restructure abstract to include key findings per category and implications (R1)
- [ ] **C2:** Cite and differentiate from Chen Deli (2026) auto_research_survey.pdf in §1.4 (R2)

### MAJOR (should fix)
- [ ] **M1:** Add comparison/synthesis paragraph to §2.3 connecting The Matrix, GameNGen, and GEN3C (R1)
- [ ] **M2:** Expand §3.4 with a synthetic paragraph on why object-centric representations matter (R1)
- [ ] **M3:** Add IRIS and DIAMOND discussion to §4.2 body text (R2)
- [ ] **M4:** Provide full citations for papers referenced in §5 attack vectors (R3)

### MINOR (consider fixing)
- [ ] **m1:** Improve POMDP explanation in §1.3 (R1)
- [ ] **m2:** Replace "1,000+ citations" with qualitative impact description (R2)
- [ ] **m3:** Reduce em-dash count from 17 to ~8-10 (R3)

### DA Recommendations (advisory)
- [ ] Add "Limitations of This Survey" paragraph to §1.4 addressing: category overlap, Simulator robotics concentration, non-peer-reviewed taxonomy
- [ ] Add explicit acknowledgment that boundary cases (DIAMOND, Genie) demonstrate category overlap, which itself motivates the unification problem in §5.2

---

## Score Breakdown

| Dimension | R1 | R2 | R3 | Avg |
|-----------|----|----|----|-----|
| Technical Accuracy | 72 | 76 | — | 74 |
| Coverage & Completeness | 68 | 73 | — | 70.5 |
| Structure & Organization | 75 | 72 | — | 73.5 |
| Writing Quality | — | — | 78 | 78 |
| Originality & Insight | 70 | 75 | — | 72.5 |
| §5 Depth & Actionability | 67 | 74 | 72 | 71 |
| **Composite** | **70** | **74** | **73** | **72** |

**Decision: Minor Revision (72/100)**
