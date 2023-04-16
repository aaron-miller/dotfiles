" Start vim-plug plugin declaration
call plug#begin()

" General Plugins
Plug 'tpope/vim-fugitive'   " Git from inside vim
Plug 'tpope/vim-rhubarb'    " Adds GitHub support to all of fugitive's functions
Plug 'tpope/vim-commentary' " bindings for controlling comments
Plug 'tpope/vim-repeat'     " make . repeat everything
Plug 'tpope/vim-surround'   " bindings for changing chars that surround '',(),etc.
Plug 'tpope/vim-eunuch'     " :Delete, :Move, :Rename, :Chmod files in vim (and more!)

Plug 'ackyshake/VimCompletesMe'

" Colorschemes
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

" save undo trees in files
set undofile
set undodir=~/.vim/undo

" number of undo saved
set undolevels=10000 

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>
noremap <Leader>gr :GRemove<CR>

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" session management - TODO: Use vim's session management instead
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

