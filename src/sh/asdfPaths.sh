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
