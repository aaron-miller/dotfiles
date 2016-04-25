" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Start Vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin 'VundleVim/Vundle.vim'

"
" Misc
"
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'ervandew/supertab.git'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'airblade/vim-rooter'
Plugin 'miyakogi/conoline.vim'

"
" Snippets
"
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"
" Colorschemes
"
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

"
" Puppet
"
Plugin 'rodjek/vim-puppet'
Plugin 'markcornick/vim-vagrant'

"
" Python
"
Plugin 'nvie/vim-flake8'

"
" JVM
"
Plugin 'tfnico/vim-gradle'
Plugin 'derekwyatt/vim-scala'

call vundle#end()

" Set colorscheme to solarized
colorscheme solarized

" Set the background to dark
set background=dark

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = ","

" Security
set modelines=0

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

" Enable line highlighting
let g:conoline_auto_enable = 1

let g:conoline_use_colorscheme_default_normal=1
