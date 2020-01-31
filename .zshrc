ZSH_THEME="simple"

plugins=(colorize git sublime autopep8 aws )

# Colorful output of less
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias more='less'

alias updatedb='sudo /usr/libexec/locate.updatedb'

export PATH="/usr/local/opt/python@3.8/bin:$PATH"
