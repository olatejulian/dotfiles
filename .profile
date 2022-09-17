. /opt/asdf-vm/asdf.sh

# USER ALIAS

alias g="git"
alias gis="clear; git status"
alias cp="cp -i"                          # confirm before overwriting something
alias df="df -h"                          # human-readable sizes
alias d="docker"
alias free="free -m"                      # show sizes in MB
alias dc="docker-compose"
alias i="yay -S --noconfirm"
alias update-os="yay -Syyuu --noconfirm"
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias dot-ignore="echo "$(dot status --porcelain | grep '^??' | cut -c4-)" >> .gitignore"

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

mk () {
    if [ -d $1 ] ; then
        mkdir $1
    else
        touch $1
    fi
}

# ENVIRONMENT VARIABLES

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Java environment variables
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/"

# Go environment variables
export PATH=$(go env GOPATH)/bin:$PATH

# Python environment variables
export PYTHONPATH=$HOME/Projects:$HOME/Modules/python:$SPARK_HOME/python:$PYTHONPATH

# Spark environment variables
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin


#HANDLE WITH SSH
if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
  #  eval `cat $HOME/.ssh/ssh-agent`
fi

