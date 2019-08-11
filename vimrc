""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax enable

" I'm using a dark background
set background=dark

" no beeps
set noerrorbells
set novisualbell

" use autoindent
set autoindent

" spaces instead of tabs
set expandtab

" 1 tab means 4 spaces
set shiftwidth=2
set tabstop=2

" smart tabs
set smarttab

" fancy menu
set wildmenu

" enumerate lines
set number

" highlight search results
set hlsearch

" incremental search (highlights everything that matches a search)
set incsearch

" show matching brackets, parenthesis, ...
set showmatch

" set utf-8 encoding
set encoding=utf-8

" ignore case on search
"set ignorecase

" if ignorecase is on, show first what matches case, then show ignoring case
"set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
nmap <C-t> :Files<CR>

" ripgrep
nmap <C-r> :Rg<CR>

" toggle relative line numbering
nmap <C-n> :set relativenumber!<CR>

" turn highlighting off
nmap <C-c> :nohl<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Plug
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'full'

