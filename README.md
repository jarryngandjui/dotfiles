# Dotfiles

My config files for macOS terminal environment.

## Software Included

- **alacritty** - Terminal emulator with VS Code-inspired dark theme and JetBrains Mono Nerd Font
- **neovim** - Text editor with NvChad UI, LSP support, and extensive plugin ecosystem
- **zsh** - Shell with custom configuration, completion system, and dotfiles management
- **tmux** - Terminal multiplexer with Catppuccin theme and productivity plugins
- **starship** - Cross-shell prompt with Catppuccin Mocha theme and AWS/K8s integration
- **scripts** - Utility scripts for GitHub SSH setup and development workflows

## Usage

```bash
# Install everything (recommended for first-time setup)
make all

# Install specific components
make homebrew    # Install Homebrew and packages
make shell       # Setup Zsh and Starship prompt
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
- **Core tools**: ripgrep, fd, pnpm, pipx, llvm, zsh, n, neovim, tmux
- **Applications**: Docker Desktop, Alacritty, Raycast
- **Fonts**: JetBrains Mono Nerd Font
- **Cloud tools**: Terraform, AWS CLI

### Shell setup
- **Zsh configuration**: Custom aliases, environment variables, completion system
- **Starship prompt**: Catppuccin Mocha theme with AWS/Kubernetes integration
- **Dotfiles management**: `dot` command with tab completion for all make targets

### Development tools
- **Neovim**: NvChad UI with Catppuccin theme and transparency
- **LSP support**: TypeScript, Python, Rust, Go, C/C++, HTML/CSS, JSON, YAML, Docker, and more
- **Plugins**: Git integration, LaTeX support, code formatting, snippets
- **Tmux**: Catppuccin theme with session management, fzf integration, and productivity plugins

## Configuration Details

### Alacritty Terminal
- **Theme**: VS Code-inspired dark theme with custom colors
- **Font**: JetBrains Mono Nerd Font (14pt)
- **Features**: 10k scrollback history, 98% opacity, 10px padding
- **Performance**: Hardware acceleration enabled

### Neovim Editor
- **UI**: NvChad v2.5 with Catppuccin theme and transparency
- **LSP**: Comprehensive language support for 15+ languages
- **Plugins**: Git integration (fugitive, flog, diffview), LaTeX (vimtex), code formatting (conform.nvim)
- **Features**: Treesitter syntax highlighting, LuaSnip snippets, null-ls for additional tooling

### Tmux Multiplexer
- **Theme**: Catppuccin with custom status bar and window styling
- **Plugins**: TPM, sensible defaults, yank, resurrect, continuum, fzf integration
- **Custom**: Session management, floating windows, URL opening, meeting integration
- **Keybindings**: Vi mode, custom prefix (Ctrl+A), pane management

### Starship Prompt
- **Theme**: Catppuccin Mocha palette
- **Modules**: Directory, git branch, AWS profile, Kubernetes context
- **Features**: Command timeout, custom character symbols, directory substitutions

### Zsh Shell
- **Completion**: Full zsh completion system with `compdef` support
- **Aliases**: Editor shortcuts, navigation, configuration editing
- **Functions**: Git branch management, dotfiles completion
- **Environment**: Comprehensive PATH setup, project directories, tool configurations

## Idempotency

The Makefile is designed to be completely idempotent:
- Checks if packages are already installed before installing
- Only creates symlinks if they don't exist
- Preserves existing configurations with smart merging
- Safe to run multiple times
- Creates backups before making changes