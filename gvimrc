" First, disable MacVim's commands
if has("gui_macvim")
	macm Tools.List\ Errors<Tab>:cl key=<nop>
endif
