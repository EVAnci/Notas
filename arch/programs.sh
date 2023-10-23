#!bin/bash

read -p "¿Que drivers de placa de video quiere instalar? [N(Nvidia)/A(AMD)/I(Intel)]" graphics
read -p "¿Desea instalar LibreOffice? [Y/n]" office

if [ -z "$office" ]; then
  office="Y"
fi

echo "Instalando dependencias..."
sudo pacman -S --needed base-devel git
if [ ! which paru &> /dev/null ]; then
    echo "Instalando paru..."
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
fi

if [[ $graphics =~ ^[Nn]$ ]]; then
    paru -S cuda cuda-tools nvidia nvidia-settings nvidia-utils
elif [[ $graphics =~ ^[Aa]$ ]]; then
    paru -S amdgpu-pro-installer
elif [[ $graphics =~ ^[Ii]$ ]]; then
    sudo pacman -S xorg-xrandr arandr
else
    echo "Saltando la configuracion Grafica..."
fi

if [[ $office =~ ^[Yy]$ ]]; then
    sudo pacman -S libreoffice-fresh libreoffice-fresh-es
else
    echo "Saltando LibreOffice..."
fi

echo "Instalando programas generales y fuentes"
paru -S atril ast-firmware visual-studio-code-bin google-chrome krita noto-fonts obs-studio slack-desktop spotify-launcher curl wget ttf-dejavu ttf-droid ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-hack ttf-inconsolata ttf-lato ttf-liberation ttf-opensans ttf-roboto ttf-ubuntu-font-family unzip unicode which wine wine-mono zsh zsh-completions btop bat eza htop xournalpp zip steam aic94xx-firmware ast-firmware linux-firmware-qlogic linux-firmware-bnx2x linux-firmware-liquidio linux-firmware-mellanox linux-firmware-nfp linux-firmware-qlogic wd719x-firmware upd72020x-fw

echo "Seteando zsh como shell predeterminada..."

chsh -s /bin/zsh

echo "Descargando Ohmyzsh..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Escribiendo alias al shell"
echo "alias ls='exa'" >> ~/.zshrc
echo "alias cat='bat'" >> ~/.zshrc
echo "alias cover='coverage run -m unittest && coverage report -m'" >> ~/.zshrc
echo "alias scrabble='cd $(find ~/ -name "Scrabble" -type d) && source env/bin/activate'" >> ~/.zshrc
echo "alias notas='cd $(find $(find ~/Documentos -name "Computacion" -type d) -name "Notas" -type d)'" >> ~/.zshrc