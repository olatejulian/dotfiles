# Dotfiles

Installation: 

``` bash
cd /tmp

git clone https://github.com/olatejulian/dotfiles.git

mv ./dotfiles/ $HOME/.config/user.d

rm -fr ./dotfiles

ln -s $HOME/.config/user.d/src/.zshrc $HOME/.zshrc
```
