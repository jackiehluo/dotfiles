set nocompatible

set number
set cursorline
set showcmd
set showmode
set autoread
set hidden
set backspace=indent,eol,start
syntax on

set encoding=utf-8
set title
set clipboard=unnamed

set noswapfile
set nobackup
set nowb

execute pathogen#infect()

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
let NERDTreeIgnore = ['\.pyc$']

set background=dark
let g:solarized_visibility="low"
syntax enable
colorscheme solarized

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

set list listchars=trail:·

set wrap
set linebreak

set modeline
set modelines=5