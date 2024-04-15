" This file needs vim-plug to be installed!
" Install plugins using :PlugInstall

call plug#begin()
	Plug 'ryanoasis/vim-devicons'
	Plug 'dracula/vim'
	Plug 'preservim/vim-markdown'
call plug#end()

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
:set nofoldenable		" Disable automatic code-folding alltogether (as it hinders me more than it helps).
:set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
:set list
:set clipboard+=unnamedplus

au ColorScheme * hi Normal ctermbg=None
:colorscheme dracula
