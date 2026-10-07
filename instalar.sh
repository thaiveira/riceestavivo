#!/bin/bash
# Instala o HUD Conky: copia os arquivos para os lugares certos.
# Rode dentro da pasta onde estao os arquivos:  bash instalar.sh
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$HOME/.config/conky" "$HOME/.config/autostart"
cp "$DIR/hud.conf"  "$HOME/.config/conky/hud.conf"
cp "$DIR/hud.sh"    "$HOME/.config/conky/hud.sh"
cp "$DIR/star.png"  "$HOME/.config/conky/star.png"
chmod +x "$HOME/.config/conky/hud.sh"
cp "$DIR/conky-hud.desktop" "$HOME/.config/autostart/conky-hud.desktop"

echo "Arquivos instalados."
echo
echo "Teste dos sensores (devem ser numeros):"
echo -n "  cpu_temp: "; "$HOME/.config/conky/hud.sh" cpu_temp
echo -n "  gpu_temp: "; "$HOME/.config/conky/hud.sh" gpu_temp
echo -n "  gpu_use:  "; "$HOME/.config/conky/hud.sh" gpu_use
echo

if ! fc-list | grep -qi "vt323"; then
  echo "AVISO: fonte VT323 nao encontrada. Instale em ~/.local/share/fonts e rode fc-cache -f"
fi
if ! fc-list | grep -qi "space mono"; then
  echo "AVISO: fonte Space Mono nao encontrada. Instale em ~/.local/share/fonts e rode fc-cache -f"
fi

echo
echo "Para ver agora:  killall conky 2>/dev/null; conky -c ~/.config/conky/hud.conf &"
echo "No proximo login ele abre sozinho."
