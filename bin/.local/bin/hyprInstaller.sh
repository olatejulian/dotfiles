#! /usr/bin/env bash

set -e

# install hyprland and related packages
packages=(
    # window manager
    hyprland

    # hypr ecosystem
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
    hyprpolkitagent
    hyprshot
    hyprsysteminfo
    hyprutils
    xdg-desktop-portal-hyprland

    # other applications
    rofi
    swaync
    waybar
)


yay -S "${packages[@]}"
