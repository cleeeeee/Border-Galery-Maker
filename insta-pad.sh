#!/usr/bin/env bash
set -e

INPUT_DIR="${1:?Usage: insta-pad.sh INPUT_DIR OUTPUT_DIR}"
OUTPUT_DIR="${2:?Usage: insta-pad.sh INPUT_DIR OUTPUT_DIR}"

# Enlève le slash final si présent (important pour rel=...)
INPUT_DIR="${INPUT_DIR%/}"
OUTPUT_DIR="${OUTPUT_DIR%/}"

command -v magick >/dev/null 2>&1 || { echo "magick introuvable. Vérifie ton PATH."; exit 1; }

mkdir -p "$OUTPUT_DIR"

BORDER_PCT=10   # augmente à 8 ou 10 si tu veux un effet galerie plus marqué

count=0
find "$INPUT_DIR" -type f \( \
  -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.tif" -o -iname "*.tiff" \
\) -print0 | while IFS= read -r -d '' f; do
  count=$((count+1))

  rel="${f#"$INPUT_DIR"/}"
  outdir="$OUTPUT_DIR/$(dirname "$rel")"
  mkdir -p "$outdir"
  out="$outdir/$(basename "$f")"

  w=$(magick identify -format "%w" "$f")
  h=$(magick identify -format "%h" "$f")

  # Bordure “galerie” en px (pourcentage du plus petit côté)
  border=$(python3 - <<PY
import math
w=int("$w"); h=int("$h"); pct=int("$BORDER_PCT")
m=min(w,h)
print(int(math.ceil(m*pct/100)))
PY
)

  # Dimensions après ajout de la bordure interne
  bw=$((w + 2*border))
  bh=$((h + 2*border))

  # Toutes les photos -> Ratio final 4:5 strict
  canvasW=$(python3 - <<PY
import math
bw=int("$bw"); bh=int("$bh")
print(bw if bw/bh > 0.8 else int(math.ceil(bh*4/5)))
PY
)

  canvasH=$(python3 - <<PY
import math
bw=int("$bw"); bh=int("$bh")
print(int(math.ceil(bw*5/4)) if bw/bh > 0.8 else bh)
PY
)

  echo "[$count] $(basename "$f") -> border ${border}px, final ${canvasW}x${canvasH}"

  magick "$f" -auto-orient \
    -bordercolor white -border "${border}x${border}" \
    -background white -gravity center -extent "${canvasW}x${canvasH}" \
    "$out"
done

echo "Terminé."
echo "Sortie: $OUTPUT_DIR"
