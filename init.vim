call plug#begin(stdpath('data') . '/plugged')

Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
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
Plug 'nvim-lua/lsp-status.nvim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Enhanced jump + common library
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-EnhancedJumps'

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'

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
set scrolloff=1
set noshowmode
set hidden
set nohls

" let g:coc_enable_locationlist=1
" let g:coc_quickfix_open_command="Denite quickfix"

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
" nnoremap <leader>cc :CocConfig<CR>

" Install plugins
nnoremap <leader>ci :PlugInstall<CR>
nnoremap <leader>cu :PlugUpdate<CR>

" debug color group
" https://stackoverflow.com/questions/1467438/find-out-to-which-highlight-group-a-particular-keyword-symbol-belongs-in-vim
nnoremap <leader>cx :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

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

" let ayucolor="mirage"
" colorscheme ayu

colorscheme gruvbox

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

nmap <leader>y :Telescope lsp_document_diagnostics<CR>
nmap <leader>Y :Telescope lsp_workspace_diagnostic<CR>
nmap <leader>. :lua vim.lsp.diagnostic.goto_next()<CR>
nmap <leader>, :lua vim.lsp.diagnostic.goto_prev()<CR>
nmap <leader>z :Telescope lsp_document_symbols<CR>
nnoremap <silent> K <Cmd>lua vim.lsp.buf.hover()<CR>


nmap <silent> <leader>p :Telescope find_files<CR>
nmap <silent> <leader>P :exec("Telescope find_files cwd=" . expand('%:p:h'))<CR>

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
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

let g:lightline = {
\  'active': {
\    'left': [[ 'mode', 'paste' ], ['readonly', 'filename', 'modified'], ['LspStatus']],
\    'right': [['lineinfo'], ['percent']]
\  },
\  'component_function': {
\    'LspStatus': 'LspStatus'
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
    let myUndoDir = expand(vimDir . '/undodir-v5')
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

lua << EOF
local lsp_status = require('lsp-status')

lsp_status.config({
  status_symbol = '',
  indicator_errors = 'ᛓ',
  indicator_warnings = 'ᚼ',
  indicator_info = 'ᛊ',
  indicator_hint = 'ᛘ',
  indicator_ok = '',
  indicator_separator = '',
})

lsp_status.register_progress()

local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup{}
lspconfig.tsserver.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})
lspconfig.solargraph.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
  cmd = { "bundle", "exec", "solargraph", "stdio" },
  settings = {
    solargraph = {
      logLevel = "debug",
      diagnostics = true,
      useBundler = true
    }
  }
})

require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules", "tmp", "target"}, prompt_position = "top", sorting_strategy = "ascending" } }
EOF

lua require('nvim-compe')

lua << EOF
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      signs = true,
      severity_sort = true,
      virtual_text = { prefix = "→" }
    }
  )
EOF

sign define LspDiagnosticsSignError text=→ texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=→ texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=→ texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=→ texthl=LspDiagnosticsSignHint linehl= numhl=

hi LspDiagnosticsSignError guifg=#DE0000 ctermfg=White
hi LspDiagnosticsVirtualTextErro guifg=#DE0000 ctermfg=White

hi LspDiagnosticsSignWarning guifg=#FFAE57 ctermfg=White
hi LspDiagnosticsVirtualTextWarning guifg=#FFAE57 ctermfg=White

hi LspDiagnosticsSignHint guifg=#B3B3B3 ctermfg=White
hi LspDiagnosticsVirtualTextHint guifg=#B3B3B3 ctermfg=White

hi LspDiagnosticsSignInformation guifg=#B3B3B3 ctermfg=White
hi LspDiagnosticsVirtualTextInformation guifg=#B3B3B3 ctermfg=White

" vertical line
set colorcolumn=80,120
highlight ColorColumn ctermbg=lightgrey guibg=#342F3E
