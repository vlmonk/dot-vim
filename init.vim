call plug#begin(stdpath('data') . '/plugged')

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'  }
Plug 'tpope/vim-commentary'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'w0rp/ale'
Plug 'nannery/neovim-fuzzy'
Plug 'tpope/vim-surround'
Plug 'ajmwagar/vim-deus'

call plug#end()

" common setting
set signcolumn=yes
set tabstop=2
set shiftwidth=2
set expandtab

" enable deoplete
let g:deoplete#enable_at_startup=1

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
nnoremap <leader>pg :FuzzyGrep<CR>

" ALE keybindings
nnoremap <leader>ii :ALEHover<CR>
nnoremap <leader>id :ALEGoToDefinition<CR>

" goto next error
nnoremap <leader>ee :lnext<CR>

" newrt settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" colors
colorscheme deus

" ALE settings
let g:ale_fixers = { 
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescriptreact': ['prettier']
\ }

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint', 'tsserver'],
\}

let g:ale_sign_error = '⁉'
let g:ale_sign_warning = 'ѻ'
let g:ale_fix_on_save = 1
