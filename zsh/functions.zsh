#!/usr/bin/env zsh

# make mysql actually usable

alias zsh_setup="source $ZDOTDIR/setup.zsh && echo 'Updated zsh config.'"

alias mysql-start='mysqld_safe && echo mysql has been started '
mysql-connect() {
	if  ! mysqladmin -u root ping -h localhost --silent; then
		echo "Seems like MySQL is not up, starting it...."
		(mysqld_safe 1> /dev/null &)
		while ! mysqladmin -u root ping -h localhost --silent 1> /dev/null
		do
			sleep 0.5 # at 0.1, it takes 3 iterations. 0.5 seems like a sane number to me.
			echo "Waiting for MySQL to start..."
		done
	fi
	#clear
	mysql -u root

}
alias mysql-stop='mysqladmin -u root shutdown && echo mysql has been stopped' 

topgrade() {
	command topgrade "$@" && rebuild # rebuilds zsh plugins after being pulled from github.
}

if [[ ${OSTYPE[1,6]} = "darwin" ]]; then
	function man-preview() {
		[[ $# -eq 0 ]] && >&2 echo "Usage: $0 command1 [command2 ...]" && return 1

		local page
		for page in "${(@f)"$(man -w $@)"}"; do
			command mandoc -Tpdf $page | open -f -a Preview
		done
	}
	compdef _man man-preview
fi

alias jekyll-serve='docker run --name jekyll-serve --rm -p 4000:4000 -p 4040:4040 -v "$XDG_CACHE_HOME/bundle:/usr/local/bundle" -v $(pwd):/site jekyll-serve'
alias jekyll-bash='docker run --name jekyll-serve --rm -v "$XDG_CACHE_HOME/bundle:/usr/local/bundle" -v $(pwd):/site -it --entrypoint bash jekyll-serve'