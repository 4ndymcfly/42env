#!/bin/bash

COLOR_TURQUESA="\e[36m"
COLOR_ROJO="\e[91m"
COLOR_VERDE="\e[92m"
COLOR_BLANCO="\e[97m"
COLOR_RESET="\e[0m"

banner() {
    echo -e "${COLOR_TURQUESA}"
    cat << "EOF"
    
  ┌─────────────────────────────────────────────────────────────┐
  │       ██╗  ██╗██████╗     ███████╗███╗   ██╗██╗   ██╗       │
  │       ██║  ██║╚════██╗    ██╔════╝████╗  ██║██║   ██║       │
  │       ███████║ █████╔╝    █████╗  ██╔██╗ ██║██║   ██║       │
  │       ╚════██║██╔═══╝     ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝       │
  │            ██║███████╗    ███████╗██║ ╚████║ ╚████╔╝        │
  │            ╚═╝╚══════╝    ╚══════╝╚═╝  ╚═══╝  ╚═══╝         │
  └─────────────────────────────────────────────────────────────┘
EOF
echo -e "${COLOR_RESET}"
echo -e "${COLOR_BLANCO}  [+] 42ENV | 42 environment configuration script."
echo ""
echo -e "${COLOR_BLANCO}  [+] Andrés Lorente - andloren in 42Málaga."
echo -e "${COLOR_BLANCO}  [+] https://github.com/4ndymcfly${COLOR_RESET}"
echo ""
sleep 2
}

clear
banner

print_info() {
    echo -ne "${COLOR_TURQUESA}[+] $1 ${COLOR_RESET}"
}

print_installed() {
    echo -e "${COLOR_TURQUESA}[i] $1${COLOR_RESET}"
}

print_warning() {
    echo -e "${COLOR_ROJO}[!] $1${COLOR_RESET}"
}

print_ok() {
    echo -e "${COLOR_VERDE}OK${COLOR_RESET}"
}

sudo -v
while true; do sudo -n true; sleep 60; sudo -v; done 2>/dev/null &

HEADER_LUA_FILE="$HOME/.config/nvim/lua/config/lazy.lua"

if [ ! -f "$HEADER_LUA_FILE" ]; then
    echo -ne "${COLOR_TURQUESA}[+] Escribe tu usuario de la intra de 42: ${COLOR_RESET}"
    read USER
    MAIL="${USER}@student.42malaga.com"
else
    print_installed "El usuario de la intra ya está configurado."
fi

check_and_install() {
    if ! command -v $1 &> /dev/null
    then
        print_info "$1 no está instalado. Instalando..."
        sudo apt-get install -y $2 > /dev/null 2>&1
        sleep 2
        print_ok
    else
        print_installed "$1 ya está instalado."
    fi
}

# Actualizar e instalar programas y dependencias generales
print_info "Actualizando sistema..."
sudo apt-get update > /dev/null 2>&1
sudo apt-get upgrade -y > /dev/null 2>&1
sudo apt-get install -y software-properties-common build-essential curl wget unzip > /dev/null 2>&1
print_ok

check_and_install "git" "git"
check_and_install "python3" "python3"
check_and_install "pip3" "python3-pip"
check_and_install "gcc" "gcc"
check_and_install "make" "make"
check_and_install "zsh" "zsh"
check_and_install "rg" "ripgrep"
check_and_install "fdfind" "fd-find"
check_and_install "luarocks" "luarocks"
check_and_install "xclip" "xclip"

#Instalaciones opcionales
#check_and_install "pipx" "pipx"
#check_and_install "btop" "btop"
#check_and_install "node" "nodejs"
#check_and_install "npm" "npm"
#check_and_install "yarn" "yarn"

sleep 3

if ! pip3 show norminette &> /dev/null
then
    print_info "norminette no está instalada. Instalando..."
    pip3 install norminette > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "norminette ya está instalada."
fi

if ! pip3 show c-formatter-42 &> /dev/null
then
    print_info "c-formatter-42 no está instalado. Instalando..."
    pip3 install c-formatter-42 > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "c-formatter-42 ya está instalado."
fi

if ! pip3 show neovim &> /dev/null
then
    print_info "Librería neovim para python no está instalada. Instalando..."
    pip3 install neovim > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "Librería neovim ya está instalada."
fi

FONT_DIR="/usr/local/share/fonts"
FONT_NAME="Hack"
if ! fc-list | grep -q "$FONT_NAME"; then
    print_info "Instalando Hack Nerd Font..."
    wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Hack.zip -O /tmp/Hack.zip > /dev/null 2>&1
    sudo unzip -q /tmp/Hack.zip -d $FONT_DIR > /dev/null 2>&1
    sleep 2
    sudo fc-cache -f -v > /dev/null 2>&1
    sleep 2
    print_ok
else
    print_installed "Hack Nerd Font ya está instalada."
fi

if [ "$SHELL" != "$(which zsh)" ]; then
    print_info "Configurando zsh como shell por defecto..."
    sudo chsh -s $(which zsh) $(whoami)
    sleep 2
    print_ok
fi

ZSHRC_FILE="$HOME/.zshrc"
if [ ! -f "$ZSHRC_FILE" ]; then
    if [ -f "./files/.zshrc" ]; then
        print_info "Copiando .zshrc..."
        cp "./files/.zshrc" "$ZSHRC_FILE"
        sleep 2
        print_ok
    else
        print_warning "No se encontró el archivo .zshrc en la ruta de origen."
    fi
else
    if grep -q "# ALIAS 42env" "$ZSHRC_FILE"; then
        print_installed "Los alias ya están presentes en '.zshrc'."
    else
        print_info "Añadiendo alias a .zshrc..."
        echo -e "\n# ALIAS 42env\nalias 42gcc='gcc -Wall -Werror -Wextra'\nalias 42nt='norminette -R CheckForbiddenSourceHeader'\nalias ll='/usr/bin/lsd -lha --group-dirs=first'\nalias llo='/usr/bin/lsd -lha --group-dirs=first --permission octal'\nalias ls='/usr/bin/lsd --group-dirs=first'\nalias vi='/snap/bin/nvim'\nalias picture='kitty +kitten icat'" >> "$ZSHRC_FILE"
        sleep 2
        print_ok
    fi
fi

KITTY_CONF_DIR="$HOME/.config/kitty"
KITTY_CONF_SRC="./files/kitty.conf"
KITTY_CONF_DEST="$KITTY_CONF_DIR/kitty.conf"
KITTY_CONF_BAK="$KITTY_CONF_DEST.bak"

if command -v kitty > /dev/null 2>&1; then
    print_installed "Kitty ya está instalado."

    # Solo renombrar la configuración si aún no existe una copia de seguridad
    if [ -f "$KITTY_CONF_DEST" ] && [ ! -f "$KITTY_CONF_BAK" ]; then
        mv "$KITTY_CONF_DEST" "$KITTY_CONF_BAK"
    elif [ -f "$KITTY_CONF_BAK" ]; then
        print_installed "Ya existe una copia de seguridad de 'kitty.conf'."
    fi

else
    print_info "Instalando Kitty..."
    curl -sL https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin > /dev/null 2>&1

    mkdir -p ~/.local/bin
    ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/kitty
    ln -sf ~/.local/kitty.app/bin/kitten ~/.local/bin/kitten

    export PATH="$HOME/.local/bin:$PATH"

    mkdir -p ~/.local/share/applications
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
    cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/

    sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
    sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty.desktop

    echo 'kitty.desktop' > ~/.config/xdg-terminals.list
    sleep 2
    killall -q kitty
    print_ok
fi

mkdir -p "$KITTY_CONF_DIR"
if [ -f "$KITTY_CONF_SRC" ]; then
    cp "$KITTY_CONF_SRC" "$KITTY_CONF_DEST"
else
    print_warning "No se encontró el archivo kitty.conf en la ruta de origen."
fi

if command -v nvim > /dev/null 2>&1; then
    print_installed "Neovim ya está instalado."
else
    print_info "Instalando Neovim..."
    sudo snap install --classic nvim > /dev/null 2>&1
    sleep 2
    print_ok
fi

if [ -f "$HOME/.config/nvim/lua/config/lazy.lua" ]; then
    print_installed "LazyVim ya está configurado."
else
    print_info "Instalando y configurando LazyVim + plugins..."
    # Backup si existen los archivos actuales de Neovim
    mv ~/.config/nvim{,.bak} > /dev/null 2>&1
    mv ~/.local/share/nvim{,.bak} > /dev/null 2>&1
    mv ~/.local/state/nvim{,.bak} > /dev/null 2>&1
    mv ~/.cache/nvim{,.bak} > /dev/null 2>&1
    sleep 2

    git clone https://github.com/LazyVim/starter ~/.config/nvim > /dev/null 2>&1
    rm -rf ~/.config/nvim/.git > /dev/null 2>&1
    sleep 1
    
    LAZY_LUA_SRC="./files/lazy.lua"
    LAZY_LUA_DEST="$HOME/.config/nvim/lua/config/lazy.lua"

    if [ -f "$LAZY_LUA_SRC" ]; then
        cp "$LAZY_LUA_SRC" "$LAZY_LUA_DEST"
        sed -i "s/USERHEADER/$USER/g" "$LAZY_LUA_DEST"
        sed -i "s/MAILHEADER/$MAIL/g" "$LAZY_LUA_DEST"
    else
        print_warning "No se encontró el archivo lazy.lua en la ruta de origen."
    fi

    KEYMAPS_LUA_SRC="./files/keymaps.lua"
    KEYMAPS_LUA_DEST="$HOME/.config/nvim/lua/config/keymaps.lua"

    if [ -f "$KEYMAPS_LUA_SRC" ]; then
        cp "$KEYMAPS_LUA_SRC" "$KEYMAPS_LUA_DEST"
        sleep 1
    else
        print_warning "No se encontró el archivo keymaps.lua en la ruta de origen."
    fi

    FORMATTER_42_SRC="./files/c_formatter_42.vim"
    FORMATTER_42_DEST="$HOME/.config/nvim/lua/plugins/c_formatter_42.vim"

    if [ -f "$FORMATTER_42_SRC" ]; then
        cp "$FORMATTER_42_SRC" "$FORMATTER_42_DEST"
        sleep 1
    else
        print_warning "No se encontró el archivo c_formatter_42.vim en la ruta de origen."
    fi
    print_ok
fi

CURRENT_FAVORITES=$(gsettings get org.gnome.shell favorite-apps)
if [[ $CURRENT_FAVORITES == *"kitty.desktop"* ]]; then
    print_installed "Kitty ya está en la barra de favoritos. Omitiendo."
else
    print_info "Añadiendo Kitty a la barra de favoritos..."
    NEW_FAVORITES=$(echo $CURRENT_FAVORITES | sed "s/]/, 'kitty.desktop']/")
    gsettings set org.gnome.shell favorite-apps "$NEW_FAVORITES"
    sleep 1
    print_ok
fi

if command -v lazygit > /dev/null 2>&1; then
    print_installed "LazyGit ya está instalado."
else
    print_info "Instalando LazyGit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" > /dev/null 2>&1
    tar xf lazygit.tar.gz lazygit > /dev/null 2>&1
    sudo install lazygit /usr/local/bin > /dev/null 2>&1
    rm lazygit.tar.gz > /dev/null 2>&1
    sleep 1
    print_ok
fi

if command -v lsd > /dev/null 2>&1; then
    print_installed "LSD ya está instalado."
else
    print_info "Instalando LSD..."
    LSD_URL="https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-musl_1.1.2_amd64.deb"
    LSD_DEB="lsd-musl_1.1.2_amd64.deb"

    curl -Lo $LSD_DEB $LSD_URL > /dev/null 2>&1
    sudo dpkg -i $LSD_DEB > /dev/null 2>&1
    rm $LSD_DEB > /dev/null 2>&1
    sleep 1
    print_ok
fi

echo ""

print_installed "Todos los programas necesarios han sido instalados."
rm ./lazygit > /dev/null 2>&1

echo ""
echo ""

sleep 1
print_installed "[ATENCION] El sistema se reiniciará para aplicar todos los cambios. Después del reinicio, abre Kitty y desde ahí ejecuta 'nvim' para que la configuración de Neovim se complete."

echo ""
echo ""

sleep 1
read -p "Pulse intro para reiniciar el sistema o 'Ctrl+C' para salir..."
sudo reboot
