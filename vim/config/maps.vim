" More convenient leader
let mapleader=","


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" Control-s functionality for quick save
" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
imap <c-s> <c-o><c-s>


" Paste mode toggle for CLI version
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


" No more stretching for navigating files
noremap h ;
noremap j h
noremap k gj
noremap l gk
noremap ; l

" Clear search results on esc
nnoremap <esc> :noh<cr><esc>

" Quick window switching
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>


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

map <leader>to <Plug>TaskList

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

" Scroll mappings (mvim disabled in gvimrc)
map <D-k> <c-e>
map <D-l> <c-y>

map <leader>nt :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <leader>rc :edit ~/.vimrc<cr>
map <leader>rv :so $MYVIMRC<cr>
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
nmap <leader>ah :Tabularize /#<CR>
vmap <leader>ah :Tabularize /#<CR>
nmap <leader>a: :Tabularize /:\zs<CR>
vmap <leader>a: :Tabularize /:\zs<CR>
nmap <leader>ag :Tabularize /=><CR>
vmap <leader>ag :Tabularize /=><CR>

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
