# The following lines were added by compinstall
zstyle :compinstall filename '/Users/toru/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"


#---------------------------------------------------------------------------
# General
#---------------------------------------------------------------------------
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export TERM=xterm-256color
setopt nobeep

#---------------------------------------------------------------------------
# History
#---------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt hist_no_store
setopt hist_reduce_blanks
setopt extended_history
setopt inc_append_history
setopt hist_ignore_space
setopt hist_verify
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#---------------------------------------------------------------------------
# Complement
#---------------------------------------------------------------------------
setopt auto_pushd
setopt correct
setopt correct_all
setopt hist_expand
setopt list_types
setopt auto_list
setopt auto_menu
setopt list_packed
setopt auto_param_keys
setopt auto_param_slash
setopt mark_dirs
setopt auto_cd
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt nolistbeep


#---------------------------------------------------------------------------
# Alias
#---------------------------------------------------------------------------
alias ls="ls -G"
alias ll='ls -ltr'
alias la="ls -lhAF"

alias r="rails"

alias gci='git commit'
alias gst='git status'
alias glg='git log'
alias gaa='git add .'
alias gffs='git flow feature start'
alias gfff='git flow feature finish'

alias here="open ."
alias midori="cd /Users/toru/Dropbox/nanoc/midori"

#---------------------------------------------------------------------------
# Appearance
#---------------------------------------------------------------------------
autoload -U colors
colors
setopt prompt_subst
export LSCOLORS=gxfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors 'di=36;49'

autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

#---------------------------------------------------------------------------
# Prompt
#---------------------------------------------------------------------------
PROMPT="%{${fg[yellow]}%}%/%%%{${reset_color}%} "
PROMPT2="%{${fg[yellow]}%}%_%%%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
RPROMPT="%1(v|%F{green}%1v%f|)"
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[cyan]}%}%n@${HOST%%.*} ${PROMPT}"


#---------------------------------------------------------------------------
# Function
#---------------------------------------------------------------------------
# Mkdir+Cd
function mkcd() {
  if [[ -d $1 ]]; then
    echo "It already exsits! Cd to the directory."
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}
# Find+Grep
function findgrep() {
  find . -type f -print | xargs grep -n --binary-files=without-match $@
}
# Reload zshrc
function reload() {
  source $HOME/.zshrc
}
# Override
function chpwd() { ls }
#eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
