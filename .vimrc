""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax enable

" show incomplete commands
set showcmd

" make buffers hidden by default
set hidden

" I'm using a dark background
set background=dark

" auto read when a file is changed from the outside
set autoread

" no beeps
set noerrorbells
set novisualbell

" use autoindent
set autoindent
set smartindent

" spaces instead of tabs
set expandtab

" 1 tab means 2 spaces
set shiftwidth=4
set tabstop=4

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
" remap <Leader> to <Space>
let mapleader=" "

" getting out of insert mode as in Spacemacs
imap jk <Esc>

" save file as in Spacemacs
map <Leader>fs :w<CR>

" search
nmap <Leader>. :Files<CR>
nmap <Leader>/ :Rg<CR>
nmap <Leader>, :ls<CR>

" toggle relative line numbering
nmap <Leader>tl :set relativenumber!<CR>

" turn highlighting off
nmap <Leader>th :nohl<CR>

" toggle UndoTree
nmap <Leader>tu :UndotreeToggle<CR>

" change buffer
nmap <Leader>bp :bp<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bs :b#<CR>
nmap <Leader>bb :ls<CR>

" set arrow keys to resize pane size
"nnoremap <LEFT>   <c-w><
"nnoremap <RIGHT>  <c-w>>
"nnoremap <UP>     <c-w>-
"nnoremap <DOWN>   <c-w>+

" some mapping for weird home/end behavior
map <Esc>OH 0
imap <Esc>OH <Esc>0i
cmap <Esc>OH <Esc>0
map <Esc>OF $
imap <Esc>OF <Esc>$a
cmap <Esc>OF <Esc>$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Plug
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug '~/.fzf'
"Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'

" language specific
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'mxw/vim-jsx', {'for': 'javascript'}

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'full'
