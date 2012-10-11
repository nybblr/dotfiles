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


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif


if has("gui_macvim")
	let macvim_hig_shift_movement = 1
endif


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif
