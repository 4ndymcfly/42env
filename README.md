
|<img src=img/42_env_banner.png alt="header_logo" align="center">|
|---|

# 42 ENVironment Configuration Script
Automatiza la instalación y configuración del entorno básico necesario para programar en el cursus de 42.
|---|
Testeado en [Ubuntu 22.04 LTS](https://releases.ubuntu.com/jammy/)

## Software

Este script instala el siguiente software en el caso de que no esté instalado:

- **LavyVim |** [Neovim setup powered](https://www.lazyvim.org/) + Plugins 42
- **git |** [Git Fast Version Control](https://git-scm.com/doc)
- **python3 |** [Python 3.10.2](https://docs.python.org/3.10/)
- **pip3 |** [Package Installer for Python](https://pip.pypa.io/en/stable/)
- **zsh |** [Shell ZSH](https://www.zsh.org/)
- **ripgrep |** [Recursively searches by regex pattern](https://github.com/BurntSushi/ripgrep)
- **fd / fd-find |** [Simply alternative to 'find'](https://github.com/sharkdp/fd)
- **luarocks |** [Package manager for Lua modules](https://luarocks.org/)
- **kitty |** [GPU based terminal emulator](https://sw.kovidgoyal.net/kitty/)
- **nerd fonts |** [Iconic font aggregator, collection, and patcher](https://www.nerdfonts.com/) | Hack Nerd Font
- **lsd |** [The next gen ls command](https://github.com/lsd-rs/lsd)
- **lazygit |** [Simple terminal UI for git commands](https://github.com/jesseduffield/lazygit)
- Atajos de teclado para 'nvim' y config para .zshrc

## Recomendaciones

**IMPORTANTE:** Antes de comenzar el proceso se recomienda hacer copia de seguridad o un snapshot del estado actual de la máquina virtual.

## Instalación

|<img src=img/001.png alt="header_logo" align="center">|
|---|

Primero descargamos el repositorio y entramos en la carpeta 42env del repositorio clonado.
```bash
git clone https://github.com/4ndymcfly/42env.git ; cd 42env
```
Ahora asignaermos permisos de ejecución al script y lo ejecutaremos. Se recomienda tener siempre maximizada la ventana de la shell.
```bash
chmod +x 42env.sh ; ./42env.sh
```
|<img src=img/002_install_log.png alt="header_logo" align="center">|
|---|

Una vez que haya terminado todo el proceso. Pulsaremos la tecla `Enter` y se reiniciará el equipo.
Una vez arrancado el sistema pulsaremos en el nuevo icono de 'kitty', maximizaremos la ventana y ejecutaremos 'nvim'.
```bash
nvim
```
|<img src=img/003_kitty_term.png alt="header_logo" align="center">|
|---|

Si no pulsamos con el ratón en la ventana de instalación, puede que el instalador nos pida que pulsemos una tecla. Si es tu caso pulsa la tecla `espacio`, la configuración continuará y acabará cuando nos solicite que pulsemos `enter`.

|<img src=img/004_lazyvim_install.png alt="header_logo" align="center" width="500">|<img src=img/005_lazyvim_install_2.png alt="header_logo" align="center" width="500">|
|---|---|

Esperamos unos instantes y ya tenemos LazyVim preparado y con todo configurado para comenzar.

|<img src=img/006_lazyvim_install_3.png alt="header_logo" align="center">|
|---|



