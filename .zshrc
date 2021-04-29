export ZSH="/Users/d/.oh-my-zsh"

ZSH_THEME="simple"

plugins=(git sublime)

source $ZSH/oh-my-zsh.sh

alias k="/usr/local/bin/kubectl"
alias updatedb='sudo /usr/libexec/locate.updatedb'

export PATH=/usr/local/share/python:$PATH

# Configuration for virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
source /usr/local/bin/virtualenvwrapper.sh

export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/d/bwell/marketplace-auth-service/venv/bin:$PATH"

eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

