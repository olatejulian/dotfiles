#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export VISUAL="kate"

export MANPATH="/usr/local/man:$MANPATH"

profile_path = $HOME/.profile

if [ -f $profile_path ]; then
    source $profile_path
fi
