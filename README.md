
|<img src=img/42_env_banner.png alt="header_logo" align="center">|
|---|

# 42 Environment Configuration Script for [Ubuntu 22.04 LTS or + ](https://releases.ubuntu.com/jammy/)
Automatiza la instalación y configuración del entorno básico necesario para programar en el cursus de 42.

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







