# .bash_profile

# Get the aliases and functions

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

PATH=/opt/chef/bin:/opt/chef/embedded/bin:$HOME/bin:$PATH
export PATH

PYTHONPATH=/usr/local/lib/python2.7/site-packages/
export PYTHONPATH

if [ ! -f /var/log/profiles ]
then
    sudo touch /var/log/profiles
    sudo chmod a+rw /var/log/profiles
fi


function rename_terminal_title()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the new title.
        return
    fi

    local title="Terminal | $1"
    echo -en "\033]0;$title\007"
    export CURRENT_TERMINAL_TITLE="$1"
}

function rename_terminal_title_default()
{
    if [ -z "MBP" ]; then
        echo Usage: You must pass the new title.
        return
    fi

    local title="Terminal | MBP"
    echo -en "\033]0;$title\007"
    export CURRENT_TERMINAL_TITLE="MPB"
}

alias rw=rename_terminal_title
alias r=rename_terminal_title_default

sudo echo .bash_profile ran at $(date) >> /var/log/profiles


