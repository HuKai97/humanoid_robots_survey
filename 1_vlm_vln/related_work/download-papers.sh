#!/usr/bin/env bash
# =============================================================================
# 批量下载 related_work 中论文的 PDF（按 research-workflow 的约定：
# related_work/ 每篇论文应保留 paper.pdf；本脚本把 PDF 下载到对应分类目录，
# 文件名为 <arxiv-id>.pdf）
#
# 用法:
#   bash download-papers.sh                 # 下载全部
#   bash download-papers.sh vln             # 只下载 vln/ 分类
#   bash download-papers.sh multimodal-llm benchmarks
#
# 依赖: curl；arXiv 网络可达。已有文件自动跳过（幂等）。
# =============================================================================
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 格式: "arxiv-id|相对目录"
PAPERS=(
  # ---- 综述 ----
  "2203.12667|vln"
  "2306.13549|multimodal-llm"
  "2309.10020|multimodal-llm"
  # ---- multimodal-llm/01-foundations ----
  "2010.11929|multimodal-llm/01-foundations"
  "2103.00020|multimodal-llm/01-foundations"
  "2204.14198|multimodal-llm/01-foundations"
  "2201.12086|multimodal-llm/01-foundations"
  "2301.12597|multimodal-llm/01-foundations"
  # ---- multimodal-llm/02-instruction-tuning ----
  "2303.08774|multimodal-llm/02-instruction-tuning"
  "2304.08485|multimodal-llm/02-instruction-tuning"
  "2304.10592|multimodal-llm/02-instruction-tuning"
  "2304.14178|multimodal-llm/02-instruction-tuning"
  "2305.06500|multimodal-llm/02-instruction-tuning"
  "2310.03744|multimodal-llm/02-instruction-tuning"
  "2408.03326|multimodal-llm/02-instruction-tuning"
  # ---- multimodal-llm/03-scaling-and-engineering ----
  "2308.12966|multimodal-llm/03-scaling-and-engineering"
  "2409.12191|multimodal-llm/03-scaling-and-engineering"
  "2502.13923|multimodal-llm/03-scaling-and-engineering"
  "2312.14238|multimodal-llm/03-scaling-and-engineering"
  "2404.16821|multimodal-llm/03-scaling-and-engineering"
  "2412.05271|multimodal-llm/03-scaling-and-engineering"
  "2311.03079|multimodal-llm/03-scaling-and-engineering"
  "2403.05525|multimodal-llm/03-scaling-and-engineering"
  "2408.01800|multimodal-llm/03-scaling-and-engineering"
  "2406.16860|multimodal-llm/03-scaling-and-engineering"
  "2405.02246|multimodal-llm/03-scaling-and-engineering"
  # ---- multimodal-llm/04-embodied-vla ----
  "2303.03378|multimodal-llm/04-embodied-vla"
  "2307.15818|multimodal-llm/04-embodied-vla"
  "2401.12168|multimodal-llm/04-embodied-vla"
  "2305.15021|multimodal-llm/04-embodied-vla"
  # ---- vln/01-datasets ----
  "1711.07280|vln/01-datasets"
  "1905.12255|vln/01-datasets"
  "1907.04957|vln/01-datasets"
  "1904.10151|vln/01-datasets"
  "2010.07954|vln/01-datasets"
  "2103.17138|vln/01-datasets"
  "2110.02207|vln/01-datasets"
  "2109.08238|vln/01-datasets"
  # ---- vln/02-classical-methods ----
  "1806.02724|vln/02-classical-methods"
  "1811.10092|vln/02-classical-methods"
  "1904.04195|vln/02-classical-methods"
  "2002.10638|vln/02-classical-methods"
  "2011.13922|vln/02-classical-methods"
  "2108.09105|vln/02-classical-methods"
  "2110.13309|vln/02-classical-methods"
  "2202.11742|vln/02-classical-methods"
  "2303.08409|vln/02-classical-methods"
  "2304.03047|vln/02-classical-methods"
  "2109.15207|vln/02-classical-methods"
  # ---- vln/03-llm-era ----
  "2305.16986|vln/03-llm-era"
  "2309.11382|vln/03-llm-era"
  "2405.10620|vln/03-llm-era"
  "2401.07314|vln/03-llm-era"
  "2403.07376|vln/03-llm-era"
  "2311.06430|vln/03-llm-era"
  "2402.15852|vln/03-llm-era"
  "2412.04453|vln/03-llm-era"
  "2502.11142|vln/03-llm-era"
  "2312.02010|vln/03-llm-era"
  # ---- benchmarks ----
  "1904.08920|benchmarks"
  "2007.00398|benchmarks"
  "2203.10244|benchmarks"
  "2209.09513|benchmarks"
  "2311.16502|benchmarks"
  "2310.02255|benchmarks"
  "2307.06281|benchmarks"
  "2307.16125|benchmarks"
)

# 可选参数：只下载指定分类（匹配相对目录前缀）
filter=""
if [ "$#" -gt 0 ]; then
  filter="$*"
fi

count=0
fail=0
for p in "${PAPERS[@]}"; do
  id="${p%%|*}"
  dir="${p##*|}"
  if [ -n "$filter" ] && [[ " $filter " != *" $dir "* ]] \
     && [[ "$filter" != *"${dir%%/*}"* ]]; then
    continue
  fi
  target="$ROOT/$dir/$id.pdf"
  if [ -f "$target" ]; then
    echo "skip (exists): $id"
    continue
  fi
  mkdir -p "$ROOT/$dir"
  echo "fetch: $id -> $dir/"
  if curl -sL -A "Mozilla/5.0 (X11; Linux x86_64)" --retry 2 --max-time 120 \
          -o "$target" "https://arxiv.org/pdf/$id"; then
    count=$((count+1))
  else
    echo "  !! failed: $id"
    rm -f "$target"
    fail=$((fail+1))
  fi
done

echo "----------------------------------------"
echo "done. downloaded: $count, failed: $fail"
