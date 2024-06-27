eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fzf --bash)"
. ~/.aliases
. ~/.env
. ~/.git_aliases
export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1='\u@\h:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export CLICOLOR=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=/Users/shuren/scripts:$PATH
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${ANDROID_HOME}/tools/bin/:$PATH
export PATH=${ANDROID_HOME}/emulator/:$PATH
export PATH=${ANDROID_HOME}/platform-tools/:$PATH
export PRETTIERD_LOCAL_PRETTIER_ONLY=true
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
alias config='/usr/bin/git --git-dir=/Users/shuren/.cfg/ --work-tree=/Users/shuren'
