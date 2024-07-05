eval "$(fzf --bash)"
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
fi
. ~/.aliases
. ~/.env
. ~/.git_aliases
export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export CLICOLOR=1

export PATH=/home/shuren/scripts:$PATH
export PRETTIERD_LOCAL_PRETTIER_ONLY=true
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
