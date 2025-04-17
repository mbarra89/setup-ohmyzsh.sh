#!/bin/bash

# Verificar si zsh, git, curl y wget están instalados
echo "=== Verificando dependencias ==="
command -v zsh >/dev/null 2>&1 || { echo "zsh no está instalado. Instalando..."; sudo apt install -y zsh; }
command -v git >/dev/null 2>&1 || { echo "git no está instalado. Instalando..."; sudo apt install -y git; }
command -v curl >/dev/null 2>&1 || { echo "curl no está instalado. Instalando..."; sudo apt install -y curl; }
command -v wget >/dev/null 2>&1 || { echo "wget no está instalado. Instalando..."; sudo apt install -y wget; }

echo "=== Actualizando e instalando dependencias ==="
sudo apt update

echo "=== Cambiando shell predeterminada a zsh ==="
chsh -s $(which zsh)

echo "=== Instalando Oh My Zsh ==="
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "=== Instalando Powerlevel10k ==="
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "=== Instalando plugins adicionales ==="
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "=== Configurando .zshrc ==="
# Respaldar .zshrc antes de modificar
cp ~/.zshrc ~/.zshrc.backup

# Modificar archivo .zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Reemplazar línea de plugins
sed -i 's/^plugins=.*/plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# Asegurar que syntax highlighting se cargue al final
echo "source \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

echo "=== ¡Listo! Cierra y vuelve a abrir tu terminal Ubuntu ==="
