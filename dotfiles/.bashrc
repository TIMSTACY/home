# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
ulimit -c unlimited


# git completion and prompt scripts
source ~/githome/git-prompt.sh
source ~/githome/git-completion.sh

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


export AWS_ACCOUNT_INFO=""
export PS1="\[\033[1;36m\]\h\[\033[1;33m\]\$(__git_ps1) \[\033[1;35m\]\w \[\033[1;34m\]\$AWS_ACCOUNT_INFO \[\033[0;0m\] \n>"
#             \[\033[1;30m\] Start color brown.
#                                        \[\033[0;0m\] Stop color.


# History across terminal sessions.
export HISTSIZE=10000
shopt -s histappend
PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"
export HISTTIMEFORMAT='%F %T '


export EDITOR='vim'
export ALTERNATE_EDITOR=emacs
export PATH=$PATH:/usr/bin/meld:/opt/chef/bin:/opt/chef/embedded/bin
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
export PROJECT=DEBESYS
export BUMP_COOKBOOK_VERSION_AUTO_EXECUTE=1




# COMMAND ALIASES
alias cdhome='cd ~/'
alias homerepo='cd ~/home_repo'
alias cls='clear'
alias ls='ls -aFCh --color=always'
alias h='history | tail -n 500'
alias hg='history |grep'
alias vimbash='vim ~/.bashrc'
alias vbash='vim ~/.bashrc'
alias vimbp='vim ~/.bash_profile'
alias sbp='source ~/.bash_profile'
alias sbash='source ~/.bashrc'
alias vimvim='vim ~/.vimrc'
alias term='terminator -l tim --geometry 1500x900+100+30 &'
alias vimterm='vim ~/.config/terminator/config'
alias envs='echo PATH $PATH'
alias vnotes='vim ~/notes'
alias cnotes='cat ~/notes'
alias vknownhosts='vim ~/.ssh/known_hosts'
alias vkh='vim ~/.ssh/known_hosts'
alias psme='ps aux |grep tstacy'
alias st='sublime &'
alias pspts='ps aux |grep pts |grep root'
alias vimssh='vim ~/.ssh/config'
alias vimtmux='vim ~/.tmux.conf'
alias ee='emacs -nw'
alias repohook='cp ~/githome/prepare-commit-msg .git/hooks/; chmod a+x .git/hooks/prepare-commit-msg'



# DEBESYS RELATED ALIAS
alias dev='cd ~/dev-root/debesys'
alias dev2='cd ~/dev-root/debesys_two'
alias dev3='cd ~/dev-root/debesys_three'
alias dev4='cd ~/dev-root/debesys_four'
alias dev5='cd ~/dev-root/debesys_five'
alias se1='cd ~/dev-root/systemseng_one'
alias vcloud='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/vcloud_server.py'
alias S3='aws s3 ls s3://deploy-debesys'
alias mdbd='sudo mount -o user=intad/tstacy -t cifs //chifs01.int.tt.local/Share/Dead_By_Dawn /mnt/dbd/'
alias glog='git glog'
alias galias='git config --list |grep alias'
alias run='`git rev-parse --show-toplevel`/run'
alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
alias xon='external on'
alias xoff='external off'
alias bcv='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/bump_cookbook_version.py'
alias chefbootstrap='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/chef_bootstrap.py'
alias reqbootstrap='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/request_bootstrap.py'
# alias show='ttknife node show'
# alias ke='ttknife node edit'
alias tkw='tmux kill-window'
alias tkp='tmux kill-pane'
alias tsud='tmux split-window'
alias tnw='tmux_new_window'
alias tks='tmux kill-session -t'
alias td='tmux_dev_vm_deploy'
alias t='tmux_dev_vm_new'
alias tka='tmux kill-server'
alias testec2='./run python deploy/chef/scripts/ec2_instance.py -o -v'
alias ec2='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/ec2_instance.py -o -v'
alias reqdeploy='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/request_deploy.py'
alias vcenter='./run python deploy/chef/scripts/vcenter_server.py'
alias cbu='ttknife cookbook upload'
alias sn='ttknife search node'
alias hotfixer='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/hotfixer.py'
alias deploy='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/knife_ssh.py'
alias mergetest='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/check_repo.py'
alias uploadtest='./run python deploy/chef/scripts/upload_debesys.py'
alias mergemail_all='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/send_merge_email.py --send-starting-email --dev2stage --stage2uat --uat2prod'
alias mergemail_uat='./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/send_merge_email.py --send-starting-email --dev2stage --stage2uat'
alias cleantags='git tag -d $(git tag); git fetch'
alias conntester='./run python deploy/chef/scripts/connection_tester.py'



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
        alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife -C ~/.chef/knife.external.rb'
        alias ttknife
        red='\e[1;31m' # red text for the external banner
        nc='\e[0;0m'  # back to white
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
        if [ $TMUX_PANE ]; then
            rename_terminal_title "DevVM"
        else
            if [ ! -z "PRE_EXTERNAL_TERMINAL_TITLE" ]; then
                rename_terminal_title "$PRE_EXTERNAL_TERMINAL_TITLE"
            fi
        fi

        alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
        alias ttknife
        aws_keys ~/amazon_keys.sh
        export EXTERNAL_DEBESYS="disabled"
    else
        echo $usage
    fi
}




#########################################################
#### Shorcuts to do things in TMUX
#########################################################


function tmux_dev_vm_deploy()
{
    echo "tmux new -d -s dev_vm -n deploy"
    tmux new -d -s dev_vm -n deploy
    tmux select-window -t dev_vm:1
    tmux attach-session -t dev_vm
}


function tmux_dev_vm_new()
{
    if [ -z "$1" ]; then
        winname="new"
    else
        winname="$1"
    fi

    echo "tmux new -d -s dev_vm -n $winname"
    tmux new -d -s dev_vm -n "$winname"
    tmux select-window -t dev_vm:1
    tmux attach-session -t dev_vm
}


function tmux_new_window()
{
    if [ -z "$1" ]; then
        winname="new"
    else
        winname="$1"
    fi

    echo "tmux new -d -s dev_vm -n $winname"
    tmux new-window -n "$winname"
}


# function tmux_ec2()
# {
#     if [-z "$1" ]; then
#         echo "Forgot to pass arguments."
#         return
#     fi
# 
#     echo "tmux new -s launching-ec2"
#     tmux new -s "launching-ec2"
#     echo "./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/ec2_instance.py -o -v $1"
#     tmux send-keys "./run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/ec2_instance.py -o -v $1"



#############################################################
#### Common Chef Tasks Turned into functions.
#############################################################

function setchefconfig()
{
    if [ -z "$1" ]; then
        echo Invalid usage of setchefconfig, you must pass a hostname.
        return
    fi

    # Default to Internal Chef Org
    chef_config=~/.chef/knife.rb

    # Note: double-brackets [[ ]] cause == to do wildcard matching and the behavior
    # or == is different with single brackets [ ].
    if [[ $1 == ar* || $1 == ch* || $1 == ny* || $1 == fr* || $1 == sy* || $1 == sg* ]]; then
        chef_config=~/.chef/knife.external.rb
    elif [[ $1 == *"ip-10-210-0"* || $1 == *"ip-10-210-2"* || $1 == *"ip-10-210-4"* ]]; then
        chef_config=~/.chef/knife.external.rb
    elif [[ $1 == *"ip-10-213-0"* || $1 == *"ip-10-213-2"* || $1 == *"ip-10-213-4"* ]]; then
        chef_config=~/.chef/knife.external.rb
    elif [[ $1 == *"ip-10-215-0"* || $1 == *"ip-10-215-2"* || $1 == *"ip-10-215-4"* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi
}


function knife_node_edit()
{
    setchefconfig "$1"
    echo knife node edit "$1" --config $chef_config
    knife node edit "$1" --config $chef_config
}
alias ke=knife_node_edit


function knife_node_show()
{
    setchefconfig "$1"
    echo knife node show "$1" --config $chef_config
    knife node show "$1" --config $chef_config
}
alias show=knife_node_show


function search_chef_environment()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the Chef Environment and optionally a recipe.
        echo Examples: sce int-dev-cert
        echo           sce int-dev-cert cme
        return
    fi
    local search="chef_environment:$1"

    if [ ! -z "$2" ]; then
        search=$search" AND recipe:$2*"
    fi

    # Default the Chef Org to Internal
    chef_config=~/.chef/knife.rb

    if [[ $1 == ext-* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi

    echo knife search node $search --config $chef_config
    knife search node "$search" --config $chef_config -a name -a chef_environment -a ipaddress -a run_list -a tags
}
alias sce=search_chef_environment


function rmchefnode()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the node name.
        return
    fi

    echo "ttknife node delete --yes $1"
    ttknife node delete --yes "$1"

    echo "ttknife client delete --yes $1"
    ttknife client delete --yes "$1"
}


function bootstrap__()
{
    local found_dash_a=false
    # Example of bash substring match
    if [[ "$@" == *"-a"* ]]; then
        found_dash_a=true
    fi

    local found_dash_h=false
    if [[ "$@" == *"-h"* ]]; then
        found_dash_h=true
    fi

    if [ $found_dash_h == false -a $found_dash_a == false ]; then
        local title_start="bootstrapping..."
        local window=`tmux list-windows |grep "\(active\)" | cut -d" " -f 1 | sed s'/://g'`
        rename_terminal_title "$title_start"
    fi

    echo $DEPLOYMENT_SCRIPTS_REPO_ROOT/run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/request_bootstrap.py "$@"
    $DEPLOYMENT_SCRIPTS_REPO_ROOT/run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/request_bootstrap.py "$@"

    if [ $found_dash_h == false -a $found_dash_a == false ]; then
        local title_done="bootstrapping...done"
        rename_terminal_title "$title_done" "$window"
    fi
}
alias bootstrap=bootstrap__



function chefbootstrap__()
{
    local found_dash_a=false
    # Example of bash substring match
    if [[ "$@" == *"-a"* ]]; then
        found_dash_a=true
    fi

    local found_dash_h=false
    if [[ "$@" == *"-h"* ]]; then
        found_dash_h=true
    fi

    if [ $found_dash_h == false -a $found_dash_a == false ]; then
        local title_start="bootstrapping..."
        local window=`tmux list-windows |grep "\(active\)" | cut -d" " -f 1 | sed s'/://g'`
        rename_terminal_title "$title_start"
    fi

    echo $DEPLOYMENT_SCRIPTS_REPO_ROOT/run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/chef_bootstrap.py "$@"
    $DEPLOYMENT_SCRIPTS_REPO_ROOT/run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/chef_bootstrap.py "$@"

    if [ $found_dash_h == false -a $found_dash_a == false ]; then
        local title_done="bootstrapping...done"
        rename_terminal_title "$title_done" "$window"
    fi
}
alias chefbootstrap=chefbootstrap__





# safely remove a git branch
function rmbr()
{
    for do_not_delete in master origin/master uat/current origin/uat/current release/current origin/release/current develop origin/develop
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


function killpts()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the pts number.
        return
    fi

    echo 'skill -KILL -t pts/$1'
    skill -KILL -t pts/"$1"
    pspts
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
    sshpass -p Tt12345678 ssh -o StrictHostKeyChecking=no ttadmxxx100@$ilo_ip "power reset"
    rename_terminal_title "Dev VM"
}


function awsauth() {
    $($DEPLOYMENT_SCRIPTS_REPO_ROOT/run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/aws_authenticator.py --env --account $@)
    AWS_ACCOUNT_INFO="(aws:$AWS_ACCOUNT)"
    export AWS_ACCOUNT_INFO
}


function clearaws() {
    export AWS_ACCOUNT=""
    export AWS_ACCOUNT_INFO=""
    source ~/amazon_keys.sh
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

umask 002





