# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

function rename_terminal_title_no_prefix()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the new title.
        return
    fi
    echo -en "\033]0;$1\007"
}


function rename_terminal_title()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the new title.
        return
    fi

    if [ -z "$2" ]; then
        local tmux_window=""
    else
        local tmux_window="-t $2"
    fi

    local title="term | $1"
    local tmux_title_no_spaces=$(echo $1 | sed -e 's/ /_/g')

    if [ $TMUX_PANE ]; then
        tmux rename-window $tmux_window $tmux_title_no_spaces
        tmux refresh-client
    else
        echo -en "\033]0;$title\007"
        export CURRENT_TERMINAL_TITLE="$1"
    fi

}
alias rw=rename_terminal_title
alias r="rw 'DevVM'"

# No auto rename
if [ ! $TMUX_PANE ]; then
    rename_terminal_title "DevVM"
fi


#    local title="terminal | $1"
#    echo -en "\033]0;$title\007"
#    export CURRENT_TERMINAL_TITLE="$1"
#}
# alias rw=rename_terminal_title
# rename_terminal_title "Dev VM"

