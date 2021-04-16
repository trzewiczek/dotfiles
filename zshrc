export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="avit"

plugins=(git zsh-nvm)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zsh/aliases

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

p() {
  VPN_CC=("DE" "CZ" "LT" "SK" "AT" "PL" "DK")

  size=${#VPN_CC[@]}
  index=$(($RANDOM % $size))

  echo "Connecting to ${VPN_CC[$index]}"
  protonvpn-cli c --cc ${VPN_CC[$index]}
}

# Node Version Manager
# source /usr/share/nvm/init-nvm.sh
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
