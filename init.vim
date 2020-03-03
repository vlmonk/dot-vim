call plug#begin(stdpath('data') . '/plugged')

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'  }
Plug 'tpope/vim-commentary'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim', { 'commit': '6e01000280edc9c9c56ef7b1d59977fc93e3bf4c' }
Plug 'Shougo/denite.nvim'
Plug 'w0rp/ale'
Plug 'nannery/neovim-fuzzy'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'takac/vim-hardtime'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/edge'

call plug#end()

" common setting
set signcolumn=yes
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set termguicolors
set scrolloff=5
" enable deoplete
let g:deoplete#enable_at_startup=1

" rust config
let g:LanguageClient_serverCommands = { 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'] }
let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']

" keybindings
let mapleader = "\<Space>"
inoremap jj <Esc>

" exit terminal mode by ESC
tnoremap <Esc> <C-\><C-n>

" fast edit / reload config
nnoremap <leader>ce :new ~/.config/nvim/init.vim<CR>
nnoremap <leader>cr :source ~/.config/nvim/init.vim<CR>

" Install plugins
nnoremap <leader>ci :PlugInstall<CR>
			
" fuzzy open plugin
nnoremap <leader>pp :FuzzyOpen<CR>
nnoremap <leader>pg :FuzzyGrep<CR>

" ALE keybindings
nmap <leader>ii :ALEHover<CR>
nmap <leader>id :ALEGoToDefinition<CR>
nmap <leader>ip <Plug>(ale_detail)
imap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"

" goto next error
nmap <silent><leader>ek <Plug>(ale_previous_error)
nmap <silent><leader>ej <Plug>(ale_next_error)

" clear search hightlight
nmap <silent><Leader>m :noh<CR>

" open git status
nmap <silent><Leader>gs :Gstatus<CR>

nmap gl $%

" newrt settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" colors
set background=dark
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1
colorscheme edge

" airline theme
let g:airline_theme = 'bubblegum'

" ALE settings
let g:ale_fixers = { 
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'typescriptreact': ['prettier'],
\ 'scss': ['prettier'],
\ 'svg': ['xmllint'],
\ 'xml': ['xmllint'],
\ 'html': ['prettier']
\ }

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint', 'tsserver'],
\   'scss': [],
\   'c': [],
\}

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '??'
let g:ale_fix_on_save = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']


" fold config
set foldcolumn=0
set foldmethod=syntax
set foldlevel=3

" hardtime config
let g:hardtime_default_on = 1

" git guitter
let g:gitgutter_sign_added = '●'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '●'
let g:gitgutter_sign_removed_first_line = '●'
let g:gitgutter_sign_modified_removed = '●'
