let g:powerline_pycmd="py3"

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

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" highlight search results
set hlsearch

" show matching brackets, parenthesys, etc
set showmatch

" enable syntax highlighting
syntax enable

"set utf-8 encoding
set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

call plug#end()
