# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ $OSTYPE == darwin* ]]
then
    ZSH_THEME="cliff-mac"
else
    prof_file=$(print /etc/*-release) 2>/dev/null
    if [[ -z $prof_file ]]
    then
        ZSH_THEME="cliff-linux"
    else
        if [[ $(cat `echo $prof_file`) =~ .*Ubuntu.* ]]
        then
            ZSH_THEME="cliff-ubuntu"
        elif [[ $(cat `echo $prof_file`) =~ .*Arch.* ]]
        then
            ZSH_THEME="cliff-arch"
        else
            ZSH_THEME="cliff-linux"
        fi
    fi
    unset prof_file
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=()

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# path
if [[ $OSTYPE == darwin* ]]
then
    export PATH=$HOME/local/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
else
    export PATH=$HOME/local/bin:$HOME/bin:$PATH
fi

if [[ $OSTYPE == cygwin ]]
then
    export CYGWIN=nodosfilewarning
    # virtualenvwrapper
    export VIRTUALENVWRAPPER_PYTHON="/cygdrive/c/Python/26/python.exe"
    export VIRTUALENVWRAPPER_VIRTUALENV="/cygdrive/c/Python/26/Scripts/virtualenv.exe"
    source "$HOME/dev/virtualenvwrapper/virtualenvwrapper.sh"
    # vim
    mvim()  {
        run mintty -c ~/.viminttyrc -i ~/.vim/vim.ico -e vim $@
       }
    alias open=cygstart
else
    if type virtualenvwrapper.sh 2>&1 >/dev/null
    then
        export VIRTUALENVWRAPPER_PYTHON=$(which python2.7)
        source $(which virtualenvwrapper.sh)
    fi
fi

#vim
alias uvim="vim -u NONE"
alias vundle="vim +BundleInstall +qall"

#GAE
if [[ $OSTYPE == darwin* ]]
then
    GAE="/Applications/GoogleAppEngineLauncher.app"
    GAE=$GAE"/Contents/Resources/GoogleAppEngine-default.bundle"
    GAE=$GAE"/Contents/Resources/google_appengine"
    if [[ -d $GAE ]]
    then
        export GAE
        cdgae() {
            cd $GAE
        }
    fi
fi

#tmux
alias tmux="TERM=screen-256color-bce tmux"

#ssh reverse tunneling
alias sshl="ssh -R 19999:localhost:22"

#rvm
if [[ -d $HOME/.rvm ]]
then
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

#rbenv
if [[ -d $HOME/.rbenv ]]
then
    PATH=$HOME/.rbenv/shims:$PATH
    eval "$(rbenv init -)"
fi

#npm
if [[ -d /usr/local/share/npm/bin ]]
then
    PATH=/usr/local/share/npm/bin:$PATH
fi


function _all_vms() {
    reply=(`VBoxManage list vms | awk '{gsub("\"",""); print $1}'`)
}

function _running_vms() {
    reply=(`VBoxManage list runningvms | awk '{gsub("\"",""); print $1}'`)
}

function startvm {
    VBoxManage startvm $1 --type=headless
}
compctl -K _all_vms startvm

function poweroffvm {
    VBoxManage controlvm $1 poweroff
}
compctl -K _running_vms poweroffvm

function controlvm {
    VBoxManage controlvm $1 $2
}
compctl -K _all_vms controlvm

function removevm {
    VBoxManage unregistervm $1 --delete
}
compctl -K _all_vms removevm

#puppet
alias puppet-onetime="puppet agent --onetime --verbose --no-daemonize"

#git
alias g="git"

#show the rear of a file
function rear {
python -c "ff=open('$1', 'rb'); ff.seek(-$2,2); print ff.read($2)"
}
