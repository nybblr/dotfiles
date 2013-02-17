" Highlight non-printable characters
hi NonText ctermfg=darkgray guifg=gray
"
" Highlight space indents
redir => cl | silent hi CursorLine | redir END

let property='cterm'
if has("gui_running")
	let property='gui'
end

let clColor='gray'
let match = matchlist(cl, property . 'bg=\([#_-a-zA-Z0-9]*\)')
if !empty(match)
	let clColor = match[1]
end

hi Spaces guifg=gray
exe 'hi Spaces ' . property . 'bg=' . clColor

match Spaces /^ \+/
autocmd BufWinEnter * match Spaces /^ \+/
autocmd InsertEnter * match Spaces /^ \+\%#\@<!/
autocmd InsertLeave * match Spaces /^ \+/

" Hide tabs
exe 'hi Tabs ' . property . 'fg=' . clColor
2match Tabs /^\t\+/
autocmd BufWinEnter,InsertEnter,InsertLeave * 2match Tabs /^\t\+/

autocmd BufWinLeave * call clearmatches()
