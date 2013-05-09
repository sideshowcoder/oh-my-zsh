export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias ezc='vim ~/.oh-my-zsh/custom/config.zsh'
alias v='view'
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
export PAGER="less"
export NVM_HOME="$HOME/.nvm"
eval "$(rbenv init - --no-rehash)"
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=/usr/local/heroku/bin:$PATH
export GOPATH=$HOME/Source/go
export PATH=./bin:$PATH # put binstubs in path
if [[ -f "$NVM_HOME/nvm.sh" ]]; then
  source "$NVM_HOME/nvm.sh"
fi

# make shell behave like vim
bindkey -v
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

RPROMPT='${vim_mode}'

ZSH_THEME='sammy'
plugins=(rbenv vi-mode)
