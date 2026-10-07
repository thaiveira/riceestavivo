# HUD com Conky 
Transformei a tela do meu Linux em um painel com a identidade do meu site.

🖥️ O que é:
Um painel que mostra, em tempo real: uso de processador, placa de vídeo, memória e disco, as temperaturas, o tempo ligado e um relógio grande com a data.

🛠️ Como funciona:
- Usei o [Conky](https://github.com/brndnmtthws/conky), um programa leve que desenha informações do sistema na área de trabalho.
- Escrevi um pequeno script em Shell que lê os sensores da minha máquina (processador e placa AMD).
- Um arquivo de configuração define o visual: cores lilás, fontes pixel (VT323 e Space Mono) e o posicionamento de cada elemento.
- Um arquivo de inicialização automática abre o painel sozinho alguns segundos pós inicialização completa da máquina.

Para instalar:

```bash
sudo apt install conky-std lm-sensors xdotool
cd ~/Downloads/hud-conky
bash instalar.sh
killall conky 2>/dev/null; conky -c ~/.config/conky/hud.conf &
```
HUD CONKY (Thaiveira)

1) Dependencias:   sudo apt install conky-std lm-sensors xdotool
2) Fontes:         VT323 e Space Mono 
3) Instalar:       cd pasta/hud-conky && bash instalar.sh
4) Ver agora:      killall conky 2>/dev/null; conky -c ~/.config/conky/hud.conf &
5) Mover:          Alt + arrastar; depois rode ~/.config/conky/salvar-posicao.sh
6) Autostart:      ~/.config/autostart/conky-hud.desktop (abre 8s apos o login)

Arquivos:
 hud.conf            visual e layout do widget
 hud.sh              leitura de temperatura/uso (AMD)
 star.png            estrela pixel (personalize usando a imagem que quiser com mesmo nome)
 salvar-posicao.sh   grava a posicao depois de arrastar
 conky-hud.desktop   inicio automático 
 instalar.sh         copia tudo para os lugares certos

Se o widget aparecer no Alt+Tab, volte own_window_type para 'desktop' no hud.conf.

O terminal é o tema nekonight_moon do [𝗢𝗵 𝗠𝘆 𝗕𝗮𝘀𝗵](https://github.com/ohmybash) e

<img width="1360" height="768" alt="Captura de tela de 2026-10-03 12-51-03" src="https://github.com/user-attachments/assets/426a1696-ae42-4173-81e9-a175dc6b0467" />



