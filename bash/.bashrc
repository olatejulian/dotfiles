# ===================================<MY BASH RUN COMMANDS SETUP>===================================
# Only load for interactive shells
[[ $- != *i* ]] && return
# ==================================================================================================

# =====================================<ENVIRONMENT VARIABLES>======================================
export EDITOR=vim
export VISUAL=vim
export PAGER=less
export LESS='-R'
export CLICOLOR=1
export LANG=en_US.UTF-8
# ==================================================================================================

# ===========================================<PATH SETUP>===========================================
case ":$PATH:" in
    *":$HOME/bin:"*) ;;
    *) PATH="$HOME/bin:$PATH" ;;
esac

case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) PATH="$HOME/.local/bin:$PATH" ;;
esac

export PATH
# ==================================================================================================

# ============================================<HISTORY>=============================================
HISTSIZE=100000
HISTFILESIZE=200000
HISTCONTROL=ignoredups:erasedups
HISTIGNORE="ls:ll:l:pwd:clear:history:exit"

HISTTIMEFORMAT='%F %T '

shopt -s histappend checkwinsize

PROMPT_COMMAND='history -a; history -n'
# ==================================================================================================

# ===========================================<SHELL BEHAVIOR>=======================================
set -o notify
set -o noclobber
# ==================================================================================================

# ==============================================<ALIASES>===========================================
# General
alias cls='clear'
alias cpu='lscpu'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias listen='ss -lntup'
alias ll='ls -lah --color=auto'
alias mem='free -h'
alias ports='ss -tulpn'

# Systemd
alias bootlog='journalctl -b'
alias failed='systemctl --failed'
alias jctl='journalctl -xe'
alias sc='systemctl'
alias scu='systemctl --user'
alias timers='systemctl list-timers --all'

# Docker
alias d='docker'
alias dc='docker compose'
alias dex='docker exec -it'
alias dimg='docker images'
alias dlog='docker logs -f'
alias dprune='docker system prune'
alias dps='docker ps'

# Kubernetes
alias k='kubectl'
alias kctx='kubectl config current-context'
alias kgn='kubectl get nodes'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
# ==================================================================================================

# =============================================<FUNCTIONS>==========================================
mkcd() {
    mkdir -p "$1" && cd "$1"
}

psgrep() {
    ps aux | grep -i "$1" | grep -v grep
}

extract() {
    case "$1" in
        *.tar.gz) tar -xzf "$1" ;;
        *.tar.xz) tar -xJf "$1" ;;
        *.zip) unzip "$1" ;;
        *) echo "unsupported archive" ;;
    esac
}
# ==================================================================================================

# ==============================================<COLORS>============================================
RESET='\[\e[0m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
CYAN='\[\e[36m\]'
# ==================================================================================================

# ==========================================<PROMPT HELPERS>========================================
git_branch() {
    git symbolic-ref --short HEAD 2>/dev/null
}

kube_context() {
    kubectl config current-context 2>/dev/null
}
# ==================================================================================================

# ===========================================<NATIVE PROMPT>========================================
build_prompt() {
    local EXIT="$?"
    local STATUS=""
    local HOSTCOLOR="$GREEN"
    local GIT=""
    local KUBE=""

    [[ $EXIT -ne 0 ]] && STATUS="${RED}✗ ${EXIT}${RESET} "

    [[ -n "$SSH_CONNECTION" ]] && HOSTCOLOR="$CYAN"
    [[ $EUID -eq 0 ]] && HOSTCOLOR="$RED"

    local BRANCH
    BRANCH="$(git_branch)"
    [[ -n "$BRANCH" ]] && GIT=" ${YELLOW}(${BRANCH})${RESET}"

    local KC
    KC="$(kube_context)"
    [[ -n "$KC" ]] && KUBE=" ${BLUE}[${KC}]${RESET}"

    PS1="${STATUS}${HOSTCOLOR}\u@\h${RESET}:${BLUE}\W${RESET}${GIT}${KUBE}\n\$ "
}

PROMPT_COMMAND="history -a; history -n; build_prompt"
# ==================================================================================================
# ==================================================================================================
