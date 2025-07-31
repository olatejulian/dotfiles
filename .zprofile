# ====================================<MY SHELL PROFILE SETUP>======================================

# ===========================================<ALIASES>==============================================
alias arch-up="sudo pacman -Suuyy --noconfirm; yay -Suuyy --noconfirm"
alias cp="cp -i"
alias d="docker"
alias dc="docker compose"
alias deb-up="sudo apt upgrade -y; sudo apt update -y"
alias df="df -h"
alias di="sudo apt install -y"
alias free="free -m"
alias g="git"
alias gis="clear; git status"
alias i="yay -S --noconfirm"
alias k="kubectl"
alias mk="minikube kubectl"
alias pc="pre-commit"
alias r="yay -Rcnssuv --noconfirm"
alias src="source $HOME/.zshrc"
alias src-bash="source $HOME/.bashrc"
alias vm="vboxmanage"
# ==================================================================================================

# ==========================================<FUNCTIONS>=============================================
# Extract compressed files
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
# ==================================================================================================

# =========================================<KEYBINDINGS>============================================
# Ability to use ctrl + backspace to backward a word
bindkey '^H' backward-kill-word
# ==================================================================================================

# ============================================<PATHS>===============================================
# user local binaries
LOCAL_BIN=$HOME/.local/bin

[[ ":$PATH:" != *":$LOCAL_BIN:"* && -d "$LOCAL_BIN" ]] && export PATH="$LOCAL_BIN:$PATH"

# user local secrets
SECRETS_PATH="$HOME/.secrets"

[[ -f "$SECRETS_PATH" ]] && source $SECRETS_PATH
# ==================================================================================================

# ==========================================<PROCESSES>=============================================
# ssh agent
# Ensure ssh-agent is running and environment variables are loaded
export SSH_ENV="$HOME/.ssh/ssh-agent.env"

function start_ssh_agent {
    ssh-agent -s > "$SSH_ENV"
    chmod 600 "$SSH_ENV"
}

if [ -z "$SSH_AUTH_SOCK" ]; then
    if [ -f "$SSH_ENV" ]; then
        . "$SSH_ENV" > /dev/null

        # Check if agent is alive
        if ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
            start_ssh_agent
            . "$SSH_ENV" > /dev/null
        fi
    else
        start_ssh_agent
        . "$SSH_ENV" > /dev/null
    fi
fi
# ==================================================================================================

# ========================================<ASDF SETTINGS>===========================================
if asdf --version &>/dev/null; then
    export ASDF_DATA_DIR="$HOME/.asdf"

    # set asdf shims
    if [ -d $ASDF_DATA_DIR ]; then
        export PATH="$ASDF_DATA_DIR/shims:$PATH"

    fi

    # plugins settings
    # set java home
    if [ "$SHELL" = "/usr/bin/zsh" ]; then
        source "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh"

    else
        source "$ASDF_DATA_DIR/plugins/java/set-java-home.bash"

    fi

    # set pnpm home
    export PNPM_HOME="$HOME/.local/share/pnpm"


    if [[ ":$PATH:" != *":$PNPM_HOME:"* && -d "$PNPM_HOME" ]]; then
        export PATH="$PNPM_HOME:$PATH"

    fi

fi
# ==================================================================================================
