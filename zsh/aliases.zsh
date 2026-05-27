######################
# Custom shell aliases
######################

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias open='xdg-open'

alias xclip='termux-clipboard-set'
alias xsel='termux-clipboard-set'
alias pbcopy='termux-clipboard-set'
alias pbpaste='termux-clipboard-get'

alias wakelock='termux-wake-lock && echo "Wakelock acquired: Termux background session secured."'
alias wakelock-off='termux-wake-unlock && echo "Wakelock released."'

alias ssh-start='sshd && echo "SSH daemon started on port 8022."'
alias ssh-stop='pkill sshd && echo "SSH daemon stopped."'
