# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/toru/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

alias here="open ."
alias midori="cd /Users/toru/Dropbox/nanoc/midori"

source ~/.pythonbrew/etc/bashrc
