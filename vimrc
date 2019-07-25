"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
let g:powerline_pycmd="py3"

" set terminal colors to 256 bits
set t_Co=256

" set colorscheme
colorscheme default

" set a dark background
set background=dark

" enumerate lines
set nu

" always show status bar
set laststatus=2

" use wildmenu
set wildmenu

" use autoindent
set autoindent

" using dark background
set background=dark

" no beeps
set noerrorbells
set novisualbell

" smart tabs
set smarttab

" space instead of tabs
set expandtab

" 1 tab = 2 spaces
set shiftwidth=2
set tabstop=2

" highlight search results
set hlsearch

" set incremental search
set is

" show matching brackets, parenthesys, etc
set showmatch

" enable syntax highlighting
syntax enable

" set utf-8 encoding
set encoding=utf-8

" turn off search highlighting
nnoremap <leader><space> :nohl<CR>

" toggle between number and relative number
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

call plug#end()
