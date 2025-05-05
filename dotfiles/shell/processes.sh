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
