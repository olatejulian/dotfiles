set_symlink() {
    local origin_dir="$1"
    local destination_dir="$2"
    local file_name="$3"

    local source="$origin_dir/$file_name"
    local target="$destination_dir/$file_name"

    # Create destination directory if it doesn't exist
    mkdir -p "$destination_dir"

    # If target already exists or is a symlink, back it up
    if [[ -e "$target" || -L "$target" ]]; then
        echo "⚠️  $target exists, backing up to $target.bak"
        mv -f "$target" "$target.bak"
    fi

    ln -s "$source" "$target"
    echo "✅ Symlinked $target -> $source"
}

USER_DIR="$HOME/.config/user"

if [[ -d "$USER_DIR" ]]; then
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
else
    echo "❌ USER_DIR not found: $USER_DIR"
fi

