" More convenient leader
let mapleader=","
let maplocalleader=",,"


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <c-u> <c-g>u<c-u>


" Control-s functionality for quick save
" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
" nnoremap <silent> <C-S> :if expand("%") == ""<cr>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
" imap <c-s> <c-o><c-s>
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
													 \|  if empty(bufname('%'))
													 \|    browse confirm write
													 \|  else
													 \|    confirm write
													 \|  endif
													 \|endif
" nnoremap <silent> <c-s> :<c-u>Update<cr>
inoremap <c-s> <c-o>:Update<cr>
" imap <c-s> <c-o><c-s>


" Paste mode toggle for CLI version
nnoremap <f2> :set invpaste paste?<cr>
set pastetoggle=<f2>
set showmode


" No more stretching for navigating files
noremap h ;
noremap j h
noremap k gj
noremap l gk
noremap ; l

" Arrow keys from home row
" In all modes!
inoremap <a-j> <left>
noremap  <a-j> <left>
inoremap <a-k> <down>
noremap  <a-k> <down>
inoremap <a-l> <up>
noremap  <a-l> <up>
inoremap <a-;> <right>
noremap  <a-;> <right>

" And disable regular arrow keys
inoremap  <up>     <nop>
inoremap  <down>   <nop>
inoremap  <left>   <nop>
inoremap  <right>  <nop>
noremap   <up>     <nop>
noremap   <down>   <nop>
noremap   <left>   <nop>
noremap   <right>  <nop>

" Quick window switching
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-k> :wincmd k<cr>
nmap <silent> <c-l> :wincmd l<cr>

" Easy split resizing
map  <silent> <D-\|> <c-w><bar>
imap <silent> <D-\|> <esc><c-w><bar>i
map  <silent> <D-_> <c-w>_
imap <silent> <D-_> <esc><c-w>_i
map  <silent> <D-=> <c-w>=
imap <silent> <D-=> <esc><c-w>=i


" Jumplist tab with shift-tab
nmap <s-tab> <c-o>

" Add lines without entering insert mode
map <s-cr> mZO<esc>`Z
map <cr> mZo<esc>`Z

" More intuitive undo
map U :redo<cr>

" Retain selection after indent
vnoremap > >gv
vnoremap < <gv

" Sane Regex
nnoremap / /\v
vnoremap / /\v

" Tab mappings
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tx :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>to <plug>TaskList

" Quick command mode trigger
nmap <space> :
vmap <space> :

" Easy to reach esc
" nmap <space> <esc>
" vmap <space> <esc>

" Super quick escape in insert mode
" Somewhat inconsistent behavior though
imap jj <esc>
imap ;; <esc>

" Quick switching
nnoremap - :Switch<cr>

" For mac users (using the 'apple' key)
map <D-]> <C-w>w
map <D-[> <C-w>W
map <D-}> gt
map <D-{> gT
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
imap <D-]> <esc><C-w>w
imap <D-[> <esc><C-w>W
imap <D-}> <esc>gt
imap <D-{> <esc>gT
imap <D-1> <esc>1gt
imap <D-2> <esc>2gt
imap <D-3> <esc>3gt
imap <D-4> <esc>4gt
imap <D-5> <esc>5gt
imap <D-6> <esc>6gt
imap <D-7> <esc>7gt
imap <D-8> <esc>8gt
imap <D-9> <esc>9gt
imap <D-0> <esc>:tablast<cr>

" Jump to start/end of line
map  <D-j> ^
imap <D-j> <esc>^i
map  <D-;> $
imap <D-;> <esc>$a

" Scroll mappings (mvim disabled in gvimrc)
map  <silent> <D-k> <c-e>
imap <silent> <D-k> <esc><c-e>a
map  <silent> <D-l> <c-y>
imap <silent> <D-l> <esc><c-y>a

map <leader>nt :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <leader>rc :edit ~/.vimrc<cr>
map <leader>rv :so $MYVIMRC <bar> so ~/.gvimrc<cr>

" Quick easy exits
map <leader>qq :qall<cr>
map <leader>qq1 :qall!<cr>
map <leader>q1 :q!<cr>

map <leader>e :SyntasticCheck<cr>
map <leader>tt :TagbarToggle<cr>
map <leader>vr :VimroomToggle<cr>

" Nice quick fullscreen like iTerm2!
" macmenu &Edit.Find.Find\.\.\. key=<nop>
map <D-Enter> :set invfu<cr>

nmap <leader>ac :Tabularize /,<cr>
vmap <leader>ac :Tabularize /,<cr>
nmap <leader>ap :Tabularize /\|<cr>
vmap <leader>ap :Tabularize /\|<cr>
nmap <leader>a= :Tabularize /=<cr>
vmap <leader>a= :Tabularize /=<cr>
nmap <leader>ah :Tabularize /#<cr>
vmap <leader>ah :Tabularize /#<cr>
nmap <leader>a: :Tabularize /:\zs<cr>
vmap <leader>a: :Tabularize /:\zs<cr>
nmap <leader>ag :Tabularize /=><cr>
vmap <leader>ag :Tabularize /=><cr>

" Quickly clear highlighting
nmap <silent> ch :noh<cr>

" Move text to next line, ditching whitespace, and vice versa!
nnoremap <silent> gs i<cr><esc>k$:s/\s\+$//e <bar> noh<cr>j^
nnoremap <silent> gS mZj:s/^\s\+//e <bar> noh<cr>^yg_kA <esc>pjdd`Z

" Convert to unix file
nmap <leader>ff :set ff=unix<cr>

map <leader>sv :ConqueTermVSplit zsh<cr>
map <leader>sh :ConqueTermSplit zsh<cr>
map <leader>sn :ConqueTermTab zsh<cr>

map <leader>sw :%s/\s\+$// \| noh<cr>

map <leader>rt :RetabIndent<cr>
map <leader>et :set noexpandtab <bar> Space2Tab<cr>
map <leader>dt :set expandtab <bar> Tab2Space<cr>
" map <leader>st :Space2Tab<cr>
" map <leader>ts :Tab2Space<cr>

map <leader>c :TComment<cr>
map <leader>cc :TCommentInline<cr>

" Fugitive mappings
map <leader>gb :Gblame<cr>
map <leader>gs :Gstatus<cr>
map <leader>gd :Gdiff<cr>
map <leader>gl :Glog<cr>
map <leader>gc :Gcommit<cr>
map <leader>gp :Git push<cr>

" Sessions keymaps
nnoremap <leader>ss :SaveSession<cr>
nnoremap <leader>ls :OpenSession<cr>

" Quick theme changing
" map <leader>cd :colorscheme railscasts<cr>
" map <leader>cl :colorscheme solarized \| set background=light<cr>
map <leader>cb :set guifont=Source\ Code\ Pro:h13<cr>
map <leader>cs :set guifont=Menlo,12<cr>

" Relative line numbers
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc
nnoremap <c-n> :call NumberToggle()<cr>

" Vertical column in ^V mode
" noremap <silent> <c-v> :set cursorcolumn<cr><c-v>
" au InsertLeave * set nocursorcolumn

function! ScreencastReady()
	" Approx 16:9 ratio
	set guifont=Source\ Code\ Pro\ for\ Powerline:h27
	set lines=15 columns=59
endfunction

nnoremap <D-H> :call ScreencastReady()<CR>

let s:hidden_all = 0
function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		set noshowmode
		set noruler
		set nolist
		set signcolumn=no
		set laststatus=0
		set noshowcmd
		set showtabline=0
	else
		let s:hidden_all = 0
		set showmode
		set ruler
		set list
		set signcolumn=auto
		set laststatus=2
		set showcmd
		set showtabline=2
	endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>

" function! InsertTabWrapper()
" 	let col = col('.') - 1
" 	if !col || getline('.')[col - 1] !~ '\k'
" 		return "\<tab>"
" 	else
" 		return "\<c-n>"
" 	endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <expr> <tab> InsertTabWrapper()
" inoremap <s-tab> <c-p>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

autocmd FileType ruby nmap <buffer> <D-e> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <D-e> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <D-e> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <D-r> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <D-r> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <D-r> <Plug>(xmpfilter-run)
