# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ $OSTYPE == darwin* ]]
then
    ZSH_THEME="cliff-mac"
elif [[ $(cat /etc/*-release) =~ .*Ubuntu.* ]]
then
    ZSH_THEME="cliff-ubuntu"
elif [[ $(cat /etc/*-release) =~ .*Arch.* ]]
then
    ZSH_THEME="cliff-arch"
else
    ZSH_THEME="cliff-linux"
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
    if [[ -d /usr/local/share/python ]]
    then
        export PATH=$HOME/bin/:/usr/local/share/python:/usr/local/bin:$PATH
    else
        export PATH=$HOME/bin:/usr/local/bin:$PATH
    fi
else
    export PATH=$HOME/bin:$PATH
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
    if [[ -s $HOME/dev/virtualenvwrapper/virtualenvwrapper.sh ]] 
    then
        export VIRTUALENVWRAPPER_PYTHON=$(which python2.7)
        source $HOME/dev/virtualenvwrapper/virtualenvwrapper.sh
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

#rvm
if [[ -d $HOME/.rvm ]]
then
    PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
