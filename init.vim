if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi'

call plug#end()


" ----- window and editing -----

filetype plugin indent on
syntax enable

set clipboard=unnamedplus

let mapleader=","
nmap ; :
:imap jj <Esc>


set autoread
set hidden
set title
set noswapfile
set nobackup
" set nowb

set backspace=indent,eol,start

set fileformat=unix

set history=1000
set undolevels=1000

set visualbell

" set number
set showcmd
set linebreak
set textwidth=80
set lazyredraw
set scrolloff=8
set laststatus=2
set list lcs=trail:·

" trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

set splitbelow
set splitright

nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-h> <C-w>h

" terminal
command! -nargs=* T sp | te <args>
command! -nargs=* VT vs | te <args>

tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
tnoremap <M-h> <C-\><C-n><C-w>h
autocmd BufWinEnter,WinEnter term://* startinsert
tnoremap <esc> <c-\><c-n>

" nerdtree
map <M-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize = 30


" ----- indentation -----

set autoindent
set smartindent
set expandtab
" set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

au BufRead,BufNewFile *.py set ts=4 sts=4 sw=4


autocmd FileType cmake setlocal ts=4 sts=4 sw=4
autocmd FileType dockerfile setlocal nolist noexpandtab
autocmd FileType make setlocal nolist noexpandtab

autocmd BufNewFile,Bufread *.s set ft=asm
autocmd FileType asm setlocal nolist noexpandtab


" ----- fzf -----

nnoremap <silent> ,t :Files<CR>
nnoremap <silent> ,b :Buffers<cr>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let $FZF_DEFAULT_OPTS .= ' --no-height'


" ----- searching -----

set ignorecase
set smartcase
set incsearch


" ----- appearance -----

colo gruvbox
let g:gruvbox_bold=0
set bg=dark

let g:lightline = {
  \'colorscheme': 'landscape',
  \'active': {'left': [['paste'],
  \                    ['readonly', 'filename', 'modified']]}
  \}


" ----- formatting and linting -----

let g:neoformat_enabled_c=['clangformat']
let g:neoformat_enabled_cpp=['clangformat']
let g:neoformat_enabled_python=['yapf']
let g:neoformat_enabled_yaml=[]

let g:neoformat_c_clangformat = {
  \'exe': 'clang-format',
  \'args': ['-style="{
    \ AllowShortFunctionsOnASingleLine: Empty,
    \ AllowShortIfStatementsOnASingleLine: false,
    \ AllowShortLoopsOnASingleLine: false,
    \ BasedOnStyle: Google,
    \ TabWidth: 2
  \ }"']
\}

let g:neoformat_cpp_clangformat = {
  \'exe': 'clang-format',
  \'args': ['-style="{
    \ AllowShortFunctionsOnASingleLine: Empty,
    \ AllowShortIfStatementsOnASingleLine: false,
    \ AllowShortLoopsOnASingleLine: false,
    \ BasedOnStyle: Google,
    \ TabWidth: 2,
  \ }"']
\}


augroup fmt
    autocmd!
    autocmd BufWritePre * Neoformat
    autocmd BufWritePre * :call ale#Lint()
augroup END

let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0
let g:ale_echo_cursor=0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list=1

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_linters = {
  \'c': [],
  \'cpp': [],
  \'python': ['flake8']
\}


" ----- autocomplete and LSP -----

let g:deoplete#enable_at_startup=1
" let g:deoplete#enable_smart_case=1


" use TAB to manually autocomplete with deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"

let g:LanguageClient_serverCommands = {
      \ 'c': ['clangd'],
      \ 'cpp': ['clangd'],
      \ 'python': ['pyls']
      \ }

let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_trace = 'verbose'

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
