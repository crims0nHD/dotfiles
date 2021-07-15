export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

plugins=(git zsh-autosuggestions tmux)

# If vim is the terminal emulator
if [[ -z ${VIMRUNTIME} ]] 
then
	plugins+=(vi-mode)
fi

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_UNICODE="true"

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=false
VI_MODE_SET_CURSOR=true


source $ZSH/oh-my-zsh.sh

# export PAGER=nvimpager
export EDITOR=nvim

alias ls="ls --color"
alias ll="ls -l"

alias emacsc="emacsclient --no-wait"
alias emacsct="emacsclient -nw"
