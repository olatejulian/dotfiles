# user local binaries
LOCAL_BIN=$HOME/.local/bin

if [[ ":$PATH:" != *":$LOCAL_BIN:"* && -d "$LOCAL_BIN" ]]; then
    export PATH="$LOCAL_BIN:$PATH"

fi

# user local secrets
SECRETS_PATH="$HOME/.secrets"

if [ -f $SECRETS_PATH ]; then
    source $SECRETS_PATH

fi
