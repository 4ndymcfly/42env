
<div align="center">
  <img src="img/42_env_banner.png" alt="header_logo">
</div>

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

Si no pulsamos con el ratón en la ventana de instalación, puede que el instalador nos pida que pulsemos una tecla. Si es tu caso pulsa la tecla `espacio`, la configuración continuará y acabará cuando nos solicite que pulsemos `enter`.

|<img src=img/004_lazyvim_install.png alt="header_logo" align="center" width="500">|<img src=img/005_lazyvim_install_2.png alt="header_logo" align="center" width="500">|
|---|---|

Esperamos unos instantes y ya tenemos LazyVim preparado y con todo configurado para comenzar.

|<img src=img/006_lazyvim_install_3.png alt="header_logo" align="center">|
|---|

Pulsamos `F4` y cerramos nvim (ya tenemos el acceso de teclado configurado).

## LazyVim

Si ejecutas `nvim` solamente, sin ningun nombre de archivo, accederás al menu principal de `LazyVim` que te permitirá realizar muchas acciones.

<img src=img/007_lazyvim_install_4_end.png alt="header_logo" align="center">

<img src=img/020_nvim_recent_files.png alt="header_logo" align="center">

# Uso básico de LazyVim

En LazyVim tenemos definidas 6 teclas principales para el uso diario:

#### Tecla `F1` > Inserta el header de 42, hace un retorno de carro y pone el editor en modo `Insert`
<img src=img/008_header_42.png alt="header_logo" align="center">

#### Tecla `F2` > Formatea el código para presentarla a la norminette
|<img src=img/010_example_code.png alt="header_logo" align="center" width="500">|<img src=img/012_fix_errors.png alt="header_logo" align="center" width="600">|
|---|---|

#### Tecla `F3` > Ejecuta norminette con las flags `-R CheckForbiddenSourceHeader`
<img src=img/011_errors_norminette.png alt="header_logo" align="center">

#### Tecla `F4` > Cierra la ventana activa / norminette / Cierra 'nvim' / Equivale a `:q`
|<img src=img/013_norminette_ok.png alt="header_logo" align="center" width="600">|<img src=img/012_fix_errors.png alt="header_logo" align="center" width="600">|
|---|---|

#### Tecla `F5` > Guarda el documento activo / Equivale a `:w`

#### Tecla `F6` > Abre-Cierra el explorador de archivos
<img src=img/014_nvim_explorer.png alt="header_logo" align="center">

|Todos los demás atajos de `vim` funcionan igual.|
|---|

## Extras

# LSD (LSDeluxe)
La configuración incluye la instalación de LSD ya que considero que le da un plus y mayor legibilidad a la terminal aprovechando que hemos instalado las Nerd Fonts.
El alias `ll` equivale a:
```bash
/usr/bin/lsd -lha --group-dirs=first
```
<img src=img/018_lsd_example.png alt="header_logo" align="center">

Si por más comodidad queremos ver los permisos de los archivos y carpetas en octal lo haremos con `llo` que es un alias de:
```bash
/usr/bin/lsd -lha --group-dirs=first --permission octal
```
<img src=img/019_lsd_example_octal.png alt="header_logo" align="center">

# LazyGit
Lazygit es ideal para quienes prefieren usar la terminal pero quieren una forma más cómoda y rápida de manejar Git sin tener que escribir todos los comandos manualmente. Resulta especialmente útil para desarrolladores que trabajan con repositorios grandes y complejos, ya que facilita la visualización de los cambios y permite moverse ágilmente entre las distintas secciones del repositorio.
#### ¡Por probarlo no pierdes nada!
<img src=img/021_lazy_git.png alt="header_logo" align="center">

## Terminal

# Kitty
<div align="center">
  <img src="https://github.com/user-attachments/assets/57ab74e0-e41a-45fe-b677-cb2799135ff4" alt="Kitty Logo" width="500"/>
</div>

Kitty es una excelente opción si buscas un emulador de terminal que combine velocidad, personalización y funcionalidad avanzada, ideal para usuarios que desean aprovechar al máximo su entorno de trabajo en la terminal.

| Atajo | Descripción |
| --- | --- |
| `Ctrl` + `Shift` + `Enter` | Abrir una nueva ventana en el directorio actual |
| `Ctrl` + `Shift` + `w` | Cierra la terminal o la ventana activa |
| `Ctrl` + `Shift` + `T` | Abrir una nueva pestaña en el directorio actual |
| `Ctrl` + `Shift` + `Alt` + `T` | Renombra la pestaña en el directorio actual |
| `Ctrl` + `←` | Mover a la ventana vecina a la izquierda |
| `Ctrl` + `→` | Mover a la ventana vecina a la derecha |
| `Ctrl` + `↑` | Mover a la ventana vecina hacia arriba |
| `Ctrl` + `↓` | Mover a la ventana vecina hacia abajo |
| `Ctrl` + `Shift` + `J` | Hacer la ventana más ancha en 5 unidades |
| `Ctrl` + `Shift` + `L` | Hacer la ventana más estrecha en 5 unidades |
| `Ctrl` + `Shift` + `I` | Hacer la ventana más alta en 3 unidades |
| `Ctrl` + `Shift` + `K` | Hacer la ventana más baja en 3 unidades |
| `Shift` + `Alt` + `↑` | Desplazar al principio del buffer de desplazamiento |
| `Shift` + `Alt` + `↓` | Desplazar al final del buffer de desplazamiento |
| `Shift` + `Alt` + `←` | Desplazar una página hacia arriba |
| `Shift` + `Alt` + `→` | Desplazar una página hacia abajo |
| `Ctrl` + `Shift` + `Z` | "Zoom" Alternar entre el diseño en mosaico o pantalla completa |

<img src=img/017_kitty_example_01.png alt="header_logo" align="center">

Soporte para imágenes y gráficos: Kitty puede mostrar imágenes directamente en la terminal, lo que es útil para tareas que requieren visualización gráfica sin salir del entorno de línea de comandos. el alias creado es `picture`.
```bash
picture imagen.jpg
```
### Pestañas
<img src=img/017_kitty_example_02.png alt="header_logo" align="center">

# En proceso...
Próximamente intentaré publicar el proyecto con un configuracion alternativa para su ejecución en usuarios con permisos limitados. Toda mejora es bienvenida.
#### Gracias!


