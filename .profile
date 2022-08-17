# ENVIRONMENT VARIABLES
export PATH=$HOME/.local/bin:$PATH

. /opt/asdf-vm/asdf.sh

# ALIAS

alias i="yay -Syu --noconfirm"
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
