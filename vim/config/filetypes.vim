" OpenGL shaders
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl

" It's basically markdown
au BufNewFile,BufRead *.percolate set filetype=mkd

" Enable spellchecking for text files
au FileType mkd,rst,textile,text,percolate set spell
