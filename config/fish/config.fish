function fish_greeting 
	set -Ux PYENV_ROOT $HOME/.pyenv
	set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
	set -Ux fish_user_paths /home/davidh/.emacs.d/bin fish_user_paths

	if test -f ~/.cache/wal/sequences
	    cat ~/.cache/wal/sequences
	end
end

if [ TERM="xterm-kitty" ]
	function ssh
	    kitty kitten ssh $argv
	end
end
