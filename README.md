# Dotfiles

## Installation:

```bash
cd /tmp

git clone https://github.com/olatejulian/dotfiles.git

cp -ir ./dotfiles $HOME/.config

rm -dfr /tmp/dotfiles

ln -s $HOME/.config/dotfiles/src/.zshrc $HOME/.zshrc

cd $HOME

source $HOME/.zshrc
```