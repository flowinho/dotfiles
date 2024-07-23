" This file needs vim-plug to be installed!
" Install plugins using :PlugInstall

call plug#begin()
	Plug 'ryanoasis/vim-devicons'							" Display nice icons inside vim and it's plugins, needs a NerdFont to be installed.
	Plug 'dracula/vim'										" Dracula color theme for vim.
	Plug 'preservim/vim-markdown'							" Syntax Highlighting Support for Markdown.
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }		" FZF Plugin to quickly navigate through files with :Files
	Plug 'junegunn/fzf.vim'									" See line above
	Plug 'preservim/nerdtree'								" Sidebar to show directory contents
	Plug 'vim-airline/vim-airline'							" Fancier statusline that diplays more information
	Plug 'vim-airline/vim-airline-themes'					" Theme Repo for Airline to be able to use dracula theme
	Plug 'Xuyuanp/nerdtree-git-plugin'						" Show changed files in Nerdtree
	Plug 'airblade/vim-gitgutter'							" Show per-line-changes in current open file.
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

" Configure NerdTree
autocmd VimEnter * NERDTree	" Open Nerdtree when opening vim

" Toggle Nerdtree when pressing F2
map <F2> :NERDTreeToggle<CR>	
let NERDTreeWinSize=48				" NerdTree Window width
let NERDTreeWinPos="left"			" Position NerdTree on the left side
let NERDTreeShowHidden=1			" Configures NerdTree to show hidden files
let NERDTreeAutoDeleteBuffer=1

" Configure Airline
:let g:airline_theme='dracula'		" Set Airline Theme to Dracula
let g:airline_powerline_fonts = 1	" Tell Airline to use powerline fonts to support dev-icons

au ColorScheme * hi Normal ctermbg=None	" Reset NVIM color-theme to prepare for dracula
:colorscheme dracula					" Set Dracula as color scheme for nvim
