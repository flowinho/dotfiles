
"
" ▒█▀▀▀ █░░ █▀▀█ █▀▀█ ░▀░ █▀▀█ █▀▀▄ 　 ▒█▀▀▀█ █▀▀ █░░█ █░░█ ▀▀█▀▀ ▀▀█▀▀ █░█ █▀▀█ █░░░█ █▀▀ █░█ ░▀░ 
" ▒█▀▀▀ █░░ █░░█ █▄▄▀ ▀█▀ █▄▄█ █░░█ 　 ░▀▀▀▄▄ █░░ █▀▀█ █░░█ ░░█░░ ░░█░░ █▀▄ █░░█ █▄█▄█ ▀▀█ █▀▄ ▀█▀ 
" ▒█░░░ ▀▀▀ ▀▀▀▀ ▀░▀▀ ▀▀▀ ▀░░▀ ▀░░▀ 　 ▒█▄▄▄█ ▀▀▀ ▀░░▀ ░▀▀▀ ░░▀░░ ░░▀░░ ▀░▀ ▀▀▀▀ ░▀░▀░ ▀▀▀ ▀░▀ ▀▀▀
"
"                          Copyright 2023 Florian Schuttkowski, Licensed GPL3
"                    For additional information, visit https://github.com/flowinho
"
" ======================%%========================%%==========================%%=====================

" ---------------------------------------------------------------------
" Beginning the section of installed plugins using vim-plug,
" my plugin-manager of choice for neovim.
" https://github.com/junegunn/vim-plug
call plug#begin()

" Installation: Add a plug here, then execute :PlugInstall
" Removal: Remove the plug, then execute :PlugClean
"
Plug 'vim-airline/vim-airline'			" Displays a line with a bunch of information on the bottom.
Plug 'preservim/nerdtree'				" Sidebar with collapsable folders and files
Plug 'tpope/vim-commentary'				" For Commenting gcc & gc
Plug 'tpope/vim-surround'				" Surrounding ysw)
Plug 'ap/vim-css-color'					" CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes'	" Retro Scheme
Plug 'ryanoasis/vim-devicons'			" Developer Icons
Plug 'tc50cal/vim-terminal'				" Vim Terminal
Plug 'terryma/vim-multiple-cursors'		" CTRL + N for multiple cursors
Plug 'preservim/tagbar'					" Tagbar for code navigation
Plug 'dracula/vim'						" Best colortheme

call plug#end()
" End the section of installed plugins using vim-plug
" ---------------------------------------------------------------------

" -----------------------------------------------
" Begin definition of nvim general settings
:set number				" Display line numbers in front of the lines.
:set relativenumber		" Display relative line numbers for easier command usage, e.g. 6dd
:set ignorecase			" When searched in lowercase, search is case insensitive.
:set smartcase			" When searched in uppercase, search is case sensitive.
:set autoindent			" Enable auto-indentation
:set tabstop=4			" Convert tabs into four spaces
:set shiftwidth=4		" Convert shifting into four spaces
:set smarttab			" Try to align tabs
:set cursorline			" Display a horizontal line indicating the position of the cursor.
:set cursorcolumn		" Display a vertical line, indicationg the position of the cursor.
:set softtabstop=4		" Convert softtabs into four spaces.
:set mouse=a			" Enables selection using the mouse (if needed).
:set nobackup			" Disable swapfiles.
:set incsearch			" Enable search for next occurence of search term
:set hlsearch			" Highlight the string that is searched for.

au ColorScheme * hi Normal ctermbg=None		" Disable background color for all color-schemes
:colorscheme dracula						" Requires plugin


"---------------------------------------------
" Custom Keyboard Mapping Definitions
nmap <F8> :TagbarToggle<CR>				" Toggle Tagbar using F8
nnoremap <C-f> :NERDTreeFocus<CR>		" FocusNerdtree using CTRL + F
nnoremap <C-n> :NERDTree<CR>			" Open NerdTree using CTRL + N
nnoremap <C-t> :NERDTreeToggle<CR>		" Toggle NerdTree using CTRL + t

" -----------------------------
" Plugin specific settings
let NERDTreeShowHidden=1
