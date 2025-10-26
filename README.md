# Neovim Configuration

Personal Neovim configuration with curated plugins and settings for improved productivity.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [macOS](#macos)
  - [Ubuntu](#ubuntu)
- [Configuration](#configuration)
- [Key Bindings](#key-bindings)
- [Future Plans](#future-plans)

## Prerequisites

- Git
- Terminal with Unicode support
- Node.js and npm
- Python 3 and pip

## Installation

### macOS

1. Install Neovim and dependencies:

```bash
brew install nvim
brew install the_silver_searcher
```

2. Install required packages:

```bash
npm install -g neovim
pip3 install --user pynvim
```

3. Link configuration files:

```bash
make install
```

### Ubuntu

1. Install Neovim:

```bash
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
```

2. Follow steps 2-4 from the macOS installation.

## Key Bindings

Leader key is set to `<Space>`.

### Configuration Management

| Key | Action |
|-----|--------|
| `<leader>ce` | Edit init.lua |
| `<leader>cr` | Reload init.lua |

### Buffer & Window Management

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<leader>q` | Close current buffer |
| `<leader>vv` | Vertical split |
| `<leader>vs` | Horizontal split |
| `<C-W><C-T>` | Move window to new tab |

### File Navigation (Telescope)

| Key | Action |
|-----|--------|
| `<leader>p` | Find git files (tracked + untracked) |
| `<leader>P` | Find files in current file's directory |
| `<leader>b` | Switch buffers |
| `<leader>t` | NvimTree: find current file |

### Search & Grep (Telescope)

| Key | Action |
|-----|--------|
| `<leader>G` | Live grep in workspace |
| `<leader>w` | Grep word under cursor |
| `<leader>W` | Grep WORD under cursor |
| `<leader>gv` | Resume last telescope search |

### LSP Operations

| Key | Action |
|-----|--------|
| `<leader>d` | Go to definition |
| `<leader>r` | Find references |
| `<leader>R` | Rename symbol |
| `<leader>T` | Go to type definition |
| `<leader>a` | Code actions |
| `<leader>F` | Format buffer |
| `K` | Hover documentation |
| `<leader>z` | Document symbols |
| `<leader>Z` | Workspace symbols |

### Diagnostics

| Key | Action |
|-----|--------|
| `<leader>y` | Buffer diagnostics |
| `<leader>Y` | Workspace diagnostics |
| `<leader>.` | Next diagnostic |
| `<leader>,` | Previous diagnostic |
| `<leader>D` | Show line diagnostics |

### Git Operations (Fugitive & Diffview)

| Key | Action |
|-----|--------|
| `<leader>s` | Git status |
| `<leader>fs` | Vertical diff split |
| `<leader>fh` | Diff with HEAD |
| `<leader>fo` | Open file from HEAD |
| `<leader>fb` | Git blame |
| `<leader>fp` | Git push |
| `<leader>fP` | Git force push |
| `<leader>fd` | Open diffview |
| `<leader>fc` | Close diffview |

### Testing (vim-test)

| Key | Action |
|-----|--------|
| `<leader>m` | Run nearest test |
| `<leader>M` | Run all tests in file |

### Navigation

| Key | Action |
|-----|--------|
| `gl` | Jump to end of block (normal & visual) |
| `<leader>o` | Enhanced jumps: remote older |
| `]q` | Next quickfix entry |
| `[q` | Previous quickfix entry |

### Clipboard

| Key | Action |
|-----|--------|
| `<leader>N` | Yank line/selection to system clipboard |

### Miscellaneous

| Key | Action |
|-----|--------|
| `<Esc>` (normal) | Clear search highlight |
| `<Esc>` (terminal) | Exit terminal mode |
| `q;` | Edit ex-command-line |
| `<leader>S` | Toggle HardTime mode |

### Custom Text Objects

| Key | Action |
|-----|--------|
| `il` | Inner line (excluding leading/trailing whitespace) |

## Future Plans

- [ ] Try [mini.vim](https://github.com/echasnovski/mini.nvim)
