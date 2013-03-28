# Easier command mode
bindkey -M viins 'jj' vi-cmd-mode

### Move over hjkl
# Unbind current keys
bindkey -rM vicmd 'h'
bindkey -rM vicmd 'j'
bindkey -rM vicmd 'k'
bindkey -rM vicmd 'l'

# Bind new keys
bindkey -M vicmd 'j' vi-backward-char
bindkey -M vicmd ';' vi-forward-char
bindkey -M vicmd 'k' vi-down-line-or-history
bindkey -M vicmd 'l' vi-up-line-or-history
