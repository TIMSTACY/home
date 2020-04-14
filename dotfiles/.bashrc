# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
ulimit -c unlimited

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# git completion and prompt scripts
source ~/githome/git-prompt.sh
source ~/githome/git-completion.sh

 if [ -f ~/amazon_keys.sh ]; then
     source ~/amazon_keys.sh
 fi

 if [ -f ~/tstacy_github_token.sh ]; then
     source ~/tstacy_github_token.sh
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
export HISTSIZE=2000000
export HISTCONTROL=ignorespace
shopt -s histappend
## export PROMPT_COMMAND="history -a;history -c;history -r;$PROMPT_COMMAND"
export HISTTIMEFORMAT='%F %T '

export EDITOR='vim'
export ALTERNATE_EDITOR=emacs
export PATH=$PATH:/usr/bin/meld:/opt/chef/bin:/opt/chef/embedded/bin
export INTAD_USER=tstacy
export INTAD_SSH_KEY=~/.ssh/id_rsa
##export INTAD_SSH_KEY=~/.ssh/tstacy_rsa_withpphrase
export FEATURE_TEST_EMAIL=tim.stacy@tradingtechnologies.com
export TT_EMAIL=tim.stacy@tradingtechnologies.com
export TTID_EMAIL=tim.stacy+--ttsa@tradingtechnologies.com
export VCD_ORG=Dev_General
export JENKINS_USER=tstacy
export DEPLOYMENT_SCRIPTS_REPO_ROOT=~/dev-root/scripts
export PDS_REPO_ROOT=~/dev-root/pds
export BOOTSTRAP_REQUESTER=tim.stacy@tradingtechnologies.com
export JOB_REQUESTER=tim.stacy@tradingtechnologies.com
# export BUILD_URL=http://tim-fake.com
export MGR='Tim Stacy'
export COST_CENTER='ENGINEERING-490'
export PROJECT=DEBESYS
export BUMP_COOKBOOK_VERSION_AUTO_EXECUTE=1
export BUMP_COOKBOOK_VERSION_NO_KNIFE_CHECK=1
export NODES_REPO_ROOT=~/dev-root/nodes
# export NODES_REPO_ROOT=~/dev-root/node_test_1
export MY_ONE_OFF_VERSION=0.1818.1818
# export MY_ONE_OFF_TAG="Testing deploy_one_off.py changes."
export TEMP_VM_CPU=2
export TEMP_VM_MEMORY=4
export TEMP_VM_CHEF_ENV="int-dev-cert"
export PRIVATE_CHEF_UPLOAD=1
export GIT_MERGE_AUTOEDIT=no
export ENABLE_POST_TO_SERVICENOW=1
export POWERDOWN_SUPPRESS_NEXT_STEPS=1
export KNIFE_SSH_ENABLE_INTERNAL_POOL=1
export JENKINS_BOT_SSH_KEY=~/.ssh/jenkins_bot_ldap_rsa
export DEVWS_SKIP_VALIDATE_REQUIREMENTS=1


# ENABLE TO SKIP DCs in KNIFE_SSH.PY
## export SKIP_DATACENTERS="chicago"


# export DAILY_BUILD_NOW_TARGET="prodfs"
export DAILY_BUILD_NOW_BRANCH="master"
# export DAILY_BUILD_NOW_ENVIRONMENTS='int-dev-cert, int-dev-sim'


if [ -f ~/.mykeys/jenkins_token ]; then
    export JENKINS_TOKEN=$(head -n 1 ~/.mykeys/jenkins_token)
fi


# COMMAND ALIASES
alias cdhome='cd ~/'
alias homerepo='cd ~/home_repo'
alias cls='clear'
alias ls='ls -aFCh --color=always'
alias h='history | tail -n 500'
alias hg='history |grep'
alias vhist='vim ~/.bash_history'
alias vimbash='vim ~/.bashrc'
alias vbash='vim ~/.bashrc'
alias vimbp='vim ~/.bash_profile'
alias sbp='source ~/.bash_profile'
alias sbash='source ~/.bashrc'
alias stmux='tmux source-file ~/.tmux.conf'
alias vimvim='vim ~/.vimrc'
alias envs='echo PATH $PATH'
alias vnotes='vim ~/notes'
alias cnotes='cat ~/notes'
alias cchef14='cat ~/chef14_notes'
alias crebasenodes='cat ~/rebase_notes'
alias cedgeurl='cat ~/cedgeurl'
alias yumnotes='cat ~/yum_notes'
alias cmercury='cat ~/mercury_notes'
alias cdeploy='cat ~/deploy_notes'
alias cupgradechef='cat ~/chefupgrade_notes'
alias cnewrepo='cat ~/newrepo_notes'
alias cdisablechef='cat ~/disablechef_notes'
alias cenablechef='cat ~/enablechef_notes'
alias vknownhosts='vim ~/.ssh/known_hosts'
alias ctmux='cat ~/tmux_notes'
alias vkh='vim ~/.ssh/known_hosts'
alias psme='ps aux |grep tstacy'
alias pspts='ps aux |grep pts |grep root'
alias vimssh='vim ~/.ssh/config'
alias vimtmux='vim ~/.tmux.conf'
alias ee='emacs -nw'
alias repohook='cp ~/githome/prepare-commit-msg .git/hooks/; chmod a+x .git/hooks/prepare-commit-msg'
alias lx='ls |xclip -i'
alias catsupersecret='cat ~/old_notes_tim'
alias kj1='kill -9 %'



# DEBESYS RELATED ALIAS
alias dev='cd ~/dev-root/debesys_one'
alias dev2='cd ~/dev-root/debesys_two'
alias dev3='cd ~/dev-root/debesys_three'
alias dev4='cd ~/dev-root/debesys_four'
alias dev5='cd ~/dev-root/debesys_five'
alias dep0='cd ~/dev-root/__deploy'
alias dep1='cd ~/dev-root/__deploy_one'
alias scripts='cd ~/dev-root/scripts'
alias nodes='cd ~/dev-root/nodes'
alias nodes2='cd ~/dev-root/nodes_two'
alias se1='cd ~/dev-root/systemseng_one'
alias ttnet='cd ~/dev-root/ttnet_one'
alias ttnet2='cd ~/dev-root/ttnet_two'
alias edgeproxy='cd ~/dev-root/EdgeProxy'
alias tailtempvm='tail -f -n 20 /var/log/debesys/temp_vm.log'
alias S3='aws s3 ls s3://deploy-debesys'
alias mdbd='sudo mount -o user=intad/tstacy -t cifs //chifs01.int.tt.local/Share/Dead_By_Dawn /mnt/dbd/'
alias glog='git glog'
alias kns='knife node show'
alias ekns='eknife node show'
alias show=node_show
alias tkw='tmux kill-window'
alias tkp='tmux kill-pane'
alias tsud='tmux split-window'
alias tnw='tmux_new_window'
alias tks='tmux kill-session -t'
alias td='tmux_dev_vm_deploy'
alias tnew='tmux_dev_vm_new'
alias tka='tmux kill-server'
alias cbu='knife cookbook upload'
alias ecbu='eknife cookbook upload'
alias sn='knife search node'
alias esn='eknife search node'
alias cleantags='git tag -d $(git tag); git fetch'
alias etimdev='knife environment edit int-dev-tstacy'
alias killmyssh='ps -ef | grep sshd | grep tstacy@ | tr -s " " | cut -d" " -f 2 | xargs kill'
alias stmux='tmux source-file ~/.tmux.conf'
alias showalltemps='knife search node "chef_environment:int-dev-sparepool AND creation_info_spare_temp_vm:true" -a cpu.total -a memory.total -a creation_info -a platform_version'
alias fakechef='__fakechef'
alias realchef='__realchef'

alias nutanix_cpu='knife ssh "(chef_environment:int-dev* OR chef_environment:int-stage* OR chef_environment:int-sqe*) AND (NOT chef_environment:int-dev-jenkins) (NOT chef_environment:*perf*) AND name:*vm* AND (NOT creation_info_machine_origin:temp_hive)" "uptime" -a ipaddress --concurrency 20 | grep -v "load average: 0."'

alias svfb='knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/set_version_from_branch.rb'
alias esvfb='eknife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/set_version_from_branch.rb'
alias rlv='knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/runlist_version.rb'
alias erlv='eknife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/runlist_version.rb'
alias addrl='knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_runlist.rb'
alias eaddrl='eknife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_runlist.rb'
alias addtag='knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_tag.rb'
alias eaddtag='eknife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_tag.rb'
alias addattribute='knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_attribute.rb'
alias eaddattribute='eknife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_attribute.rb'
alias ssh2='ssh_by_hostname'

alias t3='/opt/virtualenv/triage/bin/t3'
alias run='echo "Dont use run anymore."'
alias py2='/opt/virtualenv/devws/bin/python2'
alias py3='/opt/virtualenv/devws3/bin/python3'

# Shared bash functions
if [ -f $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/bashrc/chef.bash ]; then
    source $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/bashrc/chef.bash
fi

if [ -f $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/bashrc/devws.bash ]; then
    source $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/bashrc/devws.bash
fi
## Used for Testing
## source ~/dev-root/debesys_two/deploy/chef/scripts/bashrc/devws.bash

# Custom Alias Changes DevWK bash tools.
alias ue='devws_update_environment'
alias vc='devws_view_changes'
alias chefbootstrap='devws_chef_bootstrap -o -v'
alias knifessh='devws_knife_ssh'
alias nutanix='devws_nutanix_server -o'
alias powerdown='devws_powerdown_servers'
alias build='devws_request_build'
alias prod_decom='devws_request_prod_decom'
alias addvlan='devws_request_vlan'
alias rollback='devws_rollback'
alias tempvm='devws_tempvm'
alias ec2='devws_ec2_instance -o -v'
alias oneoff='devws_deploy_one_off --skip-package-check'
alias swarm='devws_swarm'
alias disablechef='devws_disable_chef'
alias ttus_reader='py2 $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/ttus_reader.py'

# Testing squid proxy
alias proxyoff='unset ALL_PROXY && unset HTTP_PROXY && unset HTTPS_PROXY && unset FTP_PROXY && unset http_proxy && unset https_proxy && unset ftp_proxy && env |grep -i http'
alias proxyon='export ALL_PROXY=http://proxy-gla-int-dev-coreinfra.debesys.net:3128 && export HTTP_PROXY=http://proxy-gla-int-dev-coreinfra.debesys.net:3128 && export HTTPS_PROXY=http://proxy-gla-int-dev-coreinfra.debesys.net:3128 && export FTP_PROXY=http://proxy-gla-int-dev-coreinfra.debesys.net:3128 && export http_proxy=http://proxy-gla-int-dev-coreinfra.debesys.net:3128 && export https_proxy=http://proxy-gla-int-dev-coreinfra.debesys.net:3128 && export ftp_proxy=http://proxy-gla-int-dev-coreinfra.debesys.net:3128 && env |grep -i http'


function setintad()
{
    export INTAD_PASSWORD="$1"
    clear
}


function __show_my_tempvms()
{
    run python $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/temp_vm.py --list |grep gl |awk '{print $1}' |xargs -I {} knife node show {} -a chef_environment -a run_list -a tags -a ipaddress -a platform_version;
}
alias showtemps=__show_my_tempvms


function __vim_debesys_log()
{
    if [ -z "$1" ]; then
        echo vlog log-file-name
        return
    fi

    echo vim /var/log/debesys/$1
    vim /var/log/debesys/$1
}
alias vlog=__vim_debesys_log


function __download_edgeproxy_package()
{
    if [ -z "$1" ]; then
        echo epd edgeproxy-x.x.tar
        return
    fi

    echo "aws s3 ls s3://deploy-debesys/$1 ~/edgeproxy_packages/"
    aws s3 ls s3://deploy-debesys/$1 ~/edgeproxy_packages/
}
alias epd=__download_edgeproxy_package


function __fakechef()
{
    __fake_chef_console_on
    cp -v ~/.chef/knife.training.rb.orig ~/.chef/knife.rb
    cp -v ~/.chef/knife.training.rb.orig ~/.chef/knife.external.rb
    cp -v ~/.chef/knife.training.rb.orig ~/.chef/knife.ttsdk.rb
    export BUMP_COOKBOOK_VERSION_NO_NOTES=1
    echo BUMP_COOKBOOK_VERSION_NO_NOTES has been set.
    echo
}


function __realchef()
{
    __fake_chef_console_off
    cp -v ~/.chef/knife.rb.orig ~/.chef/knife.rb
    cp -v ~/.chef/knife.external.rb.orig ~/.chef/knife.external.rb
    cp -v ~/.chef/knife.ttsdk.rb.orig ~/.chef/knife.ttsdk.rb
    export BUMP_COOKBOOK_VERSION_NO_NOTES
    echo BUMP_COOKBOOK_VERSION_NO_NOTES has been unset.
    echo
}


## function update-x11-forwarding
## {
##     if [ -z "$TMUX" ]; then
##         echo $DISPLAY > ~/.display.save
##     else
##         export DISPLAY=`cat ~/.display.save`
##     fi
## }


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


function find_spare()
{
    usage='findspare [chef_environment] [data_center_prefix] [cookbook]'
    if [ -z "$1" ]; then
        echo $usage
        return
    fi

    if [ -z "$2" ]; then
        echo $usage
        return
    fi

    if [ -z "$3" ]; then
        echo $usage
        return
    fi

    echo knife exec ~/dev-root/scripts/deploy/chef/scripts/snacks/find_spare.rb "$1" "$2" "$3" --config ~/.chef/knife.external.rb
    knife exec ~/dev-root/scripts/deploy/chef/scripts/snacks/find_spare.rb "$1" "$2" "$3" --config ~/.chef/knife.external.rb
}
alias findspare=find_spare


function __fake_chef_console_on()
{
    export PRE_EXTERNAL_PS1=$PS1
    export PRE_EXTERNAL_TERMINAL_TITLE=$CURRENT_TERMINAL_TITLE
    export PS1="\[\033[1;94m\]FAKE-CHEF-BCV-TESTING\[\033[1;36m\] \h\[\033[1;33m\]\$(__git_ps1) \[\033[1;35m\]\w \[\033[0;0m\] \n>"
    rename_terminal_title "FAKE-CHEF"
    blue='\e[1;94m' # red text for the external banner
    nc='\e[0;0m'  # back to white
    echo
    echo -e "${blue}#################################################${nc}"
    echo -e "${blue}##                                             ##${nc}"
    echo -e "${blue}##                  FAKE-CHEF                  ##${nc}"
    echo -e "${blue}##         BUMP_COOKBOOK_TESTING_MODE          ##${nc}"
    echo -e "${blue}##                                             ##${nc}"
    echo -e "${blue}#################################################${nc}"
    echo
}

function __fake_chef_console_off()
{
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
        # alias ttknife
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

        # alias ttknife='`git rev-parse --show-toplevel`/run `git rev-parse --show-toplevel`/ttknife'
        # alias ttknife
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
    tmux attach-session -d -t dev_vm
}


function tmux_dev_vm_new()
{
    if [ -z "$1" ]; then
        session_name="dev2"
    else
        session_name="$1"
    fi

    echo "tmux new -d -s $session_name -n $session_name"
    tmux new -d -s "$session_name" -n "$session_name"
    tmux select-window -t "$session_name":1
    tmux attach-session -d -t "$session_name"
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
    if [[ $1 == ar* || $1 == ch* || $1 == ny* || $1 == fr* || $1 == sy* || $1 == sg* || $1 == ln* || $1 == hk* || $1 == ty* || $1 == sp*  || $1 == bk* || $1 == ba* || $1 == se* ]]; then
        chef_config=~/.chef/knife.external.rb
    elif [[ $1 == *"ip-10-210"* || $1 == *"ip-10-213"* || $1 == *"ip-10-215"* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi
}


function pknife()
{
    knife "$@" -c ~/.chef/knife.private-int.rb;
}


function eknife()
{
    knife "$@" -c ~/.chef/knife.external.rb;
}

function kssh()
{
    knife ssh "$@" -a ipaddress -c ~/.chef/knife.rb;
}

function ttsdkknife()
{
    knife "$@" -c ~/.chef/knife.ttsdk.rb;
}

function ekssh()
{
    knife ssh "$@" -a ipaddress -c ~/.chef/knife.external.rb;
}

function node_show()
{
    if [ -z "$1" ]; then
        echo "You must provide a node name."
        return
    fi

    setchefconfig $1
    echo knife node show "$1" --config $chef_config
    knife node show "$1" -a ipaddress -a chef_environment -a run_list -a tags -a creation_info -a platform_version --config $chef_config
}

function nodesize()
{
    if [ -z "$1" ]; then
        echo "You must provide a node name."
        return 
    fi

    setchefconfig $1
    knife node show "$1" -a ipaddress -a chef_environment -a run_list -a tags -a memory.total -a cpu.total -a platform_version --config $chef_config
}

function keff()
{
    echo knife environment from file deploy/chef/environments/$1 --config ~/.chef/knife.rb
    knife environment from file deploy/chef/environments/$1 --config ~/.chef/knife.rb
}

function ekeff()
{
    echo knife environment from file deploy/chef/environments/$1 --config ~/.chef/knife.external.rb
    knife environment from file deploy/chef/environments/$1 --config ~/.chef/knife.external.rb
}

function knife_node_edit()
{
    setchefconfig "$1"
    echo knife node edit "$1" --config $chef_config
    knife node edit "$1" --config $chef_config
}
alias ke=knife_node_edit


function knife_node_search()
{
    if [ -z "$1" ]; then
        echo "You must provide a node name."
        return
    fi

    setchefconfig "$1"
    echo knife node show --config $chef_config "$1"
    knife node show --config $chef_config "$1"
}
alias ns=knife_node_show

function __show__cookbook__version()
{
    rm /tmp/cbv > /dev/null 2>&1;
    git fetch
    git show origin/$1:deploy/chef/cookbooks/$2/metadata.rb > /tmp/cbv;
    grep version /tmp/cbv
}
alias cbv="__show__cookbook__version"

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
    knife search node "$search" --config $chef_config -a name -a chef_environment -a ipaddress -a run_list -a tags -a platform_version
}
alias sce=search_chef_environment


function search_chef_environment_and_datacenter()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the Chef Environment, Recipe and DC Abbr.
        echo Example: sce int-dev-cert cme gla
        echo ""
        return
    fi
    local search="chef_environment:$1"

    if [ ! -z "$2" ]; then
        search=$search" AND recipe:$2*"
    else
        echo Usage: You must pass the Chef Environment, Recipe and DC Abbr.
        echo Example: sce int-dev-cert cme gla
        echo ""
        return
    fi

    if [ ! -z "$3" ]; then
        search=$search" AND n:$3*"
    else
        echo Usage: You must pass the Chef Environment, Recipe and DC Abbr.
        echo Example: sce int-dev-cert cme gla
        echo ""
        return
    fi

    # Default the Chef Org to Internal
    chef_config=~/.chef/knife.rb

    if [[ $1 == ext-* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi

    echo knife search node $search --config $chef_config
    knife search node "$search" --config $chef_config -a name -a chef_environment -a ipaddress -a run_list -a tags -a platform_version
}
alias scedc=search_chef_environment_and_datacenter


function show_dcs_in_chef_environment()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the Chef Environment, Recipe and Data Center.
        echo Example: sdcs int-dev-cert cme glados-a
        echo ""
        return
    fi
    local search="chef_environment:$1"

    if [ ! -z "$2" ]; then
        search=$search" AND recipe:$2*"
    else
        echo Usage: You must pass the Chef Environment, Recipe and Data Center.
        echo Example: sce int-dev-cert cme glados-a
        echo ""
        return
    fi

    if [ ! -z "$3" ]; then
        search=$search" AND data_center_name:$3*"
    else
        echo Usage: You must pass the Chef Environment, Recipe and Data Center.
        echo Example: sce int-dev-cert cme glados-a
        echo ""
        return
    fi

    # Default the Chef Org to Internal
    chef_config=~/.chef/knife.rb

    if [[ $1 == ext-* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi

    echo knife search node $search --config $chef_config
    knife search node "$search" --config $chef_config -a data_center.name |grep data_center |sort -u
}
alias sdcs=show_dcs_in_chef_environment


function search_chef_env_and_show_deployed_cb_info()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the Chef Environment and a cookbook.
        echo Example: scesdc int-dev-cert cme
        return
    fi
    local search="chef_environment:$1 AND deployed_cookbooks:$2"
    local attrs="-a chef_environment -a run_list -a ipaddress -a deployed_cookbooks.$2"

    # Default to Internal
    chef_config=~/.chef/knife.rb

    if [[ $1 == ext-* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi

    echo knife search node $search $attr --config $chef_config
    knife search node "$search" --config $chef_config $attrs
}
alias scesdc=search_chef_env_and_show_deployed_cb_info

function search_chef_env_and_show_installed_deb_app()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the Chef Environment and a cookbook.
        echo Example: scesda int-dev-cert cme
        return
    fi
    local search="chef_environment:$1 AND recipe:$2"
    local attrs="-a installed_debesys_applications.$2"

    # Default to Internal
    chef_config=~/.chef/knife.rb

    if [[ $1 == ext-* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi

    echo knife search node $search $attr --config $chef_config
    knife search node "$search" --config $chef_config $attrs
}
alias scesda=search_chef_env_and_show_installed_deb_app


function knife_environment_show_cb_version()
{
    if [ -z "$1" ]; then
        echo Usage: You must provide a Chef Environment
        echo Example: envshow int-dev-cert base
        return
    fi
    if [ -z "$2" ]; then
        echo Usage: You must provide a cookbook
        echo Example: envshow int-dev-cert base
        return
    fi

    chef_config=~/.chef/knife.rb
    if [[ $1 == ext-* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi

    echo knife environment show $1 --config $chef_config | grep $2
    knife environment show "$1" --config "$chef_config" | grep "$2"
}
alias envshow=knife_environment_show_cb_version

function show_cookbook_attributes()
{
    if [ -z "$1" ]; then
        echo Usage: You must provide an attribute file
        echo Example: show_cookbook_attributes customer_names.rb cme 1.0.0
        return
    fi
    if [ -z "$2" ]; then
        echo Usage: You must provide a cookbook
        echo Example: show_cookbook_attributes customer_names.rb cme 1.0.0
        return
    fi
    if [ -z "$3" ]; then
        echo Usage: You must provide a cookbook version
        echo Example: show_cookbook_attributes customer_names.rb cme 1.0.0
        return
    fi

    echo knife cookbook show $2 $3 attributes $1
    knife cookbook show $2 $3 attributes $1
}

function knife_search_show_nodesize()
{
    if [ -z "$1" ]; then
        echo Usage: You must provide a query
        echo scesns int-dev-cert
        echo scesns int-dev-cert cme
        return 
    fi
    local search="chef_environment:$1"

    if [ ! -z "$2" ]; then
        search=$search" AND recipe:$2*"
    fi

    chef_config=~/.chef/knife.rb

    if [[ $1 == ext-* ]]; then
        chef_config=~/.chef/knife.external.rb
    fi

    echo knife search node $search --config $chef_config
    knife search node "$search" --config $chef_config -a name -a chef_environment -a ipaddress -a run_list -a tags -a cpu.total -a memory.total -a platform_version
}
alias scesns=knife_search_show_nodesize


function private_edge()
{
    if [ -z "$1" ]; then
        echo "Usage: private_edge [on|off] node"
        return
    fi
    if [ -z "$2" ]; then
        echo "Usage: private_edge [on|off] node"
        return
    fi

    if [ "on" == "$1" ]; then
        knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_attribute.rb "name:$2" add haproxy.skip_haproxy _true_ 2> /dev/null
        knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_attribute.rb "name:$2" add haproxy.weight 0 2> /dev/null
        knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_attribute.rb "name:$2" add edgeserver.disable_smoke_test _true_ 2> /dev/null
    fi

    if [ "off" == "$1" ]; then
        knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_attribute.rb "name:$2" remove haproxy 2> /dev/null
        knife exec $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/snacks/add_attribute.rb "name:$2" remove edgeserver 2> /dev/null
    fi
}


function rmchefnode()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the node name.
        return
    fi

    echo "knife node delete --yes $1"
    knife node delete --yes "$1"

    echo "knife client delete --yes $1"
    knife client delete --yes "$1"
}


function ermchefnode()
{
    if [ -z "$1" ]; then
        echo Usage: You must pass the node name.
        return
    fi

    echo "knife node delete --yes $1"
    knife node delete --yes "$1" --config ~/.chef/knife.external.rb

    echo "knife client delete --yes $1"
    knife client delete --yes "$1" --config ~/.chef/knife.external.rb
}


# safely remove a git branch
function rmbr()
{
    for do_not_delete in master origin/master uat/current origin/uat/current release/current origin/release/current develop origin/develop git
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
    echo "git submodule update --init --recursive";
    git submodule update --init --recursive;
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
    $(run $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/aws_authenticator.py --env --role dev --account $@)
    AWS_ACCOUNT_INFO="(aws:$AWS_ACCOUNT)"
    export AWS_ACCOUNT_INFO
}

function awsauthadmin() {
    $(run $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/aws_authenticator.py --env --role admin --account $@)
    AWS_ACCOUNT_INFO="(aws:$AWS_ACCOUNT)"
    export AWS_ACCOUNT_INFO
}

function awsauthread() {
    $(run $DEPLOYMENT_SCRIPTS_REPO_ROOT/deploy/chef/scripts/aws_authenticator.py --env --role read --account $@)
    AWS_ACCOUNT_INFO="(aws:$AWS_ACCOUNT)"
    export AWS_ACCOUNT_INFO
}

function clearaws() {
    export AWS_ACCOUNT=""
    export AWS_ACCOUNT_INFO=""
    rm /home/tstacy/.aws-keys*
    # source ~/amazon_keys.sh
}


function nicesshoff()
{
    echo "mv /home/tstacy/.ssh/config /home/tstacy/.ssh/test"
    mv /home/tstacy/.ssh/config /home/tstacy/.ssh/test
}


function nicesshon()
{
    echo "mv /home/tstacy/.ssh/test/config /home/tstacy/.ssh"
    mv /home/tstacy/.ssh/test/config /home/tstacy/.ssh
}



function test_func()
{
    local testvar=$1
    if [ $testvar != "release" ]; then
        echo "testvar does not equal release: $testvar"
    fi
    echo "testvar: $testvar"
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


