""""" START Vundle """""
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Source bundles
exe 'source' expand('<sfile>:h') . '/bundles.vim'

filetype plugin indent on
""""" END Vundle """""
