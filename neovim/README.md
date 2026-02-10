# Neovim Configuration

This directory contains my Neovim configuration based on [LazyVim](https://www.lazyvim.org/).

## Features

- **LazyVim**: Modern Neovim configuration framework
- **Copilot**: GitHub Copilot integration via copilot.vim
- **Sidekick.nvim**: Claude AI integration directly inside Neovim
- **LSP Support**: Language Server Protocol with custom configurations
- **Custom Plugins**: Auto-save, custom colorscheme, and more

## Installation

Run the following from the root of the panfiles repository:

```bash
make editor
```

Or specifically for Neovim:

```bash
make install -C neovim
```

### Prerequisites

The installation requires:
- **Neovim** (installed via the Makefile)
- **Node.js** (installed via `third-party/brew` on macOS)
- **Nerd Font** (Hack Nerd Font, installed via the Makefile)
- **tmux** (for sidekick.nvim CLI integration)

All prerequisites are automatically installed when running `make darwin` on macOS.

## Sidekick.nvim (Claude AI Integration)

Sidekick allows you to interact with Claude AI directly inside Neovim.

### Setup

1. **Copilot Agent Server**: The sidekick plugin uses the Copilot language server as infrastructure. No additional installation is needed - it's handled by the plugin.

2. **Claude CLI**: You need to have the Claude CLI installed and authenticated:
   ```bash
   # The Claude CLI should be installed separately
   # Authenticate with: claude login
   ```

3. **Tmux Backend**: The plugin is configured to use tmux as the backend for the CLI interface.

### Keybindings

- `<leader>ac` - Open Claude directly
- `<leader>aa` - Toggle AI CLI terminal
- `<leader>at` - Send current file to Claude
- `<leader>av` - Send visual selection to Claude (in visual mode)
- `<leader>as` - Select AI tool
- `<leader>ap` - Insert AI prompt
- `<Tab>` - Apply/jump to next AI edit suggestion

## Plugin Structure

Custom plugins are defined in `lua/plugins/`:

- `sidekick.lua` - Claude AI integration
- `copilot.lua` - GitHub Copilot configuration
- `lspconfig.lua` - LSP configurations including Copilot LSP
- `colorscheme.lua` - Custom colorscheme settings
- `auto-save.lua` - Auto-save functionality
- `chatgpt.lua` - ChatGPT integration (optional)

## Configuration Files

- `lua/config/options.lua` - Neovim options and settings
- `lua/config/lazy.lua` - Lazy.nvim plugin manager configuration

## How It Works

The Makefile:
1. Installs Neovim via Homebrew (on macOS)
2. Installs Hack Nerd Font for proper icon display
3. Clones LazyVim starter configuration if not present
4. Copies custom configurations from `lua/*` to `~/.config/nvim/lua/`
5. Runs `:Lazy! sync` to install all plugins

## Verification

After installation, verify sidekick is working:

```vim
:checkhealth sidekick
```

All checks should pass. If not, ensure:
- Claude CLI is installed and authenticated
- tmux is installed and running
- Node.js is available in your PATH

## Usage

Open Neovim and press `<leader>ac` to start using Claude inside Vim!
