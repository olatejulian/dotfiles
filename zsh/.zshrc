# =================================<MY Z SHELL RUN COMMANDS SETUP>==================================
# ===========================================<ALIASES>==============================================
alias arch-up="sudo pacman -Suuyy --noconfirm; yay -Suuyy --noconfirm"
alias cd="z"
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
alias vi="nvim"
alias vm="vboxmanage"
# ==================================================================================================

# ============================================<OPTIONS>=============================================
# HISTORY
HISTDUP=erase
HISTFILE=$HOME/.zsh_history
HISTSIZE=200000
SAVEHIST=100000

# APPEND_HISTORY <D>
# If this is set, zsh sessions will append their history list to the history file, rather than replace it. Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file, in the order that they exit. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt APPEND_HISTORY

# BANG_HIST (+K) <C> <Z>
# Perform textual history expansion, csh-style, treating the character ‘!’ specially.

# EXTENDED_HISTORY <C>
# Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file. The format of this prefixed data is:

# ‘: <beginning time>:<elapsed seconds>;<command>’.
setopt EXTENDED_HISTORY

# HIST_ALLOW_CLOBBER
# Add ‘|’ to output redirections in the history. This allows history references to clobber files even when CLOBBER is unset.
setopt HIST_ALLOW_CLOBBER

# HIST_BEEP <D>
# Beep in ZLE when a widget attempts to access a history entry which isn’t there.

# HIST_EXPIRE_DUPS_FIRST
# If the internal history needs to be trimmed to add the current command line, setting this option will cause the oldest history event that has a duplicate to be lost before losing a unique event from the list. You should be sure to set the value of HISTSIZE to a larger number than SAVEHIST in order to give you some room for the duplicated events, otherwise this option will behave just like HIST_IGNORE_ALL_DUPS once the history fills up with unique events.
setopt HIST_EXPIRE_DUPS_FIRST

# HIST_FCNTL_LOCK
# When writing out the history file, by default zsh uses ad-hoc file locking to avoid known problems with locking on some operating systems. With this option locking is done by means of the system’s fcntl call, where this method is available. On recent operating systems this may provide better performance, in particular avoiding history corruption when files are stored on NFS.

# HIST_FIND_NO_DUPS
# When searching for history entries in the line editor, do not display duplicates of a line previously found, even if the duplicates are not contiguous.

# HIST_IGNORE_ALL_DUPS
# If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_ALL_DUPS

# HIST_IGNORE_DUPS (-h)
# Do not enter command lines into the history list if they are duplicates of the previous event.

# HIST_IGNORE_SPACE (-g)
# Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space. Only normal aliases (not global or suffix aliases) have this behaviour. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line. If you want to make it vanish right away without entering another command, type a space and press return.

# HIST_LEX_WORDS
# By default, shell history that is read in from files is split into words on all white space. This means that arguments with quoted whitespace are not correctly handled, with the consequence that references to words in history lines that have been read from a file may be inaccurate. When this option is set, words read in from a history file are divided up in a similar fashion to normal shell command line handling. Although this produces more accurately delimited words, if the size of the history file is large this can be slow. Trial and error is necessary to decide.

# HIST_NO_FUNCTIONS
# Remove function definitions from the history list. Note that the function lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the definition.

# HIST_NO_STORE
# Remove the history (fc -l) command from the history list when invoked. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line.

# HIST_REDUCE_BLANKS
# Remove superfluous blanks from each command line being added to the history list.

# HIST_SAVE_BY_COPY <D>
# When the history file is re-written, we normally write out a copy of the file named $HISTFILE.new and then rename it over the old one. However, if this option is unset, we instead truncate the old history file and write out the new version in-place. If one of the history-appending options is enabled, this option only has an effect when the enlarged history file needs to be re-written to trim it down to size. Disable this only if you have special needs, as doing so makes it possible to lose history entries if zsh gets interrupted during the save.

# When writing out a copy of the history file, zsh preserves the old file’s permissions and group information, but will refuse to write out a new file if it would change the history file’s owner.

# HIST_SAVE_NO_DUPS
# When writing out the history file, older commands that duplicate newer ones are omitted.

# HIST_VERIFY
# Whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer.

# INC_APPEND_HISTORY
# This option works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt INC_APPEND_HISTORY

# INC_APPEND_HISTORY_TIME
# This option is a variant of INC_APPEND_HISTORY in which, where possible, the history entry is written out to the file after the command is finished, so that the time taken by the command is recorded correctly in the history file in EXTENDED_HISTORY format. This means that the history entry will not be available immediately from other instances of the shell that are using the same history file.

# This option is only useful if INC_APPEND_HISTORY and SHARE_HISTORY are turned off. The three options should be considered mutually exclusive.

# SHARE_HISTORY <K>
# This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY, which should be turned off if this option is in effect). The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to find the spot where we left off reading the file after it gets re-written).
setopt SHARE_HISTORY

# By default, history movement commands visit the imported lines as well as the local lines, but you can toggle this on and off with the set-local-history zle binding. It is also possible to create a zle widget that will make some commands ignore imported commands, and some include them.

# If you find that you want more control over when commands get imported, you may wish to turn SHARE_HISTORY off, INC_APPEND_HISTORY or INC_APPEND_HISTORY_TIME (see above) on, and then manually import commands whenever you need them using ‘fc -RI’.
# ==================================================================================================

# =========================================<Z SHELL STYLES>=========================================
# COMPLETION
zstyle ':completion:*' cache-path ~/.cache/zsh
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
# ==================================================================================================

# ========================================<OH MY ZSH SETUP>=========================================
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# This script checks if Oh My Zsh is installed, and if not, installs it.
[[ ! -d "$ZSH" ]] && sh -c \
"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    asdf
    git
    zsh-autosuggestions
    zsh-completions
    zsh-history-substring-search
    zsh-syntax-highlighting
)

# load zsh-completions plugin before oh-my-zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

OHMYZSH_SH=$ZSH/oh-my-zsh.sh

[[ -f "$OHMYZSH_SH" ]] && source $OHMYZSH_SH
# ==================================================================================================

# ===========================================<TOOLCHAINS>===========================================
# Fuzzy finder
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

# Zoxide
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# Oh my posh
command -v oh-my-posh >/dev/null && eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-poshtheme.omp.toml)"
# ==================================================================================================

# =========================================<KEYBINDINGS>============================================
# Ability to use ctrl + backspace to backward a word
bindkey '^H' backward-kill-word

# History substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# ==================================================================================================
# ==================================================================================================

