if &compatible
  set nocompatible
endif

set runtimepath+=/home/aia/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/aia/.cache/dein')
  call dein#begin('/home/aia/.cache/dein')

  " Let dein manage dein
  call dein#add('/home/aia/.cache/dein/repos/github.com/Shougo/dein.vim')

  call dein#add('frankier/neovim-colors-solarized-truecolor-only')
  call dein#add('itchyny/lightline.vim')
  call dein#add('junegunn/fzf', {'build': './install --all' })
  call dein#add('junegunn/fzf.vim')
  call dein#add('junegunn/seoul256.vim')
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('sbdchd/neoformat')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('w0rp/ale')
  call dein#add('zchee/deoplete-jedi')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" if dein#check_install()
"   call dein#install()
" endif

" ----- Editing files and buffers -----

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


" ----- window -----

set number
set showcmd
set textwidth=79
set linebreak
set colorcolumn=80
set cursorline
set scrolloff=8
set laststatus=2
set list lcs=trail:·

" trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

set splitbelow
set splitright

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" terminal
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


" ----- indentation -----

set autoindent
set smartindent
set expandtab
" set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2

au BufRead,BufNewFile *.py set ts=4 sts=4 sw=4

autocmd FileType make setlocal nolist noexpandtab

autocmd FileType dockerfile setlocal nolist noexpandtab

autocmd BufNewFile,Bufread *.s set ft=asm
autocmd FileType asm setlocal nolist noexpandtab


" ----- fzf -----

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

nnoremap <silent> ,t :Files<CR>
nnoremap <silent> ,b :Buffers<cr>
nnoremap <silent> ,r :Tags<cr>

let g:fzf_tags_command = 'ctags -R'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


" ----- searching -----

set ignorecase
set smartcase
set incsearch


" ----- appearance -----

set termguicolors
set bg=light
colo solarized
" let g:seoul256_background=236
" colo seoul256

let g:lightline = {
  \'colorscheme': 'solarized',
  \'active': {'left': [['paste'], ['readonly', 'filename', 'modified']]},
  \'separator': { 'left': '', 'right': '' },
  \'subseparator': { 'left': '', 'right': '' }
  \}
"
" ----- formatting and linting -----

let g:neoformat_enabled_python=['yapf']
let g:neoformat_enabled_c=['clangformat']
let g:neoformat_enabled_cpp=['clangformat']

let g:neoformat_c_clangformat = {
  \'exe': 'clang-format',
  \'args': ['-style="{
    \ AllowShortFunctionsOnASingleLine: Empty,
    \ AllowShortIfStatementsOnASingleLine: false,
    \ AllowShortLoopsOnASingleLine: false,
    \ BasedOnStyle: Google,
    \ BreakBeforeBraces: Allman,
    \ ColumnLimit: 80
  \ }"'],
  \'stdin': 1
\}

let g:neoformat_cpp_clangformat = {
  \'exe': 'clang-format',
  \'args': ['-style="{
    \ AllowShortFunctionsOnASingleLine: Empty,
    \ AllowShortIfStatementsOnASingleLine: false,
    \ AllowShortLoopsOnASingleLine: false,
    \ BasedOnStyle: Google,
    \ BreakBeforeBraces: Allman,
    \ ColumnLimit: 80
  \ }"'],
  \'stdin': 1
\}


augroup fmt
    autocmd!
    autocmd BufWritePre * Neoformat
augroup END

let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0
let g:ale_echo_cursor=0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" let g:ale_open_list=1

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

let g:ale_linters = {
  \'python': ['flake8'],
  \'c': [],
  \'cpp': []
\}


" ----- deoplete -----

let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1

" use TAB to manually autocomplete with deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


