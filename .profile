# ENVIRONMENT VARIABLES
# asdf
ASDF_SETTINGS=$HOME/.asdf/asdf.sh

if asdf &> /dev/null && [ -f $ASDF_SETTINGS ]; then
    source $ASDF_SETTINGS
fi

# golang
if go &> /dev/null; then
   export GOPATH=$(go env GOPATH)/bin:$GOPATH

fi

# java
if java &> /dev/null && asdf &> /dev/null; then
    if ["$SHELL" == "/usr/bin/zsh"]; then
        source $HOME/.asdf/plugins/java/set-java-home.zsh
    
    else
        source $HOME/.asdf/plugins/java/set-java-home.bash
    
    fi
fi

# node
if pnpm &> /dev/null; then
    export PNPM_HOME=$HOME/.local/share/pnpm

    export PATH=$PATH:$PNPM_HOME

fi

# python
if python --version &> /dev/null; then
    if pyspark --version &> /dev/null; then
        export SPARK_HOME=/opt/spark

        export PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python

        export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin
    fi

fi

# rust
if cargo &> /dev/null && rustc &> /dev/null; then
    export RUST_WITHOUT=rust-docs
    export PATH=$PATH:$HOME/.cargo/bin
fi

# secrets
SECRETS_PATH=$HOME/.secrets

if [ -f $SECRETS_PATH ]; then
    source $SECRETS_PATH
fi

# sonarqube
export SONAR_SCANNER_HOME=/opt/sonar-scanner

export PATH=$PATH:$SONAR_SCANNER_HOME/bin


# PATH
# user local binaries
export PATH=$PATH:$HOME/.local/bin:$HOME/.local/sbin

# JetBrains Toolbox scripts path
export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts


# PROCESSES
# set ssh agent process
if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"

   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent

   fi
  
  eval `cat $HOME/.ssh/ssh-agent`

fi


# ALIASES
alias arch-up="sudo pacman -Suuyy --noconfirm; yay -Suuyy --noconfirm"                      # update packages for arch linux based os 
alias cp="cp -i"                                                                            # confirm before overwriting something
alias d="docker"
alias dc="docker compose"
alias deb-up="sudo apt upgrade -y; sudo apt update -y"                                      # update packages for debian linux based os
alias df="df -h"                                                                            # human-readable sizes
alias di="sudo apt install -y"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"                                # handle dotfiles git settings
alias dot-ignore="echo \"$(dot status --porcelain | grep '^??' | cut -c4-)\" >> .gitignore" # ignore all untracked files
alias free="free -m"                                                                        # show sizes in MB
alias g="git"
alias gis="clear; git status"
alias i="yay -S --noconfirm"
alias k="kubectl"
alias mk="minikube kubectl"
alias pc="pre-commit"
alias src="source $HOME/.zshrc"
alias src-bash="source $HOME/.bashrc"
alias vm="vboxmanage"


# FUNCTIONS
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
