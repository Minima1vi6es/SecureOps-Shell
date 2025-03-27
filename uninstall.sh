#!/bin/bash

# SecureOps Shell Uninstaller
# Author: Mark Gustafson
# Description: Uninstalls Kitty, resets terminal emulator, and removes SecureOps Zsh config.

echo "⚠️  This will uninstall the SecureOps Shell configuration."
read -p "Are you sure you want to continue? (y/n): " confirm

if [[ "$confirm" != "y" ]]; then
  echo "❌ Uninstall cancelled."
  exit 0
fi

# Remove kitty from terminal alternatives
echo "🧹 Cleaning up terminal emulator settings..."
sudo update-alternatives --remove x-terminal-emulator /usr/bin/kitty 2>/dev/null || true

# Optionally remove kitty itself
read -p "Do you also want to uninstall kitty? (y/n): " remove_kitty
if [[ "$remove_kitty" == "y" ]]; then
  echo "🗑️  Removing kitty..."
  sudo apt remove -y kitty
else
  echo "✅ Keeping kitty installed."
fi

# Remove config files
read -p "Remove ~/.zshrc and ~/.p10k.zsh configs? (y/n): " remove_configs
if [[ "$remove_configs" == "y" ]]; then
  echo "🧨 Removing SecureOps Zsh configs..."
  rm -f ~/.zshrc ~/.p10k.zsh
else
  echo "📁 Keeping config files."
fi

echo ""
echo "✅ SecureOps Shell has been uninstalled."
echo "💡 You may want to restart your terminal or reconfigure your terminal emulator manually if needed."
