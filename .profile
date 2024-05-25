# ENVIRONMENT VARIABLES
# android
if [ -d /opt/android-sdk ]; then
    export ANDROID_SDK_ROOT=/opt/android-sdk

    export ANDROID_HOME=$ANDROID_SDK_ROOT

    case ":$PATH:" in
    *":$ANDROID_SDK_ROOT:"*) ;;

    *) export PATH=$PATH:$ANDROID_SDK_ROOT ;;

    esac

    case ":$PATH:" in
    *":$ANDROID_SDK_ROOT/emulator:"*) ;;

    *) export PATH=$PATH:$ANDROID_SDK_ROOT/emulator ;;

    esac

    case ":$PATH:" in
    *":$ANDROID_SDK_ROOT/platforms"*) ;;

    *) export PATH=$PATH:$ANDROID_SDK_ROOT/platforms ;;

    esac

    case ":$PATH:" in
    *":$ANDROID_SDK_ROOT/platform-tools:"*) ;;

    *) export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools ;;

    esac

    case ":$PATH:" in
    *":$ANDROID_SDK_ROOT/tools:"*) ;;

    *) export PATH=$PATH:$ANDROID_SDK_ROOT/tools ;;

    esac

    case ":$PATH:" in
    *":$ANDROID_SDK_ROOT/tools/bin:"*) ;;

    *) export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin ;;

    esac

fi

# asdf
ASDF_SETTINGS=$HOME/.asdf/asdf.sh

if asdf &>/dev/null && [ -f $ASDF_SETTINGS ]; then
    source $ASDF_SETTINGS

fi

# golang
if go &>/dev/null; then
    export GOPATH=$(go env GOPATH)/bin:$GOPATH

fi

# java
if java &>/dev/null && asdf &>/dev/null; then
    if ["$SHELL" == "/usr/bin/zsh"]; then
        source $HOME/.asdf/plugins/java/set-java-home.zsh

    else
        source $HOME/.asdf/plugins/java/set-java-home.bash

    fi

fi

# node.js
export PNPM_HOME=$HOME/.local/share/pnpm

case ":$PATH:" in
*":$PNPM_HOME:"*) ;;

*) export PATH="$PNPM_HOME:$PATH" ;;

esac

# python
if python --version &>/dev/null; then
    if pyspark --version &>/dev/null; then
        export SPARK_HOME=/opt/spark

        export PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python

        SPARK_BIN=$SPARK_HOME/bin

        case ":$PATH:" in
        *":$SPARK_BIN:"*) ;;

        *) export PATH=$PATH:SPARK_BIN ;;

        esac

    fi

fi

# rust
if cargo &>/dev/null && rustc &>/dev/null; then
    export RUST_WITHOUT=rust-docs

    CARGO_BIN=$HOME/.cargo/bin

    case ":$PATH:" in
    *":$CARGO_BIN:"*) ;;

    *) export PATH=$PATH:$CARGO_BIN ;;

    esac

fi

# secrets
SECRETS_PATH=$HOME/.secrets

if [ -f $SECRETS_PATH ]; then
    source $SECRETS_PATH

fi

# sonarqube
SONAR_SCANNER_HOME=/opt/sonar-scanner

if [ -d $SONAR_SCANNER_HOME ]; then
    export SONAR_SCANNER_HOME

    SONAR_SCANNER_HOME_BIN=$SONAR_SCANNER_HOME/bin

    case ":$PATH:" in
    *":$SONAR_SCANNER_HOME_BIN:"*) ;;

    *) export PATH=$PATH:$SONAR_SCANNER_HOME_BIN ;;

    esac

fi

# PATH
# user local binaries
LOCAL_BIN=$HOME/.local/bin

case ":$PATH:" in
*":$LOCAL_BIN:"*) ;;

*) export PATH=$PATH:$LOCAL_BIN ;;

esac

LOCAL_SBIN=$HOME/.local/sbin

case ":$PATH:" in
*":$LOCAL_SBIN:"*) ;;

*) export PATH=$PATH:$LOCAL_SBIN ;;

esac

HOME_BIN=$HOME/bin

case ":$PATH:" in
*":$HOME_BIN:"*) ;;

*) export PATH=$PATH:$HOME_BIN ;;

esac

# JetBrains Toolbox scripts path
TOOLBOX_SCRIPTS=$HOME/.local/share/JetBrains/Toolbox/scripts

case ":$PATH:" in
*":$TOOLBOX_SCRIPTS:"*) ;;

*) export PATH=$PATH:$TOOLBOX_SCRIPTS ;;

esac

# PROCESSES
# set ssh agent process
if [ -z "$SSH_AUTH_SOCK" ]; then
    # Check for a currently running instance of the agent
    RUNNING_AGENT="$(ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]')"

    if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &>$HOME/.ssh/ssh-agent

    fi

    eval $(cat $HOME/.ssh/ssh-agent) &>/dev/null

fi

# ALIASES
alias arch-up="sudo pacman -Suuyy --noconfirm; yay -Suuyy --noconfirm"                      # update packages for arch linux based os
alias cp="cp -i"                                                                            # confirm before overwriting something
alias d="docker"                                                                            #
alias dc="docker compose"                                                                   #
alias deb-up="sudo apt upgrade -y; sudo apt update -y"                                      # update packages for debian linux based os
alias df="df -h"                                                                            # human-readable sizes
alias di="sudo apt install -y"                                                              #
alias dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"                                # handle dotfiles git settings
alias dot-ignore="echo \"$(dot status --porcelain | grep '^??' | cut -c4-)\" >> .gitignore" # ignore all untracked files
alias free="free -m"                                                                        # show sizes in MB
alias g="git"                                                                               #
alias gis="clear; git status"                                                               #
alias i="yay -S --noconfirm"                                                                #
alias k="kubectl"                                                                           #
alias mk="minikube kubectl"                                                                 #
alias pc="pre-commit"                                                                       #
alias r="yay -Rcnssuv"									    #
alias src="source $HOME/.zshrc"                                                             #
alias src-bash="source $HOME/.bashrc"                                                       #
alias vm="vboxmanage"                                                                       #

# FUNCTIONS
# # ex - archive extractor
# # usage: ex <file>
ex() {
    if [ -f $1 ]; then
        case $1 in
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *.gz) gunzip $1 ;;
        *.zip) unzip $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar x $1 ;;
        *.tar) tar xf $1 ;;
        *.tgz) tar xzf $1 ;;
        *.tbz2) tar xjf $1 ;;
        *.tar.gz) tar xzf $1 ;;
        *.tar.bz2) tar xjf $1 ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
