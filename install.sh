#!/bin/bash

echo "🔧 Installing SecureOps Shell..."

# Dynamically determine script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install Kitty if not already installed
if ! command -v kitty &> /dev/null; then
    echo "⬇ Installing kitty terminal..."
    sudo apt update
    sudo apt install -y kitty
else
    echo "✅ Kitty is already installed."
fi

# Set Kitty as the default terminal
echo "⚙ Setting kitty as default terminal emulator..."
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator "$(which kitty)" 50

# Copy Zsh config files
echo "📂 Copying Zsh configuration files..."
cp "$SCRIPT_DIR/files/.zshrc" ~/.zshrc
cp "$SCRIPT_DIR/files/.p10k.zsh" ~/.p10k.zsh

echo "✅ Install complete! Open a new terminal or run 'zsh' to start using SecureOps Shell."
