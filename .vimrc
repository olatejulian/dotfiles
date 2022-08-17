"" www.github.com/olatejulian

" Vanilla Vim Settings
set nu!
set autoindent
set incsearch
set wildmenu
set laststatus=2
set confirm
set mouse=a
set title
set splitbelow

" " Dracula Theme
" packadd! dracula
" syntax enable
" " colorscheme dracula

" " Plugin (vim-plug as plugin manager)
" call plug#begin('~/.vim/plugged')

" "PLug 'itchyny/lightline.vim'
" "Plug 'preservim/nerdtree' |
" 			\ Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'codota/tabnine-vim'
" Plug 'vim-syntastic/syntastic'
" Plug 'frazrepo/vim-rainbow'
" Plug 'vim-airline/vim-airline'
" Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'lervag/vimtex'
" Plug 'sheerun/vim-polyglot'
" Plug 'francoiscabrol/ranger.vim'

" call plug#end()

" Airline Settings
let g:airline_theme='dracula'

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
"
" Latex and Vimtex Settings
"" for auto-compile saved tex files
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1" | redraw!
"

" Ranger Plugin Settings
let g:ranger_open_newtab = 1
let g:ranger_replace_netrw = 1
"

" NERDTree Settings
"" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

"" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr(&/'$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"\ quit | endif
