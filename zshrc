export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="avit"

plugins=(git zsh-nvm)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zsh/aliases

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi
