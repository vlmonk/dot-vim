call plug#begin(stdpath('data') . '/plugged')

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'  }
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'nannery/neovim-fuzzy'

call plug#end()

" common setting
set signcolumn=yes
set tabstop=2
set shiftwidth=2
set expandtab

" rust config
let g:LanguageClient_serverCommands = { 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'] }
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']

" keybindings
let mapleader = "\<Space>"
inoremap jj <Esc>

" fast edit / reload config
nnoremap <leader>ce :new ~/.config/nvim/init.vim<CR>
nnoremap <leader>cr :source ~/.config/nvim/init.vim<CR>
			
" fuzzy open plugin
nnoremap <leader>pp :FuzzyOpen<CR>
