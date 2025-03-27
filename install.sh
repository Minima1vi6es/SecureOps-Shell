#!/bin/bash

# SecureOps Shell Installer
# Author: Mark Gustafson
# Description: Installs Kitty, configures it as the default terminal, and copies Zsh configs.

set -e  # Exit on error

echo "🔧 Installing SecureOps Shell..."

# Check if kitty is already installed
if ! command -v kitty &> /dev/null; then
  echo "📦 Installing kitty..."
  sudo apt update && sudo apt install -y kitty
else
  echo "✅ Kitty is already installed."
fi

# Set kitty as the default terminal emulator
echo "⚙️ Setting kitty as default terminal emulator..."
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 50
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

# Copy .zshrc and .p10k.zsh from script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📂 Copying Zsh configuration files..."
cp "$SCRIPT_DIR/.zshrc" ~/.zshrc
cp "$SCRIPT_DIR/.p10k.zsh" ~/.p10k.zsh

echo ""
echo "🎉 SecureOps Shell installed successfully!"
echo "🚀 Restart your terminal or run: source ~/.zshrc"
