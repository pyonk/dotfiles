export LANG=ja_JP.UTF-8

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

autoload -Uz colors
autoload -Uz compinit

zstyle ':completion:*:default' menu select=2

export XDG_CONFIG_HOME=$HOME/.config

if test -z $TMUX ; then
	TMUX_CONF=$XDG_CONFIG_HOME/tmux/tmux.conf
	ID=`tmux list-sessions`
	if test -z $ID ; then
		tmux -f "$TMUX_CONF" new-session
	fi
	CREATE_NEW_SESSION="Create New Session"
	PERCOL=fzf
	ID="$ID\n$CREATE_NEW_SESSION:"
	ID=`echo -e $ID | eval $PERCOL | cut -d: -f1`
	if [[ $ID == $CREATE_NEW_SESSION ]] ; then
		tmux -f "$TMUX_CONF" new-session
	elif test -n "$ID" ; then
		echo $ID
		tmux -f "$tmux_conf" attach-session -t "$ID"
	else
	# Start terminal normally
	fi
fi

bindkey -v

setopt auto_pushd
setopt correct
setopt share_history

alias ls="ls -G"
# alias vim="nvim"

export EDITOR=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zsh_profile ] && source ~/.zsh_profile

