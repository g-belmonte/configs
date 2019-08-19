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
colorscheme industry
set background=dark
let g:airline_theme='badwolf'

" no beeps
set noerrorbells
set novisualbell

" use autoindent
set autoindent
set smartindent

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
" remap <Leader> to <Space>
let mapleader=" "

" fzf
nmap <Leader>f :Files<CR>

" ripgrep
nmap <Leader>r :Rg<CR>

" toggle relative line numbering
nmap <Leader>n :set relativenumber!<CR>

" turn highlighting off
nmap <Leader>h :nohl<CR>

" toggle UndoTree
nmap <Leader>u :UndotreeToggle<CR>

" change buffer
nmap <Leader>bp :bp<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bf :bf<CR>
nmap <Leader>bl :bl<CR>
nmap <Leader>bs :b#<CR>
nmap <Leader>bb :ls<CR>

" Copy to X CLIPBOARD                                                                                                                                     
map <leader>yb :w !xsel -i -b<CR>
map <leader>yp :w !xsel -i -p<CR>
map <leader>ys :w !xsel -i -s<CR>
" Paste from X CLIPBOARD
map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>
map <leader>pb :r!xsel -b<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Plug
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-dadbod'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
"Plug 'Valloric/YouCompleteMe', {'do': 'python3 install.py --clang-completer --go-completer --ts-completer'}
Plug 'mbbill/undotree'
Plug 'vim-syntastic/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'

" language specific
Plug 'elixir-editors/vim-elixir'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = 'full'

