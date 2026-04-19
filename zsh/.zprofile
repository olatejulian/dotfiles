# ====================================<MY Z SHELL PROFILE SETUP>====================================
# ========================================<ASDF SETTINGS>===========================================
if command -v asdf >/dev/null 2>&1; then
    export ASDF_DATA_DIR="$HOME/.asdf"

    typeset -U path PATH
    path=(
        "$ASDF_DATA_DIR/shims"
        "$ASDF_DATA_DIR/bin"
        $path
    )

    # Java plugin helper
    if [[ -f "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh" ]]; then
        source "$ASDF_DATA_DIR/plugins/java/set-java-home.zsh"
    fi
fi
# ==================================================================================================

# ==========================================<FUNCTIONS>=============================================
# Extract archives
ex() {
    local file="$1"

    if (( $# != 1 )); then
        print "usage: ex <archive>"
        return 1
    fi

    if [[ ! -f "$file" ]]; then
        print "'$file' is not a valid file"
        return 1
    fi

    case "$file" in
        *.tar.bz2|*.tbz2) tar xjf -- "$file" ;;
        *.tar.gz|*.tgz)   tar xzf -- "$file" ;;
        *.tar.xz|*.txz)   tar xJf -- "$file" ;;
        *.tar.zst)        tar --zstd -xf "$file" ;;
        *.tar)            tar xf -- "$file" ;;
        *.bz2)            bunzip2 -- "$file" ;;
        *.gz)             gunzip -- "$file" ;;
        *.xz)             unxz -- "$file" ;;
        *.zip)            unzip -- "$file" ;;
        *.7z)             7z x -- "$file" ;;
        *.rar)            unrar x -- "$file" ;;
        *.zst)            unzstd -- "$file" ;;
        *.Z)              uncompress -- "$file" ;;
        *)
            print "'$file' cannot be extracted via ex()"
            return 1
        ;;
    esac
}
# ==================================================================================================

# ==========================================<PROCESSES>=============================================
# ssh agent
# Ensure ssh-agent is running and environment variables are loaded
export SSH_ENV="$HOME/.ssh/ssh-agent.env"
start_ssh_agent() {
    ssh-agent -s > "$SSH_ENV"
    chmod 600 "$SSH_ENV"
    source "$SSH_ENV" >/dev/null
}
load_ssh_agent() {
    [[ -f "$SSH_ENV" ]] || return 1
    source "$SSH_ENV" >/dev/null
    [[ -n "$SSH_AUTH_SOCK" && -S "$SSH_AUTH_SOCK" ]] || return 1
    [[ -n "$SSH_AGENT_PID" ]] || return 1
    ps -p "$SSH_AGENT_PID" -o comm= 2>/dev/null | grep -qx ssh-agent
}
if ! load_ssh_agent; then
    start_ssh_agent
fi
# ==================================================================================================

# ==========================================<APPLICATIONS>==========================================
# Quantum Espresso
# available versions:
#   - 7.2 (CFLAGS="-fPIC" FFLAGS="-fPIC" MPIF90=mpif90)
#   - 7.3.1
#   - 7.5 (CFLAGS="-fPIC" FFLAGS="-fPIC" MPIF90=mpif90)

export qedir="/opt/quantum-espresso/7.2/software"
# ==================================================================================================
# ==================================================================================================
