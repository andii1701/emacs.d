alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias e='emacs'

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
