call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-commentary'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'takac/vim-hardtime'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/edge'
Plug 'tpope/vim-repeat'
Plug 'cespare/vim-toml'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'equalsraf/neovim-gui-shim'

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

" keybindings
let mapleader = "\<Space>"
" inoremap jj <Esc>

" exit terminal mode by ESC
tnoremap <Esc> <C-\><C-n>

" fast edit / reload config
nnoremap <leader>ce :new ~/.config/nvim/init.vim<CR>
nnoremap <leader>cr :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>cc :CocConfig<CR>

" Install plugins
nnoremap <leader>ci :PlugInstall<CR>
nnoremap <leader>cu :PlugUpdate<CR>

" Move current window to new tab
nnoremap <C-W><C-T> <C-W>T

" Language client
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap <silent> <leader>gr <Plug>(coc-rename)
nnoremap <silent> <leader>gd :call CocAction('jumpDefinition')<CR>
nnoremap <silent> <leader>gt :call CocAction('jumpTypeDefinition')<CR>
nnoremap <silent> <leader>hh :<C-U>:CocCommand actions.open<CR>
nnoremap <silent> <leader>hd <Plug>(coc-diagnostic-info)

" clear search hightlight
nmap <silent><Leader>n :noh<CR>

" open git status
nmap <silent><Leader>s :Gtabedit :<CR>

nmap gl $%
vmap gl $%

" Open command-line
nmap q; q:

" newrt settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" colors
set background=dark
let g:edge_style = 'neon'
colorscheme edge
hi Search guibg=tranparent guifg=red

" airline theme
let g:airline_theme = 'bubblegum'

" hardtime config
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "denite*" ]
let g:hardtime_ignore_quickfix = 1

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

" denite config
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#option('default', 'prompt', 'λ')
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nmap <leader>y <Plug>(coc-diagnostic-next-error)
nmap <leader>Y <Plug>(coc-diagnostic-prev-error)
nmap <leader>u <Plug>(coc-diagnostic-next)
nmap <leader>U <Plug>(coc-diagnostic-prev)
nmap <leader>p :Denite -start-filter file/rec<CR>
nmap <leader>b :Denite buffer<CR>
nmap <leader>G :Denite grep<CR>
nnoremap <leader>w :Denite -input=<c-r><c-w> grep<CR>
nnoremap <leader>W :Denite -input=<c-r><c-a> grep<CR>

" select inside function
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)

" select inside class
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)

" used for statusline
function! init#coc_status()
  let info = get(b:, 'coc_diagnostic_info', {})
  let msgs = []

  let errors = get(info, 'error', 0)
  let warnings = get(info, 'warning', 0) + get(info, 'information', 0) + get(info, 'hint', 0)

  if errors
    call add(msgs, '𐌴 ' . errors)
  endif

  if warnings
    call add(msgs, 'ᚼ ' . warnings)
  endif

  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction


let g:lightline = {
\  'active': {
\    'left': [[ 'mode', 'paste' ], ['readonly', 'filename', 'modified'], ['coc_status']],
\    'right': [['lineinfo'], ['percent']]
\  },
\  'component_function': {
\    'coc_status': 'init#coc_status'
\   },
\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:coc_global_extensions = [
  \'coc-prettier',
  \'coc-eslint',
  \'coc-tsserver',
  \'coc-json',
  \'coc-rls',
  \'coc-actions',
  \]

" custom text objects
" https://vimways.org/2018/transactions-pending/
" 'in line' (entire line sans white-space; cursor at beginning--ie, ^)
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" update "word" definition for css / scss files
autocmd FileType css,scss setlocal iskeyword+=-
