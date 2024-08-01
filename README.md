# 🚀 My Personal Dotfiles

Welcome to my personal dotfiles repository! This collection of configuration files and scripts helps me set up my development environment quickly and consistently across different machines. Feel free to explore, use, or draw inspiration from my setup.

## 📁 File Structure

```
📂 Documents/Devlopment/dotfiles/
├── 🐟 fish/
│   ├── completions/
│   ├── conf.d/
│   │   └── catppuccin.fish
│   ├── config.fish
│   ├── fish_variables
│   └── functions/
├── 📄 LICENSE
├── 📘 README.md
├── ⭐ starship_new.toml
├── ⭐ starship.toml
├── 🛠️ install.sh
└── 💻 vscode/
    ├── extensions.txt
    └── settings.json
```

## 🌟 Features

- **Fish Shell**: A smart and user-friendly command line shell
- **Starship**: A minimal, blazing-fast, and infinitely customizable prompt for any shell
- **VS Code**: Settings and extensions for Visual Studio Code
- **Catppuccin**: A soothing pastel theme for Fish shell

## 🚀 Installation

1. Clone this repository to your local machine:
   ```
   git clone https://github.com/yourusername/dotfiles.git ~/Documents/Devlopment/dotfiles
   ```

2. Navigate to the dotfiles directory:
   ```
   cd ~/Documents/Devlopment/dotfiles
   ```

3. Make the installation script executable:
   ```
   chmod +x install.sh
   ```

4. Run the installation script:
   ```
   ./install.sh
   ```

The installation script will:
- Set up Fish shell configuration
- Configure Starship prompt
- Set up VS Code settings and install extensions

## 🛠️ Manual Setup

If you prefer to set things up manually or only want parts of the configuration, here's what you need to do:

### Fish Shell
1. Install Fish shell (if not already installed)
2. Copy or symlink the contents of the `fish` folder to `~/.config/fish/`

### Starship
1. Install Starship (if not already installed)
2. Copy or symlink `starship.toml` and `starship_new.toml` to `~/.config/`

### VS Code
1. Install Visual Studio Code (if not already installed)
2. Copy or symlink `vscode/settings.json` to `~/.config/Code/User/settings.json`
3. Install extensions listed in `vscode/extensions.txt`

## 🎨 Customization

Feel free to explore and modify any of the configuration files to suit your preferences. Here are some key files you might want to customize:

- `fish/config.fish`: Main Fish shell configuration
- `starship.toml`: Starship prompt configuration
- `vscode/settings.json`: VS Code settings

## 🔄 Keeping Up-to-Date

To update your dotfiles on a machine:

1. Pull the latest changes:
   ```
   cd ~/Documents/Devlopment/dotfiles
   git pull
   ```

2. Run the installation script again:
   ```
   ./install.sh
   ```
