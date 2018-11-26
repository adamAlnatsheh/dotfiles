if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

call plug#end()


" ----- window -----

filetype plugin indent on
syntax enable

let mapleader=","
nmap ; :
:imap jj <Esc>

set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus
set fileformat=unix
set hidden
set history=1000
set laststatus=2
set lazyredraw
set linebreak
set list lcs=trail:·
set noswapfile
set nobackup
" set nowb
set scrolloff=8
set showcmd
set splitbelow
set splitright
set textwidth=80
set title
set undolevels=1000
set visualbell

" trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" terminal
:tmap jj <Esc>
command! -nargs=* T sp | te <args>
command! -nargs=* VT vs | te <args>

tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
autocmd BufWinEnter,WinEnter term://* startinsert
tnoremap <esc> <c-\><c-n>

" nerdtree
map <C-n> :NERDTreeToggle<CR>
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

autocmd FileType python setlocal tw=79 ts=4 sts=4 sw=4
autocmd FileType c setlocal ts=8 sts=8 sw=8 nolist noexpandtab

autocmd FileType cmake setlocal ts=4 sts=4 sw=4
autocmd FileType dockerfile setlocal nolist noexpandtab
autocmd FileType make setlocal nolist noexpandtab

autocmd BufNewFile,Bufread *.s set ft=asm
autocmd FileType asm setlocal nolist noexpandtab


" ----- searching -----

set ignorecase
set incsearch
set smartcase


" ----- fzf -----

nnoremap <silent> ,t :Files<CR>
nnoremap <silent> ,b :Buffers<cr>

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let $FZF_DEFAULT_OPTS .= ' --no-height'


" ----- appearance -----

colo jellybeans

let g:lightline = {
  \'colorscheme': 'landscape',
  \'active': {'left': [['paste'],
  \                    ['readonly', 'filename', 'modified']]}
  \}


" ----- ide -----

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
    autocmd BufWritePre * :Neoformat
augroup END

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
let g:LanguageClient_trace = 'verbose'
call deoplete#custom#option('auto_complete_delay', 5)
call deoplete#custom#option('auto_refresh_delay', 12)

function LC_maps()
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
endfunction

autocmd FileType c,cpp,python call LC_maps()
