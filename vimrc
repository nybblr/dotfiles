" Use Vim settings/features
set nocompatible
set encoding=utf-8

" Source vundle
exe 'source' expand('<sfile>:h') . '/.vim/config/vundle.vim'

" Turn off modeline; vulnerability
set modelines=0
set nomodeline

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

" Tabs the way I like them
set tabstop=2
set shiftwidth=2
set noexpandtab

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


" Code folding
set foldmethod=manual
set nofoldenable

" We always want the status line
set laststatus=2

" Disable selection mode. Who cares that I used the mouse?
set selectmode=""


" For all text files set 'textwidth' to 78 characters.
" autocmd FileType text setlocal textwidth=78

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


" autocmd User Rails set noexpandtab

" autocmd vimenter * if !argc() | NERDTree | endif


" Allow single click for NERDTree, but use double-click for files
let NERDTreeMouseMode=2
let NERDTreeChDirMode=2

" Store bookmarks in .vim/
let NERDTreeBookmarksFile="~/.vim/.bookmarks"

" Detect if a tab was closed, and ensure that height of main window fills the screen (100% height)
au TabEnter * let &lines=200

" Exit insert mode if scrolling or focus lost
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")
xnoremap <ScrollWheelUp> <esc><ScrollWheelUp>
xnoremap <ScrollWheelDown> <esc><ScrollWheelDown>


" Fancy status lines
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarizedDevin'
let g:Powerline_theme='devin'

" Sessions
let g:session_directory='./'
let g:session_autoload='yes'
let g:session_autosave='yes'

" vim-session autoload isn't working?!
" Remove once it is fixed!
function! RestoreSession()
	if argc() == 0 && filereadable(g:session_directory . "default.vim") " vim called without arguments
		execute 'OpenSession'
	end
endfunction
au VimEnter * nested :call RestoreSession()


" Source whitespace highlighter
exe 'source' expand('<sfile>:h') . '/.vim/config/strip.vim'

" Source helpers for tab2space
exe 'source' expand('<sfile>:h') . '/.vim/config/tabbing.vim'

" Source key mappings
exe 'source' expand('<sfile>:h') . '/.vim/config/maps.vim'
