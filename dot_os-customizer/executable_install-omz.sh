#!/usr/bin/env bash

set -euo pipefail

# Temporarily remove config folder placed there by chezmoi; we will put it back after installation
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh)"
chezmoi apply
