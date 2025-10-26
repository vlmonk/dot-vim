# Neovim Configuration

Personal Neovim configuration with curated plugins and settings for improved productivity.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [macOS](#macos)
  - [Ubuntu](#ubuntu)
- [Configuration](#configuration)
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


## Future Plans

- [ ] Try [mini.vim](https://github.com/echasnovski/mini.nvim)
