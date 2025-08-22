#!usr/bin/bash

set_theme() {
    local theme_name="$1"

    local theme="$HOME/.themes/$theme_name"

    if [[ -d "$theme" ]]; then
        local resources=(assets gtk-2.0 gtk-3.0 gtk-4.0)

        for resource in "${resources[@]}"; do
            local source="$theme/$resource"

            local destination="$XDG_CONFIG_HOME/$resource"

            if [[ -d "$destination" ]]; then
                rm -dfr "$destination"
            fi

            if [[ -d $source ]]; then
                ln -fs $source $destination
            fi
        done

        gsettings set org.gnome.desktop.interface gtk-theme "$theme_name"

        gsettings set org.gnome.desktop.wm.preferences theme "$theme_name"
    else
        echo "❌ Theme not found: $theme"
    fi
}

set_icon_theme() {
    local theme_name="$1"

    local theme="$HOME/.icons/$theme_name"

    if [[ -d "$theme" ]]; then
        gsettings set org.gnome.desktop.interface icon-theme "$theme_name"
    else
        echo "❌ Icon theme not found: $theme"
    fi
}

set_cursor_theme() {
    local theme_name="$1"

    local theme="$HOME/.icons/$theme_name"

    if [[ -d "$theme" ]]; then
        gsettings set org.gnome.desktop.interface cursor-theme "$theme_name"
    else
        echo "❌ Cursor theme not found: $theme"
    fi
}
