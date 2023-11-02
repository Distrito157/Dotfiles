
### Aviso
Algumas anotações podem ser inúteis para você, isso é uma configuração pessoal, as anotações para mim são uma forma de eu não esquecer as modificações e programas que eu utilizo.

### TODO
- Detalhar bem a configuração geral de todos arquivos e principalmente do config.lua do lvim.


### Especificações
**OS**: [VoidLinux](https://voidlinux.org/)<br/>
**WindowManager**: [Bspwm](https://github.com/baskerville/bspwm)<br/>
**Barra superior**: [Polybar](https://github.com/polybar/polybar)<br/>
**Emulador de Terminal**: [Alacritty](https://github.com/alacritty/alacritty)<br/>
**Multiplexador de Terminais**: [Tmux](https://github.com/tmux/tmux)<br/>
**Menu de Apps**: [Rofi](https://github.com/davatorium/rofi)<br/>
**Wallpaper usado**: [Link - Wallhaven](https://wallhaven.cc/w/0161q1)<br/>

### Fontes
##### NerdFonts
Costumo usar Nerd Fonts, pois elas possuem icons e as<br/> fontes originais costumam dar "bugs".
    <br/>Donwload das fontes: https://www.nerdfonts.com/font-downloads<br/>

    Lista das fontes:
    - Firacode
    - FiraMono 
    - 3270
    - FiraCode
    - Hack
    - Iosevka
    - MesloLG
<!-- <br/> -->

- Fonte que eu uso no terminal [Alacritty](https://github.com/alacritty/alacritty) é a FiraMono

##### Powerline Fonts
Donwload: https://github.com/powerline/fonts


### Monitores / Resolução
[Polybar](https://github.com/polybar/polybar) e [BSPWM](https://github.com/baskerville/bspwm) configurados para dois monitores de **1366x768** e **1024x768**

### Tmux
[Tpm](https://github.com/tmux-plugins/tpm): Manager de plugins para o tmux.<br/>
[tokyo-night](https://github.com/janoamaral/tokyo-night-tmux): Tema inspirado no tokyonight.<br/>
[tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect): Restaura sessões após shutdown ou reboot.<br/>

Fiz uma pequena modificação no tema tokyonight para combinar com a paleta do Lunarvim<br/>
Utilizando a cor #7aa2f7, a config fica dentro da pasta de plugins do tmux

### LunarVim + config pessoal
[LunarVim](https://www.lunarvim.org/): Distribuição NeoVim.<br/>

Modifiquei algumas cores do folding:
`/home/user/.local/share/lunarvim/site/pack/lazy/opt/lunar.nvim/lua/lunar/theme.lua`<br/>

Modifiquei a config do NerdTree:
`/home/user/.local/share/lunarvim/lvim/lua/lvim/core/nvimtree.lua`

