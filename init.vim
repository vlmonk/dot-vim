call plug#begin(stdpath('data') . '/plugged')

Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh'  }
Plug 'tpope/vim-commentary'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'w0rp/ale'
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
set noshowmode

" config deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete', 'False')

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
nnoremap <leader>cu :PlugUpdate<CR>

" ALE keybindings
nmap <leader>ii :ALEHover<CR>
nmap <leader>id :ALEGoToDefinition<CR>
nmap <leader>ip <Plug>(ale_detail)
imap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"

" Language client
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" goto next error
nmap <silent><leader>ek <Plug>(ale_previous_error)
nmap <silent><leader>ej <Plug>(ale_next_error)

" clear search hightlight
nmap <silent><Leader>n :noh<CR>

" open git status
nmap <silent><Leader>gs :Gstatus<CR>

nmap gl $%
vmap gl $%

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
\ 'javascript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\ 'typescript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\ 'typescriptreact': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\ 'scss': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\ 'svg': ['xmllint', 'remove_trailing_lines', 'trim_whitespace'],
\ 'xml': ['xmllint', 'remove_trailing_lines', 'trim_whitespace'],
\ 'html': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\ 'eruby': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'typescriptreact': ['eslint', 'tsserver'],
\   'scss': [],
\   'c': [],
\   'eruby': ['htmlhint']
\}

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '??'
let g:ale_fix_on_save = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" hardtime config
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "denite*" ]

" git guitter
let g:gitgutter_sign_added = '●'
let g:gitgutter_sign_modified = '●'
let g:gitgutter_sign_removed = '●'
let g:gitgutter_sign_removed_first_line = '●'
let g:gitgutter_sign_modified_removed = '●'

" remove background from git guitter signs
hi GitGutterAdd guibg=transparent
hi GitGutterChange guibg=transparent
hi GitGutterDelete guibg=transparent

" write to swap file often (and get gitguitter updates faster)
set updatetime=100

" prettier for .html.erb files
autocmd FileType eruby let b:ale_javascript_prettier_options="--parser html"

" denite config
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#option('default', 'prompt', 'λ')
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nmap <leader>pp :Denite -start-filter file/rec<CR>
nmap <leader>pb :Denite buffer<CR>
nmap <leader>pg :Denite grep<CR>
