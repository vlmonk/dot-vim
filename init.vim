call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-commentary'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'
Plug 'chemzqm/denite-extra'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'takac/vim-hardtime'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/edge'
Plug 'tpope/vim-repeat'
Plug 'cespare/vim-toml'
Plug 'equalsraf/neovim-gui-shim'
Plug 'hashivim/vim-terraform'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Enhanced jump + common library
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-EnhancedJumps'

" Colorschemes
Plug 'ayu-theme/ayu-vim'

" vim-indent-object
Plug 'michaeljsmith/vim-indent-object'

call plug#end()

" common setting
set signcolumn=yes
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set termguicolors
set scrolloff=2
set noshowmode
set hidden

# let g:coc_enable_locationlist=1
# let g:coc_quickfix_open_command="Denite quickfix"

" config deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete', 'False')

" disable mappings for Enhanced Jubs
:let g:EnhancedJumps_no_mappings = 1

" keybindings
let mapleader = "\<Space>"

nnoremap <silent> <Tab> :bnext<CR>

" exit terminal mode by ESC
tnoremap <Esc> <C-\><C-n>

" fast edit / reload config
nnoremap <leader>ce :new ~/.config/nvim/init.vim<CR>
nnoremap <leader>cr :source ~/.config/nvim/init.vim<CR>
# nnoremap <leader>cc :CocConfig<CR>

" Install plugins
nnoremap <leader>ci :PlugInstall<CR>
nnoremap <leader>cu :PlugUpdate<CR>

" Move current window to new tab
nnoremap <C-W><C-T> <C-W>T

" cycle buffers
nmap <silent> <Tab> :bnext<CR>

" close current buffer
nmap <silent> <leader>q :bd<CR>

" window split
nmap <silent> <leader>vv :vsplit<CR>
nmap <silent> <leader>vs :split<CR>

" Language client
" nmap <silent> <leader>a  <Plug>(coc-codeaction-cursor)
" nnoremap <silent> K :call CocAction('doHover')<CR>
" nmap <silent> <leader>gR <Plug>(coc-rename)
" nmap <silent> <leader>gr <Plug>(coc-references)
" nmap <silent> <leader>gd <Plug>(coc-definition)
" nmap <silent> <leader>gt <Plug>(coc-type-definition)
" nmap <silent> <leader>gz <Plug>(coc-refactor)

" clear search hightlight
nmap <silent><ESC> :noh<CR>

" fugitive mapping
nmap <silent><Leader>s :Gedit :<CR>
nmap <silent><Leader>fs :Gvsplit :%<CR>
nmap <silent><Leader>fb :Git blame<CR>

nmap gl $%
vmap gl $%

" Custom bindings for Enhanced Jumps
nmap <silent><Leader>o <Plug>EnhancedJumpsRemoteOlder

" newrt settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" colors

" set background=dark
" let g:edge_style = 'neon'
" colorscheme edge

let ayucolor="mirage"
colorscheme ayu
hi Search guibg=transparent guifg=#fa7dfa
hi SignColumn guibg=transparent

" itaclic comments
hi Comment gui=italic

" airline theme
let g:airline_theme = 'bubblegum'

" hardtime config
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = [ "denite*", "undotree*", "NERD*", "fugitiveblame", "fugitive:" ]
let g:hardtime_ignore_quickfix = 1

" git guitter
"
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '│'
let g:gitgutter_sign_removed_first_line = '│'
let g:gitgutter_sign_modified_removed = '│'

" remove background from git guitter signs
hi GitGutterAdd guibg=transparent guifg=#a887f5
hi GitGutterChange guibg=transparent guifg=#a887f5
hi GitGutterDelete guibg=transparent guifg=#a887f5
hi GitGutterChangeDelete guibg=transparent guifg=#a887f5

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

" nmap <leader>y <Plug>(coc-diagnostic-next-error)
" nmap <leader>Y <Plug>(coc-diagnostic-prev-error)
" nmap <leader>u <Plug>(coc-diagnostic-next)
" nmap <leader>U <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>p :Denite -start-filter -split=vertical -winwidth=60 file/rec<CR>
nmap <silent> <leader>P :exec("Denite -start-filter -split=vertical -winwidth=60 file/rec:" . expand('%:p:h'))<CR>
nmap <silent> <leader>b :Denite buffer<CR>
nmap <leader>G :Denite grep<CR>
nnoremap <leader>w :Denite -input=<c-r><c-w> -sorters=sorter/path grep<CR>
nnoremap <leader>W :Denite -input=<c-r><c-a> -sorters=sorter/path grep<CR>
nnoremap <leader>gn :Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <leader>gp :Denite -resume -cursor-pos=-1 -immediately<CR>
nnoremap <leader>gv :Denite -resume<CR>
" nnoremap <leader>Y :Denite coc-diagnostic<CR>

" undotree config
nnoremap <leader>i :UndotreeShow<CR>:UndotreeFocus<CR>
nnoremap <leader>I :UndotreeHide<CR>
let g:undotree_HighlightChangedWithSign = 1

" nerdtree config
function! SmartNERDTree()
  if @% == ""
    NERDTreeToggle
  else
    NERDTreeFind
  endif
endfun

nnoremap <silent> <leader>t :call SmartNERDTree()<CR>
let g:NERDTreeWinSize=60
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeWinPos = "right"

" select inside function
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)

" select inside class
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)

" used for statusline
function! init#coc_status()
  let info = get(b:, 'coc_diagnostic_info', {})
  let msgs = []

  let errors = get(info, 'error', 0)
  let warnings = get(info, 'warning', 0) + get(info, 'information', 0) + get(info, 'hint', 0)

  if errors
    call add(msgs, 'ᛓ ' . errors)
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

" custom text objects
" https://vimways.org/2018/transactions-pending/
" 'in line' (entire line sans white-space; cursor at beginning--ie, ^)
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" update "word" definition for css / scss files
autocmd FileType css,scss setlocal iskeyword+=-

" cleanup tralling space before save
" https://unix.stackexchange.com/questions/75430/how-to-automatically-strip-trailing-spaces-on-save-in-vi-and-vim

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * if &ft =~ 'vim\|ruby\|python' | :call <SID>StripTrailingWhitespaces() | endif

" vertical splitbar style
set fillchars+=vert:│
hi VertSplit guifg=#9e9d9d

" custom style for error messages
hi clear ErrorMsg
hi ErrorMsg guifg=#ffa6b3 guibg=transparent

" undo setup
let vimDir = '$HOME/.vim'

if stridx(&runtimepath, expand(vimDir)) == -1
  " vimDir is not on runtimepath, add it
  let &runtimepath.=','.vimDir
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Open command line on q;
" Tricky setup because I want to disable this keymapping in NERD buffers

function RemoveQMapping ()
  let l:ft = &ft

  if l:ft ==? 'nerdtree'
    nunmap <buffer>q;
  endif
endfunction

autocmd BufEnter * nnoremap <buffer>q; q:
autocmd FileType * call RemoveQMapping()

function CustomBClose ()
  let l:filename = expand('%')
  if match(l:filename, '^fugitive:/') == 0 || match(l:filename, 'fugitiveblame$') > -1 || l:filename == '.git/index'
    bdelete
  else
    Bclose(bufnr('%'))
  endif
endfunction

" bclose plugin
let g:bclose_no_plugin_maps = 1
nnoremap <silent> <leader>q :call CustomBClose()<CR>

" format current buffer as json
function FormatAsJson ()
  set filetype=json
  " execute 'CocCommand prettier.formatFile'
endfunction


nnoremap <silent> <leader>ff :call FormatAsJson()<CR>

" Auto-reload when file changed
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
autocmd FileChangedShellPost *  echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

