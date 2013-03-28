# Easier command mode
bindkey -M viins 'jj' vi-cmd-mode

# Move over hjkl
bindkey -rpM vicmd 'h'
bindkey -rpM vicmd 'j'
bindkey -rpM vicmd 'k'
bindkey -rpM vicmd 'l'
bindkey -M vicmd -s 'j' 'h'
bindkey -M vicmd -s 'k' 'j'
bindkey -M vicmd -s 'l' 'k'
bindkey -M vicmd -s ';' 'l'
