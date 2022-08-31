
## make sure you have followed packages installed:
# bat, terraform, kubectl, nvim, exa
#

export NEOVIM_DEV_REPO="/Users/d/Downloads/neovim"

alias src="source ~/.zshrc; echo 'Sourced.'"
alias l="exa --long --header --all"
alias tf="terraform"
alias k="/usr/local/bin/kubectl"
#alias n="NVIM_LISTEN_ADDRESS=/tmp/nvim nvim"  # run with python script
alias n="/opt/homebrew/bin/nvim"
alias nn="$NEOVIM_DEV_REPO/local/bin/nvim -u $NEOVIM_DEV_REPO/local/init.lua"
alias fzf="fzf --preview=\"bat --color=always {}\""
alias updatedb="sudo /usr/libexec/locate.updatedb; echo 'done'"
alias st="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias less="bat --paging=always --pager=\"less -R\""
