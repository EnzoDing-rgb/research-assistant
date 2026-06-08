# Slide 01 · 封面出图 Prompt（自包含，无需 ian-handdrawn skill）

> 给 **没有安装 ian-handdrawn-ppt skill** 的 Claude Code 用。  
> 任务：生成第 1 页 **21:9 手绘风封面 PNG**，保存到本仓库。

---

## 你要做的事（Claude Code 执行清单）

1. 读风格参考图：`deck/assets/reference-style.png`（若有图像能力，attach 这张图）
2. 用你能用的 **最高质量文生图模型** 生成一张图（优先 ChatGPT Image / DALL·E / 同级）
3. 画幅：**21:9**，目标尺寸 **2520×1080**（不支持就保持 21:9 比例并报告实际像素）
4. 保存为：`deck/assets/slide-01-cover.png`
5. 自检下面「验收清单」；中文错字就减字重生成

**不要**：HTML/SVG 代画、python-pptx、可编辑 PPTX。要 **最终 raster PNG**。

---

## 这一页讲什么（内容 brief）

| 项 | 内容 |
|----|------|
| 页码 | 01 / 07（封面可省略页码；若要页码用 `01 / 07` 左上角小字） |
| 主题 | Auto Research — 端到端科研自动化 |
| 版式 archetype | **Cover Metaphor**（封面隐喻） |
| 一句话主旨 | 研究不是一次聊天写完，而是一条可重复、可审计的自动化管线 |
| 视觉隐喻 | 打开的笔记本 + `/auto-research` 手写感标题；边角小涂鸦：终端窗口、论文堆、**循环箭头**（暗示 pipeline，不是单次对话） |

---

## Deck Style Lock（整套图统一风格，本页必须遵守）

```text
Refined commercial Chinese handdrawn technical article/PPT illustration.
Complete raster image on very light warm white paper, near #FBFAF5, with extremely subtle grain.
No full-page border and no rectangular frame.
Upper-left small page number in handwritten style (optional on cover).
Centered medium Chinese title with one pale blue handdrawn underline.
Small subtitle under title when needed.
Fine black ink and pencil linework, delicate hatching, stable but slightly irregular.
Muted pastel marker labels: pale blue, sage green, peach, lavender.
Sparse corner construction marks only: faint pale grey grid, dots, ruler ticks, measurement lines.
Generous negative space, calm premium teaching-note feeling.
Central diagram small and refined, about 50-55% of page width on cover.
At most one tiny person/engineer, far in a corner; usually none.
Avoid: full-page border, yellow paper, beige paper, giant fonts, cheap poster look,
childish doodles, many characters, thick marker strokes, dense bullets, corporate template,
shadows, gradients, neon, watermark, gibberish text, English filler.
```

---

## Cover Role Lock（封面专用）

```text
Page role: cover image.
Canvas: 21:9 ultra-wide, preferred final size 2520x1080.
Title may be medium-large but still elegant and restrained (not poster-sized).
Main metaphor occupies about 50-55% of page width.
Wide empty margins. Premium article-cover feeling, not business PPT template.
```

---

## 完整出图 Prompt（直接复制给图像模型）

```text
Use case: Chinese technical presentation cover image.
Asset type: one complete 21:9 ultra-wide Chinese handdrawn technical cover image, final raster PNG.
Preferred final size: 2520x1080.

Page role: cover image.
Page: 01 / 07 of a 7-page deck (page number optional; if shown, small upper-left "01 / 07").
Archetype: cover metaphor.
Main point: Auto Research turns research into an end-to-end automated pipeline, not a one-shot chat output.

Apply style lock:
Refined Chinese handdrawn technical illustration on very light warm white paper #FBFAF5,
extremely subtle grain, no full-page border, fine ink and pencil lines, delicate hatching,
muted pastel labels (pale blue, sage green, peach, lavender), sparse faint grey corner
grid/ruler construction marks, large negative space, calm premium teaching-note aesthetic.

Composition (handdrawn object diagram, not generic boxes):
- Center-top: medium restrained handdrawn Chinese title with one pale blue underline.
- Below title: short subtitle line.
- Center: an open notebook/sketchbook on a desk, hand-drawn with fine lines.
  On the notebook page, sketch "/auto-research" in a casual handwritten style (Latin slash path).
- Around the notebook, small refined doodles (keep tiny, do not crowd):
  (1) minimal terminal window icon with a few lines of code,
  (2) small stack of paper sheets suggesting literature,
  (3) a circular loop of arrows suggesting multi-stage research pipeline (not single chat bubble).
- Central metaphor group occupies about 50-55% of page width; wide calm margins.

Required text only (exact Chinese, short, legible — do not invent other text):
Title: 自动科研
Subtitle: 端到端自动化 · 不是一次性写综述
Small line below subtitle: Skills × Claude Code

Optional small Latin on notebook sketch only: /auto-research

Avoid:
full-page border, yellow/beige paper, oversized title, poster layout, heavy quote boxes,
extra invented labels, wrong Chinese characters, gibberish, watermark, many people,
corporate template, neon, gradients, shadows, English sentences beyond "Skills × Claude Code".
```

---

## 中文文字预算（越少越稳）

| 元素 | 字数 |
|------|------|
| 标题 | 自动科研（4 字） |
| 副标题 | 端到端自动化 · 不是一次性写综述 |
| 小字 | Skills × Claude Code |

若模型中文渲染失败：**先减字**（例如副标题改成「端到端科研自动化」），再重生。仍不行可留空白标签区，后期叠字。

---

## 验收清单（生成后自检）

- [ ] 画幅 21:9，接近 2520×1080
- [ ] 纸色近白 `#FBFAF5`，**不发黄**
- [ ] **无**整页边框
- [ ] 标题居中、克制，有淡蓝手绘下划线
- [ ] 中央图小而精，留白多
- [ ] 中文与 Required text 一致，无乱码、无多余英文
- [ ] 有 pipeline/循环感，不是「一个聊天框 → 一篇长文」
- [ ] 文件已保存：`deck/assets/slide-01-cover.png`

---

## 风格参考图路径

```
deck/assets/reference-style.png
```

（来自 [ian-handdrawn-ppt](https://github.com/helloianneo/ian-handdrawn-ppt) 官方 style anchor；出图时尽量 match 其纸色、线条、留白、标题处理。）

---

## 给 Claude Code 的一句话任务

```
请读 deck/slide-01-prompt.md，参考 deck/assets/reference-style.png，
按其中的 Complete Page Image Prompt 生成第 1 页 21:9 手绘封面，
保存为 deck/assets/slide-01-cover.png，并按验收清单自检。
```
