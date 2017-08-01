" First, disable MacVim's commands
if has("gui_macvim")
	macm Tools.List\ Errors<Tab>:cl key=<nop>
	macm Tools.Spelling.To\ Next\ Error<Tab>]s key=<nop>

	" macm Edit.Font.Bigger key=<S-D-=> action=fontSizeUp:
	" macm Edit.Font.Smaller key=<nop> action=fontSizeDown:
	macm Edit.Font.Smaller action=fontSizeDown: key=<D-->
	macm Edit.Font.Bigger action=fontSizeUp: key=<S-D-=>
endif

set noballooneval
