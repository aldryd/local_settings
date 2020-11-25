
## Old command prompt style
#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

source ~/.bash_prompt

# Set iTerm2 user variables
function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Use Chrome as the browser for Jupyter notebooks
export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

# Drive DAT file parsing path
export PATH="$PATH:$HOME/Development/Projects/protobuf-messaging/definitions/SixFortySDK"
export PATH="$PATH:$HOME/Development/Projects/OLDprotobuf-messaging/definitions/SixFortySDK"

# Some handy tools
export PATH="$PATH:$HOME/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Development
source /usr/local/bin/virtualenvwrapper.sh

# git-subrepo
source $HOME/Development/Tools/git-subrepo/.rc

# Aliases
alias ls='ls -GFh'
alias vim='mvim'
alias be='bundle exec'
alias mypbcopy='xargs echo -n | pbcopy'

# Helpers for virtualenv
workon() {
    # Deactivate any current virtual environment and ignore the output if not currently in one
    deactivate &>/dev/null
    # Switch to a virtual environment
    source $WORKON_HOME/$1/bin/activate
}

mkvirtualenvwrapper() {
    python3 -m venv $WORKON_HOME/$1
    workon $1
}

rmvirtualenv() {
    # Deactivate any current virtual environment and ignore the output if not currently in one
    deactivate &>/dev/null
    rmtrash $WORKON_HOME/$1

    echo ">> Removed $1"
}

# Tab completion for virtual environments
_virtualenv-complete()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="$(echo $($(which ls) -1 ${WORKON_HOME} | sed 's/^//'))"

    if [[ ${cur} == * ]] ; then
        COMPREPLY=($(compgen -W "${opts}" $cur))
        return 0
    fi
}

complete -F _virtualenv-complete workon
complete -F _virtualenv-complete mkvirtualenvwrapper
complete -F _virtualenv-complete rmvirtualenv

