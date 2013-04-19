" OpenGL shaders
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl set filetype=glsl

" Slim syntax for EmblemJS
au BufNewFile,BufRead *.emblem set filetype=slim

" Enable spellchecking for text files
au FileType mkd,rst,textile,text set spell
