# af-magic.zsh-theme
#
# Author: Andy Fleming
# URL: http://andyfleming.com/
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme
#
# Created on:		June 19, 2012
# Last modified on:	June 20, 2012


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

if [ $UID -eq 0 ]
then
    NCOLOR="red"
else
    NCOLOR="green"
fi
local return_code="%(?..%{$fg[red]%}[%?]%{$reset_color%})"

# primary prompt
PROMPT='$my_gray------------------------------------------------------------%{$reset_color%}
$FG[032]%~\
$(git_prompt_info) \
${return_code}$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'



# right prompt
RPROMPT='$my_gray%n@%m[%*]%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
