" Start vim-plug plugin declaration
call plug#begin()

" General Plugins
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug 'ackyshake/VimCompletesMe'
Plug 'ludovicchabant/vim-gutentags'

" Colorschemes
Plug 'junegunn/seoul256.vim'
Plug 'vim-scripts/twilight256.vim'
Plug 'jaredgorski/spacecamp'
Plug 'aonemd/kuroi.vim'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'

call plug#end()

" Don't try to be vi compatible
set nocompatible

" Enable lazy redraw so macros are cooler
set lazyredraw

" Turn on syntax highlighting
syntax on

" Set colorscheme
set background=dark
colorscheme kuroi

let mapleader = ","

" Make the cursor blink less for the love of God
set guicursor=n:blinkwait700-blinkon700-blinkoff350

" Show line numbers
set number

" Show file stats
set ruler

" Disable beep and flash
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Set Ctrl + P to use fzf
nmap <C-P> :FZF<CR>

" save undo trees in files
set undofile
set undodir=~/.vim/undo

" number of undo saved
set undolevels=10000 
