" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" middle-click paste
set mouse=v

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Show line numbers
set number

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set tab width to 4 columns.
set tabstop=4

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Use highlighting when doing a search.
set hlsearch

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like Bash completion
set wildmode=list:longest


" PLUGINS
" ------------------------------------------------
call plug#begin()
 " Plugin Section
    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'mhinz/vim-startify'
    Plug 'rebelot/kanagawa.nvim'
call plug#end()
" ------------------------------------------------

colorscheme kanagawa-wave

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

let NERDTreeShowHidden=1
