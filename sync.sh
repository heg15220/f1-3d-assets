#!/usr/bin/env bash
# Sube los assets a GitHub Releases. Una release por carpeta: <categoria>/<subcarpeta> -> tag "<categoria>-<subcarpeta>"
# Solo sube archivos nuevos o con tamaño distinto (no re-sube todo).
# Uso:  ./sync.sh            (desde Git Bash, en esta carpeta)
set -euo pipefail
cd "$(dirname "$0")"
REPO="heg15220/f1-3d-assets"

for dir in */*/; do
  dir="${dir%/}"
  shopt -s nullglob
  files=("$dir"/*.*)
  shopt -u nullglob
  [ ${#files[@]} -eq 0 ] && continue
  tag="${dir//\//-}"
  if ! gh release view "$tag" -R "$REPO" >/dev/null 2>&1; then
    echo "Creando release $tag"
    gh release create "$tag" -R "$REPO" --title "$dir" --notes "Assets de \`$dir\`" >/dev/null
  fi
  existing="$(gh release view "$tag" -R "$REPO" --json assets -q '.assets[] | "\(.name)\t\(.size)"')"
  for f in "${files[@]}"; do
    name="$(basename "$f")"
    size="$(stat -c %s "$f")"
    remote="$(printf '%s\n' "$existing" | awk -F'\t' -v n="$name" '$1==n{print $2}')"
    if [ "$remote" = "$size" ]; then continue; fi
    echo "Subiendo $f ($size bytes) -> $tag"
    gh release upload "$tag" "$f" -R "$REPO" --clobber
  done
done

# Regenera el manifiesto
{
  echo "# Manifiesto de assets"
  echo
  echo "| Release | Archivo | Tamaño (MB) |"
  echo "|---|---|---|"
  for dir in */*/; do
    dir="${dir%/}"; tag="${dir//\//-}"
    for f in "$dir"/*.*; do
      [ -e "$f" ] || continue
      printf '| %s | %s | %.1f |\n' "$tag" "$(basename "$f")" "$(awk -v s="$(stat -c %s "$f")" 'BEGIN{print s/1048576}')"
    done
  done
} > MANIFEST.md
echo "Listo. Revisa MANIFEST.md y haz commit si ha cambiado."
