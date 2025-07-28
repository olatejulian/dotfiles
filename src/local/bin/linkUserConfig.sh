set_symlink() {
    local origin_dir="$1"
    local destination_dir="$2"
    local file_name="$2"

    ln -s $origin_dir/$file_name $destination_dir/$file_name
}

USER_DIR="$HOME/.config/user"

if [[ -d USER_DIR ]]; then
    set_symlink "$USER_DIR/src" "$HOME" ".gitconfig"

    set_symlink "$USER_DIR/src" "$HOME" ".zshrc"

    # set_symlink "$USER_DIR/src" "$HOME" ".vimrc"

    set_symlink \
        "$USER_DIR/src/config/autostart" \
        "$HOME/.config/autostart" \
        "mountRCloneGoogleDrive.desktop"

    set_symlink \
        "$USER_DIR/src/local/bin" \
        "$HOME/.local/bin" \
        "mountRCloneGoogleDrive.sh"

    set_symlink \
        "$USER_DIR/src/local/bin" \
        "$HOME/.local/bin" \
        "setupDraculaTheme.sh"
fi
