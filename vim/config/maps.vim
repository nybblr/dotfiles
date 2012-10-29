" More convenient leader
let mapleader=","
let maplocalleader=",,"


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" Control-s functionality for quick save
" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
nnoremap <silent> <C-S> :if expand("%") == ""<cr>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
imap <c-s> <c-o><c-s>


" Paste mode toggle for CLI version
nnoremap <F2> :set invpaste paste?<cr>
set pastetoggle=<F2>
set showmode


" No more stretching for navigating files
noremap h ;
noremap j h
noremap k gj
noremap l gk
noremap ; l

" Clear search results on esc
" nnoremap <esc> :noh<cr><esc>
" nnoremap <silent> <esc> :let @/=""<cr><esc>
" nnoremap <silent> <esc> :if !empty(@/) <bar> let @/="" <bar> else <bar> call feedkeys("\<esc\>") <bar> endif<cr>
" nnoremap <silent> <esc> :call ClearSearchOrEsc()<cr>
" function! ClearSearchOrEsc()
" 	if !empty(@/)
" 		let @/=""
" 	else
" 		call feedkeys("esc")
" 	endif
" endfunction

" Quick window switching
nmap <silent> <C-h> :wincmd h<cr>
nmap <silent> <C-j> :wincmd j<cr>
nmap <silent> <C-k> :wincmd k<cr>
nmap <silent> <C-l> :wincmd l<cr>


" Jumplist tab!
nmap <s-tab> <c-o>

" Autocomplete shortcut
" Remap code completion to Ctrl+Space {{{2
" inoremap <Nul> <C-x><C-o>
" inoremap <expr> <leader>, pumvisible() \|\| &omnifunc == '' ?
" 			\ "\<lt>C-n>" :
" 			\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
" 			\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
" 			\ "\" \\<lt>bs>\\<lt>C-n>\"\<cr>"
" imap <C-@> <Nul>

" Add lines without entering insert mode
map <S-Enter> O<esc>k
map <cr> o<esc>l

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
imap <D-]> <esc>gt
imap <D-[> <esc>gT
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
map <D-j> ^
imap <D-j> <esc>^i
map <D-;> $
imap <D-;> <esc>$a

" Scroll mappings (mvim disabled in gvimrc)
map <silent> <D-k> <c-e>
imap <silent> <D-k> <esc><c-e>a
map <silent> <D-l> <c-y>
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

map <leader>sv :ConqueTermVSplit zsh<cr>
map <leader>sh :ConqueTermSplit zsh<cr>
map <leader>sn :ConqueTermTab zsh<cr>

map <leader>sw :%s/\s\+$<cr>

map <leader>rt :RetabIndent<cr>
map <leader>et :Space2Tab<cr>
map <leader>dt :Tab2Space<cr>
map <leader>st :Space2Tab<cr>
map <leader>ts :Tab2Space<cr>

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
map <leader>cd :colorscheme railscasts<cr>
map <leader>cl :colorscheme solarized \| set background=light<cr>
map <leader>cb :set guifont=Source\ Code\ Pro:h13<cr>
map <leader>cs :set guifont=Menlo,12<cr>
