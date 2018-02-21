alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias e='emacs'
alias ls='ls -G'

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export EDITOR=emacs

eval "$(rbenv init -)"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[33m\]$(parse_git_branch) \[\033[01;34m\]\$\[\033[00m\] '




