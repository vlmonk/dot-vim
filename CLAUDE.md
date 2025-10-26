# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal Neovim configuration using lazy.nvim plugin manager. Requires Neovim 0.11+ for modern LSP configuration API.

## Installation

```bash
make install
```

This creates symlink from current directory to `~/.config/nvim`.

## Configuration Architecture

Entry point: `init.lua` loads modules in this order:
1. Plugin manager (`config.lazy`)
2. Core options and autocmds (`core/options.lua`, `core/autocmds.lua`)
3. Plugin configurations (`config/*.lua`)
4. Utilities (`utils/*.lua`)
5. Colors and keymaps

### Modular Structure

- `lua/plugins.lua` - Plugin declarations for lazy.nvim
- `lua/config/` - Individual plugin configurations
- `lua/core/` - Core Vim options and autocommands
- `lua/utils/` - Utility functions
- `lua/keymaps.lua` - All key bindings
- `lua/colors.lua` - Colorscheme setup

## LSP Configuration

Uses modern `vim.lsp.config()` API (Nvim 0.11+) in `lua/config/lsp.lua`.

### Configured Language Servers

- **Rust**: `rust_analyzer` with clippy on save
- **TypeScript**: `ts_ls` (formatting disabled, handled by null-ls)
- **Ruby**: Multiple servers
  - `rubocop` via bundler
  - `solargraph` via bundler
  - `ruby_lsp` with standard formatter
- **Lua**: `lua_ls` with Neovim API globals
- **YAML**: `yamlls` with formatting enabled

### Ruby LSP Notes

Ruby LSPs use bundler via `~/.rbenv/shims/bundle` path. When working with Ruby projects:
- Ensure LSPs are in project Gemfile
- Commands: `bundle exec rubocop --lsp`, `bundle exec solargraph stdio`

## Key Plugins

### Plugin Manager
- **lazy.nvim** - Plugin manager with automatic updates disabled

### Core Functionality
- **Telescope** - Fuzzy finder for files, grep, LSP symbols, diagnostics
- **nvim-treesitter** - Syntax highlighting and code structure
- **blink.cmp** - Completion engine (custom config in `lua/config/blink.lua`)
- **nvim-lspconfig** - LSP integration

### Git Integration
- **vim-fugitive** - Git commands within Vim
- **diffview.nvim** - Advanced diff views
- **gitsigns.nvim** - Git signs in gutter

### Testing
- **vim-test** - Test runner integration
  - Strategy: neovim (opens tests in split)
  - Keymaps: `<leader>m` (nearest), `<leader>M` (file)

## Common Development Commands

### Testing
- `<leader>m` - Run test nearest to cursor
- `<leader>M` - Run all tests in current file

### LSP Operations
- `<leader>d` - Go to definition
- `<leader>r` - Find references
- `<leader>R` - Rename symbol
- `<leader>a` - Code actions
- `<leader>F` - Format buffer
- `K` - Hover documentation
- `<leader>.` / `<leader>,` - Next/previous diagnostic

### File Navigation
- `<leader>p` - Find git files (tracked + untracked)
- `<leader>P` - Find files in current file's directory
- `<leader>b` - Switch buffers
- `<leader>G` - Live grep in project
- `<leader>w` - Grep word under cursor

### Git Operations
- `<leader>s` - Git status (fugitive)
- `<leader>fd` - Open diffview
- `<leader>fb` - Git blame
- `<leader>fs` - Vertical diff split

## Configuration Editing

- `<leader>ce` - Edit init.lua
- `<leader>cr` - Reload init.lua

## Code Style

- 2-space indentation (spaces, not tabs)
- Lua formatting via lua_ls built-in formatter
- Line length guides at columns 80 and 120
