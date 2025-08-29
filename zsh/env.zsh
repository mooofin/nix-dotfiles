#!/usr/bin/env zsh

# populate $PATH to be able to run stuff
# see: https://docs.brew.sh/FAQ#why-should-i-install-homebrew-in-the-default-location

# On linux, I no longer use homebrew, so this is commented out
# if [[ -e /opt/homebrew ]]; then
# 	HOMEBREW_PREFIX="/opt/homebrew"
# elif [[ -e /usr/local ]]; then
# 	HOMEBREW_PREFIX="/usr/local"
# elif [[ -e /home/linuxbrew/.linuxbrew ]]; then
# 	HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
# fi
# # If any of the directories exist, set $PATH and others for homebrew
# if [[ -n "$HOMEBREW_PREFIX" ]]; then
# 	fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath);
# 	export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar";
# 	export HOMEBREW_REPOSITORY=$HOMEBREW_PREFIX;
# 	export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin${PATH+:$PATH}";
# 	export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:";
# 	export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}";

# 	export HOMEBREW_NO_ENV_HINTS=TRUE
# 	export PATH="/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"

# fi

# source the plugins first, so that p10k instant prompt kicks in
source $ZDOTDIR/zsh_plugins.zsh

# XDG
# https://github.com/b3nj5m1n/xdg-ninja/issues/289#issuecomment-1666024202
# export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export PYTHON_HISTORY="$HOME"/.local/state/python_history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export LESSHISTFILE="$XDG_STATE_HOME"/less/history

autoload -Uz add-zsh-hook

chpwd_autosource_venv() {
	if [[ -d .venv ]]; then
		if [[ -n "$VIRTUAL_ENV" ]]; then
			deactivate
		fi
		source .venv/bin/activate
		echo "Activated virtual environment in $(pwd)"
	fi
}

add-zsh-hook chpwd chpwd_autosource_venv