alias ezc='vim ~/.oh-my-zsh/custom/config.zsh'
alias c='clear'
alias rsrc='exec $SHELL'
alias gs='git status'
alias gl='git log --oneline'
alias gc='git commit'
alias gac='git add -p'
alias ga='git add'
alias l='ls'
alias ll='ls -la'
alias ssh-snoopy='ssh -l phil sideshowcoder.no-ip.org'
alias titanium.py='~/Library/Application\ Support/Titanium/mobilesdk/osx/3.0.2.GA/titanium.py'
alias start-mysql='mysql.server start'
alias stop-mysql='mysql.server stop'
alias connect-mysql='mysql --host=127.0.0.1 --user=root'
alias start-pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stop-pg='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias start-mongodb='mongod run --config /usr/local/etc/mongod.conf'
alias start-redis='redis-server /usr/local/etc/redis.conf'

export EDITOR="vim"
export PAGER="view"
export NVM_HOME="$HOME/.nvm"
if [[ -f "$NVM_HOME/nvm.sh" ]]; then
  source "$NVM_HOME/nvm.sh"
fi
# don't init rbenv in a dumb terminal (ie dterm)
if [[ "$TERM" != "dumb" ]]; then
  eval "$(rbenv init - --no-rehash)"
fi
export PATH=$PATH:/usr/local/share/npm/bin
export PATH="/usr/local/heroku/bin:$PATH"
export GOPATH=$HOME/Source/go
export PATH=./bin:$PATH # put binstubs in path

# make shell behave like vim
bindkey -v
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
# show the current mode in the prompt
precmd() {
  RPROMPT=""
}
zle-keymap-select() {
  RPROMPT=""
  [[ $KEYMAP = vicmd ]] && RPROMPT="(CMD)"
  () { return $__prompt_status }
  zle reset-prompt
}
zle-line-init() {
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-inii

ZSH_THEME='blinks'
plugins=(rbenv)
