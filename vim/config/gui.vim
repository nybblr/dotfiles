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
	autocmd FileType ruby setlocal noballooneval
endif


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif


if has("gui_macvim")
	" This gets irritating with select mode. Manually set.
	" let macvim_hig_shift_movement = 1

	set keymodel=startsel,stopsel

	" HIG related shift + special movement key mappings
	nn   <S-D-Left>     <S-Home>
	vn   <S-D-Left>     <S-Home>
	ino  <S-D-Left>     <S-Home>
	nn   <S-M-Left>     <S-C-Left>
	vn   <S-M-Left>     <S-C-Left>
	ino  <S-M-Left>     <S-C-Left>

	nn   <S-D-Right>    <S-End>
	vn   <S-D-Right>    <S-End>
	ino  <S-D-Right>    <S-End>
	nn   <S-M-Right>    <S-C-Right>
	vn   <S-M-Right>    <S-C-Right>
	ino  <S-M-Right>    <S-C-Right>

	nn   <S-D-Up>       <S-C-Home>
	vn   <S-D-Up>       <S-C-Home>
	ino  <S-D-Up>       <S-C-Home>

	nn   <S-D-Down>     <S-C-End>
	vn   <S-D-Down>     <S-C-End>
	ino  <S-D-Down>     <S-C-End>
endif


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif
