# README.md Maintenance Rule

**CRITICAL**: Always update README.md when adding, removing, or modifying any configuration, library, or module in this dotfiles project.

## When to update README.md:
- Adding new software/tools to the Makefile
- Installing new packages via Homebrew
- Adding new Neovim plugins
- Modifying Tmux configuration or plugins
- Updating Alacritty settings
- Changing Starship prompt configuration
- Adding new Zsh aliases, functions, or environment variables
- Creating new scripts in bin/
- Modifying any configuration file that affects the user experience
- **Adding, removing, or modifying Tmux keybindings**
- **Adding, removing, or modifying Neovim keybindings**
- **Changing Tmux prefix key**
- **Modifying Tmux-Nvim integration settings**

## What to update in README.md:
1. **Software Included section**: Add/remove software descriptions
2. **What it installs section**: Update package lists and descriptions
3. **Configuration Details section**: Update specific configuration descriptions
4. **Features section**: Add new capabilities or remove obsolete ones
5. **Keybindings section**: Update Tmux and Neovim keybinding documentation

## Update process:
1. Identify what changed in the configuration
2. Update the relevant section in README.md
3. Ensure descriptions are accurate and detailed
4. Maintain consistency with the existing format
5. Test that the updated README reflects the actual configuration

## Example updates:
- New Neovim plugin → Add to "Development tools" and "Configuration Details" sections
- New Homebrew package → Add to "What it installs" section
- New Zsh alias → Add to "Configuration Details" section
- New Tmux plugin → Update "Configuration Details" section
- **New Tmux keybinding** → Update "Keybindings" section under Tmux Multiplexer
- **New Neovim keybinding** → Update "Keybindings" section under Neovim Editor
- **Changed Tmux prefix** → Update both "Configuration Details" and "Keybindings" sections
- **Tmux-Nvim integration changes** → Update "Keybindings" section and "Configuration Details"

This rule ensures the README.md stays current and accurately represents the actual dotfiles configuration.
