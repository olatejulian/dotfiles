# USER ALIAS

alias g="git"
alias gis="clear; git status"
alias pc="pre-commit"
alias cp="cp -i"                          # confirm before overwriting something
alias df="df -h"                          # human-readable sizes
alias d="docker"
alias dc="docker-compose"
alias free="free -m"                      # show sizes in MB
alias i="yay -S --noconfirm"
alias di="sudo apt install -y"
alias arch-up="sudo pacman -Suuyy --noconfirm; yay -Suuyy --noconfirm"
alias deb-up="sudo apt upgrade -y; sudo apt update -y"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dot-ignore="echo \"$(dot status --porcelain | grep '^??' | cut -c4-)\" >> .gitignore"
alias k="kubectl"
alias mk="minikube kubectl"
alias vm="vboxmanage"

# USER FUNCTIONS
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.Z)         uncompress $1;;
      *.7z)        7z x       $1;;
      *.gz)        gunzip     $1;;
      *.zip)       unzip      $1;;
      *.bz2)       bunzip2    $1;;
      *.rar)       unrar x    $1;;
      *.tar)       tar xf     $1;;
      *.tgz)       tar xzf    $1;;
      *.tbz2)      tar xjf    $1;;
      *.tar.gz)    tar xzf    $1;;
      *.tar.bz2)   tar xjf    $1;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ASDF SETTINGS
. "$HOME/.asdf/asdf.sh"

# JAVA SETTINGS
. $HOME/.asdf/plugins/java/set-java-home.zsh

# ENVIRONMENT VARIABLES
source $HOME/.secrets

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/.local/sbin:$PATH

# Go environment variables
if go &> /dev/null; then
   export GOPATH=$(go env GOPATH)/bin:$GOPATH
fi

# Python environment variables
export PYTHONPATH=$HOME/packages:$SPARK_HOME/python:$PYTHONPATH

# Spark environment variables
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

# RUST SETTINGS
export RUST_WITHOUT=rust-docs

# HANDLE WITH SSH
if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
  #  eval `cat $HOME/.ssh/ssh-agent`
fi
# SONARQUBE SETTINGS
export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${SONAR_SCANNER_HOME}/bin:${PATH}"

# PNPM SETTINGS
export PNPM_HOME="/home/julian/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Ablity to use ctrl + backspace to backward a word
bindkey '^H' backward-kill-word

