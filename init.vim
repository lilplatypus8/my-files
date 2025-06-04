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
set tabstop=2

" Set width for autoindents
set shiftwidth=4

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
		Plug 'nvim-lua/plenary.nvim'		"Allows telescope to function (somehow)
		Plug 'nvim-telescope/telescope.nvim'		"Fuzzy file finder
		Plug 'dense-analysis/ale'		"Linter
		Plug 'preservim/nerdtree'		"File explorer
		Plug 'mhinz/vim-startify'		"Start-up shell
		Plug 'rebelot/kanagawa.nvim'		"Theme based off of hokusai wave
		Plug 'lewis6991/gitsigns.nvim'		"Shows git changes in file
		Plug 'windwp/nvim-autopairs'		"Creates double paranthese/brackets
		Plug 'folke/which-key.nvim'		"Command finder
		Plug 'numToStr/Comment.nvim'		"Comment manager
		Plug 'nvim-treesitter/nvim-treesitter'		"Syntax manager
		Plug 'echasnovski/mini.icons'		"Mini glyphs
		Plug 'nvim-tree/nvim-web-devicons'		"Nerd Font icons
		Plug 'stevearc/conform.nvim'		"File Formatter
		Plug 'BurntSushi/ripgrep'		"Grep engine
		Plug 'sharkdp/fd'		" File Finder
call plug#end()

" ------------------------------------------------
lua << EOF
require("nvim-autopairs").setup()
require('mini.icons').setup()
require("conform").setup({
		format_on_save = {
				lsp_fallback = true,
		},
		formatters_by_ft = {
				sh = {"beautysh"},
		},
		formatters = {
				beautysh = {
						command = "beautysh",
						args = {"-"},
						stdin = true,
				},
		},
})
EOF

colorscheme kanagawa-wave

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

let NERDTreeShowHidden=1

" KEYBINDINGS
" ------------------------------------------------
" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap kj <Esc>
:inoremap jk <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" Optional keybind to open file finder
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
