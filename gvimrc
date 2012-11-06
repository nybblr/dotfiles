" First, disable MacVim's commands
if has("gui_macvim")
	macm Tools.List\ Errors<Tab>:cl key=<nop>
	macm Tools.Spelling.To\ Next\ error<Tab>]s key=<nop>
endif

set noballooneval
