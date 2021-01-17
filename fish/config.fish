function fish_greeting 
	set -Ux PYENV_ROOT $HOME/.pyenv
	set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
	set -Ux fish_user_paths /home/davidh/.emacs.d/bin fish_user_paths
	cat ~/.cache/wal/sequences
end

