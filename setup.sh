#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Social Research Assistant — 一键安装脚本
# 安装所有依赖工具到当前环境（仅 Claude Code）
# ============================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()  { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
fail() { echo -e "${RED}[✗]${NC} $1"; exit 1; }

echo ""
echo "=============================================="
echo " Social Research Assistant — 依赖安装"
echo "=============================================="
echo ""

# ---- 0. 检查 Claude Code ----
if command -v claude &>/dev/null; then
    log "Claude Code 已安装: $(claude --version 2>&1 | head -1)"
else
    fail "未检测到 Claude Code CLI。请先安装: npm install -g @anthropic-ai/claude-code"
fi

# ---- 1. OpenSpec (npm) ----
echo ""
echo "--- OpenSpec (规格驱动研究设计) ---"
if command -v openspec &>/dev/null; then
    log "OpenSpec 已安装: $(openspec --version 2>&1)"
else
    warn "正在安装 OpenSpec..."
    npm install -g @fission-ai/openspec@latest && log "OpenSpec 安装完成" || warn "OpenSpec 安装失败，可稍后手动安装: npm install -g @fission-ai/openspec"
fi

# ---- 2. GPT Researcher (pip) ----
echo ""
echo "--- GPT Researcher (自主深度搜索) ---"
if python3 -c "import gpt_researcher" 2>/dev/null; then
    log "GPT Researcher 已安装"
else
    warn "正在安装 GPT Researcher..."
    pip install gpt-researcher && log "GPT Researcher 安装完成" || warn "GPT Researcher 安装失败，可稍后手动安装: pip install gpt-researcher"
fi

# ---- 3. Academic Research Skills (Claude Code plugin) ----
echo ""
echo "--- Academic Research Skills (学术质量门禁) ---"
if claude plugin list 2>/dev/null | grep -q "academic-research-skills"; then
    log "Academic Research Skills 已安装"
else
    warn "正在安装 Academic Research Skills..."
    echo "  在 Claude Code 中运行: /plugin install academic-research-skills"
    echo "  或运行: claude plugin install academic-research-skills"
    claude plugin install academic-research-skills 2>/dev/null && log "Academic Research Skills 安装完成" || warn "请手动运行: /plugin install academic-research-skills"
fi

# ---- 4. Ralph Loop (Claude Code plugin) ----
echo ""
echo "--- Ralph Loop (自主迭代引擎) ---"
if claude plugin list 2>/dev/null | grep -q "ralph-wiggum"; then
    log "Ralph Loop 已安装"
else
    warn "正在安装 Ralph Loop..."
    claude plugin install anthropics/ralph-wiggum 2>/dev/null && log "Ralph Loop 安装完成" || warn "请手动运行: /plugin install anthropics/ralph-wiggum"
fi

# ---- 完成 ----
echo ""
echo "=============================================="
echo " 安装完成"
echo "=============================================="
echo ""
echo "已安装工具:"
echo "  OpenSpec          — 规格驱动研究设计"
echo "  GPT Researcher    — 自主深度搜索"
echo "  Academic Research Skills — 学术质量门禁"
echo "  Ralph Loop        — 自主迭代引擎"
echo ""
echo "内置命令（无需安装，Claude Code 自带）:"
echo "  /goal             — 目标驱动实现，流水线的执行引擎"
echo ""
echo "启动研究: 在 Claude Code 中输入你的研究问题即可。"
echo ""
