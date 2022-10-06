
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share:$PATH"
export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"

export LANG=en_US.UTF-8
export EDITOR=nvim
export PAGER="bat --paging=always --pager=\"less -R\""

#ZSH_THEME="afowler"
#ZSH_THEME="awesomepanda"
#ZSH_THEME="daveverwer"
#ZSH_THEME="edvardm"
#ZSH_THEME="jbergantine"
ZSH_THEME="mgutz" #👍🏼
#ZSH_THEME="sorin"
## stopped discover at https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#gozilla

#PROMPT='%{$fg[magenta]%}%0~ %{$fg_bold[magenta]%}%(!.#.::) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

#RPROMPT='%{$fg_bold[white]%} $(git_current_branch) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git sublime poetry docker docker-compose aws brew kubectl)

source $ZSH/oh-my-zsh.sh

# Enable NVM
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias src="source ~/.zshrc; echo 'sourced.'"
alias l="exa --long --header --all"
alias tf="terraform"
alias k="kubectl"
alias n="nvim"
alias fzf="fzf --preview=\"bat --color=always {}\""
alias updatedb="sudo /usr/libexec/locate.updatedb; echo 'done.'"
