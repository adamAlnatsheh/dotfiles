if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'cohama/lexima.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'sbdchd/neoformat'
Plug 'tomasr/molokai'

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
set noshowmatch
set scrolloff=8
set showcmd
set splitbelow
set splitright
set textwidth=80
set title
set undolevels=1000
set visualbell
set virtualedit=all

" trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h


" ----- indentation -----

set autoindent
set smartindent
set expandtab
" set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

autocmd BufNewFile,Bufread *.h set ft=c
autocmd FileType c,cpp setlocal ts=8 sts=8 sw=8 nolist noexpandtab
autocmd FileType python setlocal tw=79 ts=4 sts=4 sw=4

autocmd FileType make setlocal nolist noexpandtab

autocmd BufNewFile,Bufread *.s set ft=asm
autocmd FileType asm setlocal nolist noexpandtab

" autocmd FileType markdown setlocal spell spelllang=en_us


" ----- searching -----

set ignorecase
set incsearch
set smartcase


" ----- fzf -----

nnoremap <silent> ,t :Files<CR>

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


" ----- formatting -----

let g:neoformat_enabled_c=['clangformat']
let g:neoformat_enabled_cpp=['clangformat']
let g:neoformat_enabled_cmake=['cmakeformat']
let g:neoformat_enabled_python=['yapf']

augroup fmt
    autocmd!
    autocmd BufWritePre * Neoformat
augroup END
