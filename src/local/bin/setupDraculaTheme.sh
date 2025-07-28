install(){
    echo "installing assets and gtk-4.0 css"

    ln -s $HOME/.themes/Dracula/assets $HOME/.config/assets

    ln -s $HOME/.themes/Dracula/gtk-4.0/gtk.css $HOME/.config/gtk-4.0/gtk.css

    ln -s $HOME/.themes/Dracula/gtk-4.0/gtk-dark.css $HOME/.config/gtk-4.0/gtk-dark.css
}

uninstall() {
    rm -dfr $HOME/.config/assets

    rm -dfr $HOME/.config/gtk-4.0/gtk.css

    rm -drf $HOME/.config/gtk-4.0/gtk-dark.css
}
