" Use Vim settings/features
set nocompatible
set encoding=utf-8

" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'


""""" BUNDLES """""
Bundle 'mileszs/ack.vim'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'godlygeek/tabular'
Bundle 'Raimondi/delimitMate'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'mikewest/vimroom'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Beakr/sunset-vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'skwp/vim-ruby-conque'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'vim-ruby/vim-ruby'
Bundle 'nybblr/vim-session'
Bundle 'nybblr/vim-nerdtree-tabs'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'tristen/vim-sparkup'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'nybblr/vim-powerline'
Bundle 'fs111/pydoc.vim'
Bundle 'sontek/rope-vim'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/MatlabFilesEdition'
Bundle 'sjl/splice.vim'


filetype plugin indent on




" Turn off modeline; vulnerability
set modelines=0
set nomodeline

if has("gui_running")
	colorscheme solarized
	set background=light

	" colorscheme railscasts
	set guioptions-=R
	set guioptions-=r
	set guioptions-=L
	set guioptions-=l
	set guioptions-=T

	" set guifont=Menlo,12
	set guifont=Source\ Code\ Pro\ for\ Powerline:h13

	set macmeta

	" Turn off irritating balloons
	set noballooneval
endif


if has("gui_macvim")
	let macvim_hig_shift_movement = 1
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	" filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
	au!

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

	augroup END

else

	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
			\ | wincmd p | diffthis
endif

set tabstop=2
set shiftwidth=2
set noexpandtab
set nu

" Set backup/swap/undo file directory, and avoid collisions.
set directory=~/.vim-tmp//,/var/tmp//,/tmp//,.
set backupdir=~/.vim-tmp//,/var/tmp//,/tmp//,.
set undodir=~/.vim-tmp//,/var/tmp//,/tmp//,.

autocmd User Rails set noexpandtab

" autocmd vimenter * if !argc() | NERDTree | endif

set timeoutlen=300

" Allow single click for NERDTree, but use double-click for files
let NERDTreeMouseMode=2
let NERDTreeChDirMode=2

" Detect if a tab was closed, and ensure that height of main window fills the screen (100% height)
au TabEnter * let &lines=200

" Exit insert mode if scrolling or focus lost
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")
xnoremap <ScrollWheelUp> <esc><ScrollWheelUp>
xnoremap <ScrollWheelDown> <esc><ScrollWheelDown>

" Clear search results on esc
nnoremap <esc> :noh<cr><esc>

" Code folding
set foldmethod=manual
set nofoldenable

" Fancy status lines
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarizedDevin'
let g:Powerline_theme='devin'
set laststatus=2 " always show status line

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


" Paste mode toggle for CLI version
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


" Control-s functionality for quick save
" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>

imap <c-s> <c-o><c-s>


" No more stretching for navigating files
noremap h ;
noremap j h
noremap k gj
noremap l gk
noremap ; l

" Quick window switching
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" More convenient leader
let mapleader=","

" Jumplist tab!
nmap <s-tab> <c-o>

" Autocomplete shortcut
" Remap code completion to Ctrl+Space {{{2
" inoremap <Nul> <C-x><C-o>
inoremap <expr> <leader>, pumvisible() \|\| &omnifunc == '' ?
			\ "\<lt>C-n>" :
			\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
			\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
			\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <Nul>

" Add lines without entering insert mode
map <S-Enter> O<Esc>k
map <CR> o<Esc>l

" More intuitive undo
map U :redo<cr>

" Retain selection after indent
vnoremap > >gv
vnoremap < <gv

" Tab mappings
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tx :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>to <Plug>TaskList

" Quick command mode trigger
nmap <space> :

" Super quick escape in insert mode
" Somewhat inconsistent behavior though
" imap jj <esc>

" For mac users (using the 'apple' key)
map <D-]> gt
map <D-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<cr>

map <leader>nt :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <leader>rc :edit ~/.vimrc<cr>
map <leader>rv :so $MYVIMRC<cr>
map <leader>rt :RetabIndent<cr>
map <leader>qq :qall<cr>
map <leader>e :SyntasticCheck<cr>
map <leader>tt :TagbarToggle<cr>
map <leader>vr :VimroomToggle<cr>

" Nice quick fullscreen like iTerm2!
" macmenu &Edit.Find.Find\.\.\. key=<nop>
map <D-Enter> :set invfu<CR>

nmap <leader>ac :Tabularize /,<cr>
vmap <leader>ac :Tabularize /,<cr>
nmap <leader>ap :Tabularize /\|<cr>
vmap <leader>ap :Tabularize /\|<cr>
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
nmap <leader>ag :Tabularize /=><CR>
vmap <leader>ag :Tabularize /=><CR>

map <leader>sv :ConqueTermVSplit zsh<cr>
map <leader>sh :ConqueTermSplit zsh<cr>
map <leader>sn :ConqueTermTab zsh<cr>

map <leader>sw :%s/\s\+$<cr>

map <leader>ts :Tab2Space<cr>
map <leader>st :Space2Tab<cr>

map <leader>c :TComment<cr>
map <leader>cc :TCommentInline<cr>

map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gl :Glog<CR>
map <leader>gc :Gcommit<CR>
map <leader>gp :Git push<CR>

" Sessions keymaps
nnoremap <leader>ss :SaveSession<cr>
nnoremap <leader>ls :OpenSession<cr>

" Quick theme changing
map <leader>cd :colorscheme railscasts<cr>
map <leader>cl :colorscheme solarized \| set background=light<cr>
map <leader>cb :set guifont=Source\ Code\ Pro:h13<cr>
map <leader>cs :set guifont=Menlo,12<cr>

" Show extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Convert tabs to spaces, vice versa
" command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
" command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
	let spccol = repeat(' ', a:cols)
	let result = substitute(a:indent, spccol, '\t', 'g')
	let result = substitute(result, ' \+\ze\t', '', 'g')
	if a:what == 1
		let result = substitute(result, '\t', spccol, 'g')
	endif
	return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
	let savepos = getpos('.')
	let cols = empty(a:cols) ? &tabstop : a:cols
	execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
	call histdel('search', -1)
	call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)
