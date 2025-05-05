# Dotfiles

## Installation:

```bash
cd /tmp

git clone https://github.com/olatejulian/dotfiles.git

cp -ir ./dotfiles $HOME/.config/user.d

rm -rf /tmp/dotfiles

ln -s $HOME/.config/user.d/dotfiles/.zshrc $HOME/.zshrc
```