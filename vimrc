" Use Vim settings/features
set nocompatible
set encoding=utf-8

" Enable matchit
runtime macros/matchit.vim

" Source vundle
exe 'source' expand('<sfile>:h') . '/.vim/config/vundle.vim'

" Turn off modeline; vulnerability
set modelines=0
set nomodeline
set noshowmode

" Source GUI configuration
exe 'source' expand('<sfile>:h') . '/.vim/config/gui.vim'


" Backspacing over anything in insert mode
set backspace=indent,eol,start


" More history
set history=50
" Show the cursor position
set ruler
" Show commands in bottom as I type
set showcmd
" Show search results as I type
set incsearch
" Hide status when using powerline
" set noshowmode

" Tabs the way I like them
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Show number lines
set number

" Keep a backup
set backup

" Set backup/swap/undo file directory, and avoid collisions.
set directory=~/.vim-tmp//,/var/tmp//,/tmp//,.
set backupdir=~/.vim-tmp//,/var/tmp//,/tmp//,.
set undodir=~/.vim-tmp//,/var/tmp//,/tmp//,.
set timeoutlen=300

" Smart case detection, global default
set ignorecase
set smartcase
set gdefault

" More intuitive splitting
set splitbelow
set splitright

" Code folding
set foldmethod=manual
set nofoldenable

" We always want the status line
set laststatus=2

" Disable selection mode. Who cares that I used the mouse?
set selectmode=""

" Autocomplete for menu
set wildmenu
set wildmode=longest,list

" Configure autocomplete
" set completeopt=longest,menuone
set shortmess+=c

" Let there be trailing whitespace!
set list
set listchars=tab:»-,trail:~,eol:¬

" Use system clipboard
" This will clear the system clipboard,
" which is not always desirable.
" set clipboard=unnamed
" Preferable to just use "* prefix

" Fix memory leak issue
autocmd BufWinLeave * call clearmatches()

" 3 line margin around cursor
set scrolloff=2

" Don't blink the cursor
set guicursor+=a:blinkon0

" I want to see where my cursor is
set cursorline
" set cursorcolumn
au WinLeave,InsertEnter * set nocursorline
au WinEnter,InsertLeave * set cursorline

" Use absolute lines on focus leave
au FocusLost * set number


" For all text files set 'textwidth' to 78 characters.
" autocmd FileType text setlocal textwidth=78

" Local config
if filereadable(".vimrc.local")
	source .vimrc.local
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" Always set autoindenting on
" set autoindent


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
			\ | wincmd p | diffthis
endif

" Use Ag instead of Grep
if executable("ag")
	set grepprg=ag\ --nogroup\ --nocolor
endif

" NERDTree configs
" autocmd vimenter * if !argc() | NERDTree | endif
" Usually if I'm using vim, I'm editing one file
if !argc()
	let g:nerdtree_tabs_open_on_console_startup=1
endif

" Allow single click for NERDTree, but use double-click for files
let NERDTreeMouseMode=2
let NERDTreeChDirMode=2

" Store bookmarks in .vim/
let NERDTreeBookmarksFile="~/.vim/.bookmarks"

" Exit insert mode if scrolling or focus lost
" au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")
xnoremap <ScrollWheelUp> <esc><ScrollWheelUp>
xnoremap <ScrollWheelDown> <esc><ScrollWheelDown>


" Sessions
let g:session_directory='./'
let g:session_extension='.vis'
let g:session_autoload='yes'
let g:session_autosave='no'

" Indent guides
let g:indent_guides_enable_on_vim_startup=0 "enable on startup
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_theme = 'material'

" Switch
let g:switch_mapping = '-'

" Pandoc
let g:pandoc#keyboard#display_motions = 0
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ['diff', 'css', 'html', 'json', 'javascript', 'ruby']

" let g:pandoc#syntax#conceal#use = 0

" Source custom highlights
exe 'source' expand('<sfile>:h') . '/.vim/config/highlights.vim'

" Source file types
exe 'source' expand('<sfile>:h') . '/.vim/config/filetypes.vim'

" Source helpers for tab2space
exe 'source' expand('<sfile>:h') . '/.vim/config/tabbing.vim'

" Source key mappings
exe 'source' expand('<sfile>:h') . '/.vim/config/maps.vim'
