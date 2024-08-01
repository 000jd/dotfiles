#!/bin/bash

# Define the dotfiles directory
DOTFILES_DIR="$HOME/Documents/Devlopment/dotfiles"

# Function to create a symbolic link
create_symlink() {
    local src="$1"
    local dest="$2"
    if [ -e "$dest" ]; then
        echo "Backing up existing $dest to $dest.bak"
        mv "$dest" "$dest.bak"
    fi
    ln -sf "$src" "$dest"
    echo "Created symlink: $dest -> $src"
}

# Setup Fish shell configuration
setup_fish() {
    echo "Setting up Fish shell configuration..."
    mkdir -p "$HOME/.config/fish/completions"
    mkdir -p "$HOME/.config/fish/conf.d"
    mkdir -p "$HOME/.config/fish/functions"

    create_symlink "$DOTFILES_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"
    create_symlink "$DOTFILES_DIR/fish/fish_variables" "$HOME/.config/fish/fish_variables"

    # Symlink all files in conf.d
    for file in "$DOTFILES_DIR"/fish/conf.d/*; do
        create_symlink "$file" "$HOME/.config/fish/conf.d/$(basename "$file")"
    done

    # Symlink all files in completions and functions (if they exist)
    for dir in completions functions; do
        if [ -d "$DOTFILES_DIR/fish/$dir" ]; then
            for file in "$DOTFILES_DIR"/fish/"$dir"/*; do
                [ -f "$file" ] && create_symlink "$file" "$HOME/.config/fish/$dir/$(basename "$file")"
            done
        fi
    done
}

# Setup Starship configuration
setup_starship() {
    echo "Setting up Starship configuration..."
    create_symlink "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
    #create_symlink "$DOTFILES_DIR/starship_new.toml" "$HOME/.config/starship_new.toml"
}

# Setup VS Code configuration
setup_vscode() {
    echo "Setting up VS Code configuration..."
    mkdir -p "$HOME/.config/Code/User"
    create_symlink "$DOTFILES_DIR/vscode/settings.json" "$HOME/.config/Code/User/settings.json"

    # Install VS Code extensions
    if command -v code &> /dev/null; then
        echo "Installing VS Code extensions..."
        while read -r extension; do
            code --install-extension "$extension"
        done < "$DOTFILES_DIR/vscode/extensions.txt"
    else
        echo "VS Code not found. Skipping extension installation."
    fi
}

# Main installation process
main() {
    echo "Starting dotfiles installation..."

    # Check if the dotfiles directory exists
    if [ ! -d "$DOTFILES_DIR" ]; then
        echo "Error: Dotfiles directory not found at $DOTFILES_DIR"
        echo "Please make sure the directory exists and try again."
        exit 1
    fi

    setup_fish
    setup_starship
    setup_vscode

    echo "Dotfiles installation complete!"
}

# Run the main installation process
main