#.bashrc
# Tim Stacy

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


EDITOR=vim
# User specific aliases and functions
ulimit -c unlimited

# git completion and prompt scripts
source ~/githome/git-prompt.sh
source ~/githome/git-completion.sh

# adding amazon keys, but not enabling for now
if [ -f ~/amazon_keys.sh ]; then
   source ~/amazon_keys.sh
fi

function set_branch()
{
    local branch=`__git_ps1`
    # Parenthesis are added to the beginning and end of the branch, remove them.
    branch=$(echo -n $branch | sed s/\(//g | sed s/\)//g)
    # echo $branch
    export b=$branch
}

export PROMPT_COMMAND=set_branch
# Now I can do "git push origin $b" and $b will always be the current branch.
# Don't forget to 'unset PROMPT_COMMAND' otherwise teh default seems to rename
# the terminal based on the cwd.


export PS1="\[\033[1;36m\]\h\[\033[1;33m\]\$(__git_ps1) \[\033[1;35m\]\w \[\033[0;0m\] \n>"
#             \[\033[1;30m\] Start color brown.
#                                        \[\033[0;0m\] Stop color.


# History across terminal sessions.
export HISTSIZE=10000
shopt -s histappend
PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"
export HISTTIMEFORMAT='%F %T '

# ENVIRONMENT MORE VARIABLES
## export CLICOLORS=1
## export LSCOLORS=ExFxBxDxCxegedabagacad

export EDITOR='vim'
export ALTERNATE_EDITOR=emacs
export INTAD_USER=tstacy
export VCD_ORG=Dev_General
export JENKINS_USER=tim.stacy@tradingtechnologies.com
if [ -f ~/.mykeys/jenkins_token ]; then
    export JENKINS_TOKEN=$(head -n 1 ~/.mykeys/jenkins_token)
fi
export DEPLOYMENT_SCRIPTS_REPO_ROOT=~/dev-root/scripts
export BOOTSTRAP_REQUESTER=tim.stacy@tradingtechnologies.com
export JOB_REQUESTER=tim.stacy@tradingtechnologies.com
# export BUILD_URL=http://tim-fake.com
export MGR='Tim Stacy'
export COST_CENTER='ENGINEERING-490'
export PROJECT='DEBESYS'
export BUMP_COOKBOOK_VERSION_AUTO_EXECUTE=1



# COMMAND ALIASES
alias cdhome='cd ~/'
alias vi='vim'
alias ls='ls -aFChG'
alias cls='clear'
alias ll='ls -la'
alias ll='ls -alhG'
alias todo='vim  ~/todo.txt'
alias h='history | tail -n 50'
alias hg='history |grep'
alias vimbash='vim ~/.bashrc'
alias vbash='vim ~/.bashrc'
alias vimbp='vim ~/.bash_profile'
alias sbp='vim ~/.bash_profile'
alias sbash='source ~/.bashrc'
alias vimvim='vim ~/.vimrc'
alias cdr='cd ~/dev-root'
alias dev='cd ~/dev-root/debesys_one'
alias ttnet='cd ~/dev-root/ttnet_one'
alias ttnet2='cd ~/dev-root/ttnet_two'
alias mdbd='sudo mount -o user=intad/tstacy -t cifs //chifs01.int.tt.local/Share/Dead_By_Dawn /mnt/dbd/'
alias glog='git glog'
alias run='`git rev-parse --show-toplevel`/run'
# Commenting out since I run on a MBP
# alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
alias ttknife='`git rev-parse --show-toplevel`/ttknife'
alias vnotes='vim ~/notes'
alias cnotes='cat ~/notes'
alias vknownhosts='vim ~/.ssh/known_hosts'
alias vkh='vim ~/.ssh/known_hosts'
alias galias='git config --list |grep alias'
alias psme='ps aux |grep tstacy'
alias S3='aws s3 ls s3://deploy-debesys'
alias xoff='external off'
alias bcv='python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/bump_cookbook_version.py'
alias show='ttknife node show'
alias cnotes='cat ~/notes'
alias vnotes='vim ~/notes'
alias vimssh='vim ~/.ssh/config'
alias bootstrap='python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/request_bootstrap.py'
alias cleantags='git tag -d $(git tag); git fetch'
alias hotfixer='python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/hotfixer.py'
alias mergetest='python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/check_repo.py'
alias sn='ttknife search node'
alias ke='ttknife node edit'
alias td='tmux_local_mac'
alias tnw='tmux_new_window'
alias tks='tmux kill-session -t'
alias showhiddenfiles='defaults write com.apple.finder AppleShowAllFiles YES'
alias hidehiddenfiles='defaults write com.apple.finder AppleShowAllFiles NO'

# SSH COMMAND ALIASES
alias sshlinux='ssh tstacy@172.17.12.32'
alias sshdevtim='ssh tstacy@119.0.200.99'
alias sshlinuxdev='ssh ttnetunix@119.0.200.99'
alias sshprodorch='ssh ttnetunix@119.0.200.102'
alias sshprodlinux='ssh ttnetunix@119.0.200.91'

## Debesys Dev Workstation:: gld2vm65  (root/Tt12345678)
alias sshdev='ssh tstacy@10.195.2.65'
alias s='ssh -X tstacy@10.195.2.65'
alias sshdevx='ssh -X tstacy@10.195.2.65'
alias showdev='echo gla1vm65=10.195.2.65'
alias sshlvm='ssh -p 2222 tstacy@127.0.0.1'

# SAFETY CONTROLS #
## do not delete / or prompt if deleting more than 3 files ##
alias rm='rm -I --preserve-root'

## Parenting changing permissions on / ##
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'



# TTNET ALIASES FOR SHIPPING STUFF
alias scpwinexe='scp ttnetsys/winexe.py ttnetunix@119.0.200.102:/opt/ttnet/vm_migrations/ttnetsys/.'
alias scpmso='scp rundeck/scripts/migrate_server_orchestrator.py ttnetunix@119.0.200.102:/opt/ttnet/vm_migrations/.'
alias scptestmso='scp migrate_server_orchestrator.py ttnetunix@119.0.200.102:/opt/ttnet/vm_migrations/test_migrate_server_orchestrator.py'
alias scprundecksplunk='scp rundeck_downtime_stop_splunk.py ttnetunix@119.0.200.102:/opt/ttnet/rundeck_downtime_stop_splunk.py'



function aws_keys()
{
    usage="aws_keys key_file"
    if [ -z "$1" ]; then
        echo $usage
        return
    fi

    if [ -f "$1" ]; then
        echo Loading AWS keys from "$1".
        source $1
    else
        echo Error: Didn\'t find "$1", couldn\'t load AWS keys.
    fi
}


function external()
{
    usage="external on|off"
    if [ -z "$1" ]; then
        echo $usage
        return
    fi

    if [ "on" == "$1" ]; then
        export PRE_EXTERNAL_PS1=$PS1
        export PRE_EXTERNAL_TERMINAL_TITLE=$CURRENT_TERMINAL_TITLE
        export PS1="\[\033[1;31m\]EXTERNAL DEBESYS\[\033[1;36m\] \h\[\033[1;33m\]\$(__git_ps1) \[\033[1;35m\]\w \[\033[0;0m\] \n>"
        rename_terminal_title "EXTERNAL DEBESYS"
        # alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife -C ~/.chef/knife.external.rb'
        alias ttknife='`git rev-parse --show-toplevel`/ttknife -C ~/.chef/knife.external.rb'
        alias ttknife
        red="\033[1;31m"
        nc="\033[0;0m"
        # red='\e[1;31m' # red text for the external banner --> from centos .bashrc
        # nc='\e[0;0m'  # back to white --> from centos .bashrc
        echo
        echo -e "${red}######## ##     ## ######## ######## ########  ##    ##    ###    ##${nc}"
        echo -e "${red}##        ##   ##     ##    ##       ##     ## ###   ##   ## ##   ##${nc}"
        echo -e "${red}##         ## ##      ##    ##       ##     ## ####  ##  ##   ##  ##${nc}"
        echo -e "${red}######      ###       ##    ######   ########  ## ## ## ##     ## ##${nc}"
        echo -e "${red}##         ## ##      ##    ##       ##   ##   ##  #### ######### ##${nc}"
        echo -e "${red}##        ##   ##     ##    ##       ##    ##  ##   ### ##     ## ##${nc}"
        echo -e "${red}######## ##     ##    ##    ######## ##     ## ##    ## ##     ## ########${nc}"
        echo
        # http://patorjk.com/software/taag/#p=display&h=1&v=1&f=Banner3&t=EXTERNAL
        aws_keys ~/amazon_keys_ttnet.sh
        export EXTERNAL_DEBESYS="enabled"
    elif [ "off" == "$1" ]; then
        if [ ! -z "$PRE_EXTERNAL_PS1" ]; then
            export PS1=$PRE_EXTERNAL_PS1
        fi
        if [ ! -z "PRE_EXTERNAL_TERMINAL_TITLE" ]; then
            rename_terminal_title "$PRE_EXTERNAL_TERMINAL_TITLE"
        fi
        # alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
        alias ttknife='`git rev-parse --show-toplevel`/ttknife'
        alias ttknife
        aws_keys ~/amazon_keys.sh
        export EXTERNAL_DEBESYS="disabled"
    else
        echo $usage
    fi
}

###### TMUX STUFF ######
function tmux_local_mac()
{
    echo "tmux new -d -s mac_os -n deploy"
    tmux new -d -s mac_os -n deploy
    tmux select-window -t mac_os:1
    tmux attach-session -d -t mac_os
}

function tmux_new_window()
{
    if [ -z "$1" ]; then
        winname="new"
    else
        winname="$1"
    fi

    echo "tmux new-window -n $winname"
    tmux new-window -n "$winname"
}






# function tns()
# {
#     local hm=~
#     local config="-C $hm/.chef/knife.rb"
#     if [ "$EXTERNAL_DEBESYS" == "enabled" ]; then
#         config=" -C $hm/.chef/knife.external.rb"
#         echo external debesys
#     fi
#     echo "ttknife $config node show $1"
#     ttknife $config node show "$1"
# }


# function rmchefnode()
# {
#     if [ -z "$1" ]; then
#         echo Usage: You must pass the node name.
#         return
#     fi

#     echo "ttknife node delete --yes $1"
#     ttknife node delete --yes "$1"

#     echo "ttknife client delete --yes $1"
#     ttknife client delete --yes "$1"
# }


# function search_chef_environment()
# {
#     if [ -z "$1" ]; then
#         echo Usage: You must pass the Chef environment and optionally a recipe
#         echo "Examples: sce int-dev-cert (all nodes in int-dev-cert)"
#         echo "echo      sce int-dev-cert cme (all nodes in int-dev-cert with recipe cme)"
#         return
#     fi
#     local search="chef_environment:$1"

#     if [ ! -z "$2" ]; then
#         search=$search" AND recipe:$2*"
#     fi

#     echo ttknife search node $search
#     `git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel` /ttknife search node "$search" -a name -a environment -a ip
# }
# alias sce=search_chef_environment


# safely remove a git branch
function rmbr()
{
    for do_not_delete in master origin/master release/current uat/current origin/uat/current origin/release/current develop origin/develop
    do
        if [ $do_not_delete == "$1" ]; then
            echo "Ooops! I think you are accidently trying to delete one of the important branches, aborting."
            return
        fi
    done

    echo "git push origin --delete $1";
    git push origin --delete $1;
    echo "git branch -d $1"
    git branch -d $1;
}


function git-sync_()
{
    usage="git-sync branch"
    if [ -z "$1" ]; then
        echo $usage
        return
    fi
    
    local branch="$1"
    if [ "d" == "$1" ]; then
        branch="develop"
    elif [ "r" == "$1" ]; then
        branch="release/current"
    elif [ "u" == "$1" ]; then
        branch="uat/current"
    elif [ "m" == "$1" ]; then
        branch="master"
    fi

    echo "pushd `git rev-parse --show-toplevel`";
    pushd `git rev-parse --show-toplevel`;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git remote prune origin";
    git remote prune origin;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git checkout $branch";
    git checkout "$branch";
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git pull";
    git pull;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git submodule init";
    git submodule init;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "git submodule update";
    git submodule update;
    if [ $? != 0 ]; then
        echo "Aborting."
        echo "popd"; popd;
        return
    fi
    echo "popd"; popd
}


function killit()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the Process ID Number.
        return
    fi

    echo 'sudo kill -9 $1'
    sudo kill -9 "$1"
}


#function rename_terminal_title()
#{
#    if [ -z "$1" ]; then
#        echo Usage: You must pass the new title.
#        return
#    fi
#
#    local title="terminal | $1"
#    echo -en "\033]0;$title\007"
#    export CURRENT_TERMINAL_TITLE="$1"
#}
#alias rw=rename_terminal_title
#rename_terminal_title "Tim :-)"


# function service_control_int()
# {
#     if [ -z "$1" ]; then
#         echo Usage: You must pass the environment and start or stop.
#         return
#     fi

#     echo knife ssh "chef_environment:$1" "/etc/debesys/services/action.sh $2" --config /home/tstacy/.chef/knife.rb --ssh-user root --ssh-password Tt12345678 --attribute ipaddress
#     knife ssh "chef_environment:$1" "/etc/debesys/services/action.sh $2" --config /home/tstacy/.chef/knife.rb --ssh-user root --ssh-password Tt12345678 --attribute ipaddress

    
#     echo knife ssh "chef_environment:$1" "/etc/debesys/services/action.sh $2" --config /home/tstacy/.chef/knife.rb --ssh-user root --identity-file /home/tstacy/.chef/PILAB-US-EAST-1.pem --attribute ipaddress
    
#     knife ssh "chef_environment:$1" "/etc/debesys/services/action.sh $2" --config /home/tstacy/.chef/knife.rb --ssh-user root --identity-file /home/tstacy/.chef/PILAB-US-EAST-1.pem --attribute ipaddress
# }


# function service_control_ext()
# {
#     if [ -z "$1" ]; then
#         echo Usage: External Must be ON. You must pass the environment and start or stop.
#         return
#     fi

#     echo knife ssh "chef_environment:$1" "/etc/debesys/services/action.sh $2" --config /home/tstacy/.chef/knife.external.rb --ssh-user root --ssh-password Tt12345678 --attribute ipaddress
    
#     knife ssh "chef_environment:$1" "/etc/debesys/services/action.sh $2" --config /home/tstacy/.chef/knife.external.rb --ssh-user root --ssh-password Tt12345678 --attribute ipaddress


#     echo knife ssh "chef_environment:$1" "/etc/debesys/services/action.sh $2" --config /home/tstacy/.chef/knife.external.rb --ssh-user root --identity-file /home/tstacy/.chef/TTNET-US-EAST-1.pem --attribute ipaddress
    
#     knife ssh "chef_environment:$1" "/etc/debesys/services/action.sh $2" --config /home/tstacy/.chef/knife.external.rb --ssh-user root --identity-file /home/tstacy/.chef/TTNET-US-EAST-1.pem --attribute ipaddress
# }


function merge()
{
    local branches=$(git branch --no-color | awk -F ' +' '{print $2}' | grep -v master | grep -v uat/current | grep -v release/current | grep -v develop)
    if [ "" == "$branches" ]; then
        echo 'There are no candidate branches to merge. The only branches found were the git flow branches.'
        echo Found: $(git branch | awk -F ' +' '{print $2}')
        return
    fi

    PS3="Which branch do you want to merge: "
    select selection in $branches
    do
        echo git merge --no-ff $selection
        git merge --no-ff $selection
        break
    done

    if [ $? != 0 ]; then
        echo "The merge failed."
    else
        echo "The merge was successful."
    fi

    # Instead of injecting the function merge into the history, inject the resulting git command
    # with the branch into the history.  The reason this is better is that when performing the git
    # flow merging, I can up-arrow to perform the merge on the other git flow branches.  Without
    # this, the command merge is in the history and it prompts me, but I know the one I want to
    # merge cause I just chose it.
    history -s "git merge --no-ff $selection"
}


function resetilo()
{
    usage="resetilo <ipaddress>"
    if [ -z "$1" ]; then
        echo $usage
        return
    fi

    local ip="$1"
    local oct2=$(echo $ip |cut -d. -f2)
    local oct3=$(echo $ip |cut -d. -f3)
    local oct4=$(echo $ip |cut -d. -f4)
    local ilo_ip="10.192.8.$oct4"
    
    if [ $oct2 != 192 ]; then
       echo "resetilo function only works for Glados servers."
       return 
    fi
    if [ $oct3 != 0 ]; then
        echo "resetilo function only works for baremetal servers."
        return
    fi
    echo "sshpass -p Tt12345678 ssh -o StrictHostKeyChecking=no ttadmxxx100@$ilo_ip \"power reset\""
    sshpass -p Tt12345678 ssh -o StrictHostKeyChecking=no ttadmxxx100@$ilo_ip \"power reset\"
}



function make-completion-wrapper()
{
    local function_name="$2"
    local arg_count=$(($#-3))
    local comp_function_name="$1"
    shift 2
    local function="
    function $function_name
    {
        ((COMP_CWORD+=$arg_count))
        COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
        "$comp_function_name"
        return 0
    }"
    eval "$function"
}

alias gits='git-sync_'
make-completion-wrapper _git _git_checkout_mine git checkout
complete -o bashdefault -o default -o nospace -F _git_checkout_mine gits
complete -o bashdefault -o default -o nospace -F _git_checkout_mine rmbr
make-completion-wrapper _git _git_mine git
alias g='git'
complete -o bashdefault -o default -o nospace -F _git_mine g


# Uncomment to debug command to see when this file is sourced.
# if [ ! -f /var/log/profiles ]
# then
#     if [ -w /var/log/profiles ]; then
#         sudo touch /var/log/profiles
#         sudo chmod a+rw /var/log/profiles
#     fi
# fi
#
# if [ -w /var/log/profiles ]; then
#     echo .bashrc ran at $(date) >> /var/log/profiles
# fi

