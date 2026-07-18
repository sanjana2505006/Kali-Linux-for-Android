#!/usr/bin/env bash
# optimize_gifs.sh — shrink README demo GIFs for faster loading
# Usage: ./scripts/optimize_gifs.sh [max_width] [fps]
# Example: ./scripts/optimize_gifs.sh 640 15

set -euo pipefail

MAX_WIDTH="${1:-640}"
FPS="${2:-15}"
SRC_DIR="assets/gifs"
OUT_DIR="${SRC_DIR}/optimized"

mkdir -p "$OUT_DIR"

if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "ffmpeg is required. Install with: pkg install ffmpeg  OR  apt install ffmpeg" >&2
  exit 1
fi

shopt -s nullglob
gifs=("$SRC_DIR"/*.gif)
if [ ${#gifs[@]} -eq 0 ]; then
  echo "No GIFs found in $SRC_DIR"
  exit 0
fi

for gif in "${gifs[@]}"; do
  fname="$(basename "$gif")"
  tmp="${OUT_DIR}/tmp-${fname}"
  out="${OUT_DIR}/${fname%.*}-opt.gif"

  ffmpeg -y -i "$gif" -vf "scale='min(${MAX_WIDTH},iw)':'-2',fps=${FPS}" "$tmp"
  if command -v gifsicle >/dev/null 2>&1; then
    gifsicle -O3 "$tmp" -o "$out"
    rm -f "$tmp"
  else
    mv "$tmp" "$out"
  fi
  echo "Optimized: $out"
done
