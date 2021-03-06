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

autocmd VimEnter * wincmd p
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
let NERDTreeIgnore = ['\.pyc$']

syntax enable
set background=dark
colorscheme material

" A function that allows you to see the names of syntax groups under your cursor
"function! SyntaxItem()
"  return synIDattr(synID(line("."),col("."),1),"name")
"endfunction
"set statusline+=%{SyntaxItem()}

let g:airline_powerline_fonts = 1
let g:airline_theme = "hybrid"
let g:airline_section_y = '%{(&fenc == "" ? &enc : &fenc)}'
let g:airline_section_z = '%{substitute(getcwd(), expand("$HOME"), "~", "g")}'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '│'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

let g:jsx_ext_required = 0

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

nnoremap <D-F> *<S-n>ye:Ag <C-r>"<CR>
command! -nargs=1 Gri Grep -ErinI --exclude-dir=log --exclude-dir=tmp --exclude-dir=coverage --exclude-dir=.git <args> .
command! -nargs=1 Gr Grep -ErnI --exclude-dir=log --exclude-dir=tmp --exclude-dir=coverage --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=saved_state --exclude-dir=Electron.app <args> .
command! -nargs=1 Grc Grep -ErinI --include=\*.coffee --exclude-dir=log --exclude-dir=tmp --exclude-dir=coverage --exclude-dir=.git <args> .
command! -nargs=1 Grr Grep -ErinI --include=\*.rb --exclude-dir=log --exclude-dir=tmp --exclude-dir=coverage --exclude-dir=.git <args> .

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

command C %w !pbcopy
command D :1,$d
command V :vert belowright sb

