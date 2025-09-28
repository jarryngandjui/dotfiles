# Dotfiles Setup

This Makefile provides an idempotent setup for your macOS terminal environment.

## Usage

```bash
# Install everything (recommended for first-time setup)
make all

# Install specific components
make homebrew    # Install Homebrew and packages
make shell       # Setup Zsh, Oh My Zsh, and themes  
make nvim        # Setup Neovim and LSP dependencies
make tmux        # Setup Tmux and TPM
make alacritty   # Setup Alacritty terminal

# Check installation status
make status

# Get help
make help

# Clean up (removes symlinks and configs)
make clean
```

## Features

- **Idempotent**: Safe to run multiple times without side effects
- **Dependency-aware**: Automatically installs required packages
- **Non-destructive**: Only installs missing components, never overwrites existing configs
- **Modular**: Install only what you need
- **Status checking**: Verify what's installed

## What it installs

### Homebrew packages
- ripgrep, fd, pnpm, pipx, llvm, zsh, n, neovim, tmux
- Docker Desktop, Alacritty, Raycast
- JetBrains Mono Nerd Font
- Terraform, AWS CLI

### Shell setup
- Oh My Zsh with Dracula theme
- zsh-autosuggestions plugin
- Custom zsh configuration files

### Development tools
- Neovim with LSP support
- TypeScript language server
- Python language server with mypy and ruff
- Tmux with TPM (Tmux Plugin Manager)

## Idempotency

The Makefile is designed to be completely idempotent:
- Checks if packages are already installed before installing
- Only creates symlinks if they don't exist
- Preserves existing configurations
- Safe to run multiple times
