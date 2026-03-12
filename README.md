# dotfiles

My personal dotfiles, powered by https://chezmoi.io

## New system setup

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init linuswillner
chezmoi apply
```

### 🍎 macOS

```bash
~/.os-customizer/install-omz.sh
~/.maintenance/apply-brew-sbom.sh
```

### 🐧 Linux

```bash
~/.os-customizer/install-zsh.sh
~/.os-customizer/install-omz.sh
~/.maintenance/apply-brew-sbom.sh
~/.os-customizer/install-danklinux.sh
```
