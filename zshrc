# Path to your oh-my-zsh configuration.
ZSH=$HOME/dev/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ $OSTYPE == darwin* ]]
then
    ZSH_THEME="af-magic"
else
    ZSH_THEME="dst"
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
DISABLE_AUTO_TITLE="true"

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
    [[ -s $HOME/dev/virtualenvwrapper/virtualenvwrapper.sh ]] && source $HOME/dev/virtualenvwrapper/virtualenvwrapper.sh
fi

#vim
alias uvim="vim -u NONE"