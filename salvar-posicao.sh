#!/bin/bash
# Salva a posicao atual do widget no hud.conf (use depois de arrastar com Alt + botao esquerdo).
id=$(xdotool search --class ConkyHUD | head -1)
[ -z "$id" ] && { echo "Widget nao encontrado. O Conky esta rodando?"; exit 1; }
eval "$(xdotool getwindowgeometry --shell "$id")"
sed -i "s/^  alignment = .*/  alignment = 'top_left',/; s/^  gap_x = [0-9-]*, gap_y = [0-9-]*,/  gap_x = $X, gap_y = $Y,/" "$HOME/.config/conky/hud.conf"
echo "Posicao salva: x=$X y=$Y"
