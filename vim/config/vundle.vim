""""" START Vundle """""
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Source bundles
exe 'source' expand('<sfile>:h') . '/bundles.vim'

" Source powerline
" set rtp+=~/.powerline/bindings/vim

call vundle#end()
filetype plugin indent on
""""" END Vundle """""
