call plug#begin(stdpath('data') . '/plugged')

Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'HerringtonDarkholme/yats.vim'
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
Plug 'famiu/bufdelete.nvim'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'kchmck/vim-coffee-script'
Plug 'p00f/nvim-ts-rainbow'
Plug 'jose-elias-alvarez/null-ls.nvim'

" comments
Plug 'tpope/vim-commentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Enhanced jump + common library
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-EnhancedJumps'

" Colorschemes
Plug 'sainnhe/sonokai'

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

set fileencodings=utf-8

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
nmap <silent> <leader>q :Bd<CR>

" window split
nmap <silent> <leader>vv :vsplit<CR>
nmap <silent> <leader>vs :split<CR>

" clear search hightlight
nmap <silent><ESC> :noh<CR>

" fugitive mapping
nmap <silent><Leader>s <cmd>Gedit :<CR>
nmap <silent><Leader>fs <cmd>Gvsplit :%<CR>
nmap <silent><Leader>fb <cmd>Git blame<CR>
nmap <silent><Leader>fp <cmd>Git push<CR>
nmap <silent><Leader>fP <cmd>Git push -fu origin HEAD<CR>

nmap gl $%
vmap gl $%

" Custom bindings for Enhanced Jumps
nmap <silent><Leader>o <Plug>EnhancedJumpsRemoteOlder

" newrt settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" colors

set background=dark

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
colorscheme sonokai
" custom override for sonokai scheme
highlight! link TSPunctBracket Blue

hi Search guibg=transparent guifg=#fa7dfa
hi SignColumn guibg=transparent

" itaclic comments
hi Comment gui=italic

" hardtime config
let g:hardtime_default_on = 1
let g:hardtime_ignore_buffer_patterns = ["undotree*", "NERD*", "fugitiveblame", "fugitive:" ]
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

nmap <leader>y <cmd>Telescope diagnostics bufnr=0<CR>
nmap <leader>Y <cmd>Telescope diagnostics<CR>
nmap <leader>. <cmd>lua vim.diagnostic.goto_next()<CR>
nmap <leader>, <cmd>lua vim.diagnostic.goto_prev()<CR>
nmap <leader>z <cmd>Telescope lsp_document_symbols<CR>
nmap <leader>Z <cmd>Telescope lsp_dynamic_workspace_symbols<CR>
nmap <leader>D <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nmap <leader>a <cmd>Telescope lsp_code_actions<CR>
nnoremap <silent> K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>d <cmd>Telescope lsp_definitions<CR>
nnoremap <silent> <leader>T <cmd>Telescope lsp_type_definitions<CR>
nnoremap <silent> <leader>R <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>r <cmd>Telescope lsp_references<CR>

nmap <silent> <leader>p :Telescope git_files<CR>
nmap <silent> <leader>P :exec("Telescope find_files cwd=" . expand('%:p:h'))<CR>
nmap <silent> <leader>b <Cmd>Telescope buffers<CR>

nmap <leader>G <cmd>Telescope live_grep<CR>
nnoremap <leader>gv <cmd>Telescope resume<CR>

" todo Port this to telescope
nnoremap <silent> <leader>w :lua require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<cr>
nnoremap <silent> <leader>W :lua require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cWORD>'), initial_mode = 'normal' })<cr>
" nnoremap <leader>W :Denite -input=<c-r><c-a> -sorters=sorter/path grep<CR>
" nnoremap <leader>gn :Denite -resume -cursor-pos=+1 -immediately<CR>
" nnoremap <leader>gp :Denite -resume -cursor-pos=-1 -immediately<CR>

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

" select inside class

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

autocmd BufWritePre * if &ft =~ 'vim\|ruby\|python\|haml' | :call <SID>StripTrailingWhitespaces() | endif

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

" format current buffer as json
function FormatAsJson ()
  set filetype=json
  Format
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

local on_attach_tsserver = function(client)
  client.resolved_capabilities.document_formatting = false
  lsp_status.on_attach(client)
end

lspconfig.tsserver.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  on_attach = on_attach_tsserver,
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
EOF

lua require('nvim-compe')
lua require('telescope-config')
lua require('ts')
lua require('null-ls-config')

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

" auto-format on save
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 1000)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_seq_sync(null, 500, { 'null-ts' })
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_seq_sync(null, 500, { 'null-ts' })
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_seq_sync(null, 500, { 'null-ts' })
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_seq_sync(null, 500, { 'null-ts' })
autocmd BufWritePre *.scss lua vim.lsp.buf.formatting_seq_sync(null, 500, { 'null-ts' })

let g:NERDTreeMapHelp = '∞'
