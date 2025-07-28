# user local binaries
LOCAL_BIN=$HOME/.local/bin

if [[ ":$PATH:" != *":$LOCAL_BIN:"* && -d "$LOCAL_BIN" ]]; then
    export PATH="$LOCAL_BIN:$PATH"

fi
