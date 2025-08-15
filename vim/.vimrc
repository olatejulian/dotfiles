" =========================
" General Settings
" =========================
set nocompatible                " Use Vim defaults, not Vi
set backspace=indent,eol,start  " Make backspace behave normally
set number                      " Show line numbers
set hidden                      " Allow buffer switching without saving
set mouse=a                     " Enable mouse support
set clipboard=unnamedplus       " Use system clipboard

" =========================
" Indentation & Tabs
" =========================
set tabstop=4                   " Number of visual spaces per tab
set shiftwidth=4                " Spaces for autoindent
set expandtab                   " Use spaces instead of tabs
set smartindent                 " Auto indent new lines
set autoindent                  " Copy indent from current line

" =========================
" Search
" =========================
set ignorecase                  " Case insensitive search...
set smartcase                   " ...unless uppercase used
set incsearch                   " Show matches as you type
set hlsearch                    " Highlight matches

" =========================
" UI Improvements
" =========================
syntax on                       " Enable syntax highlighting
set showcmd                     " Show typed command at bottom
set showmode                    " Show current mode
set ruler                       " Show cursor position
set wildmenu                    " Tab completion menu
set wildmode=longest:full,full
set title                       " Show file title in terminal titlebar

" =========================
" File Management
" =========================
set noswapfile                  " Don't create .swp files
set nobackup                    " Don't keep backup file
set nowritebackup               " Don't write backup before overwriting
set undofile                    " Persistent undo

" =========================
" Useful Keymaps
" =========================
let mapleader = " "

set pastetoggle=<F2>            " Toggle paste mode (avoids autoindent messing up paste)

" Quickly save with leader+s
nnoremap <leader>s :w<CR>

" Move between splits easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Searching
nnoremap <silent> <leader>h :nohlsearch<CR>

" Delete entire word with ctrl + backspace
inoremap <C-BS> <C-w>

" Move lines up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" =========================
" Notes / Writing Tweaks
" =========================
" Enable spellcheck for writing (you can toggle with <F3>)
set spelllang=en
nnoremap <F3> :setlocal spell!<CR>

" =========================
" Colors
" =========================
set t_Co=256
set background=dark

" colorscheme darkblue
" colorscheme default
" colorscheme delek
colorscheme desert
" colorscheme elflord
" colorscheme evening
" colorscheme habamax
" colorscheme industry
" colorscheme koehler
" colorscheme lunaperche
" colorscheme morning
" colorscheme murphy
" colorscheme pablo
" colorscheme peachpuff
" colorscheme quiet
" colorscheme retrobox
" colorscheme ron
" colorscheme shine
" colorscheme slate
" colorscheme sorbet
" colorscheme torte
" colorscheme unokai
" colorscheme wildcharm
" colorscheme zaibatsu
" colorscheme zellner

