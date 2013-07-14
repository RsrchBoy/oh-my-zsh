# /* vim: set foldmethod=marker : */

# Originally based on the Fino theme by Max Masnick (http://max.masnick.me)

# Use with a dark background and 256-color terminal!
# Meant for people with Perl, RVM (maybe?) and git.

#autoload -U add-zsh-hook
#add-zsh-hook chpwd prompt_chpwd # update remotes only when changing dir

#function theme_precmd {



setopt prompt_subst
#setopt promptsubst

local _is="$FG[239]"

# ZSH_THEME_RVM_PROMPT_* {{{1
ZSH_THEME_RVM_PROMPT_OPTIONS='i v g'
ZSH_THEME_RVM_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RVM_PROMPT_SUFFIX="›%{$reset_color%}"
# 1}}}
# ZSH_THEME_GIT_PROMPT_* {{{1

# Format for git_prompt_info()
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
#ZSH_THEME_GIT_PROMPT_DIRTY=""
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]$fg[faint]%}✘"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘"
#ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}git|"
#ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}±±±|"
#ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[green]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔ %{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘ %{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}%{$fg[green]%}✔%{$_is%} with %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg[red]%}±%{$_is%} with "
ZSH_THEME_GIT_PROMPT_PREFIX="\n| %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} %{$_is%}with "

#ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖ deleted,"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ± modified%{$_is%},"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜ renamed,"
ZSH_THEME_GIT_PROMPT_STASHED="%{$reset_color%}ST,"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚,"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖,"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}±,"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}? "

#ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[red]%}(!)%{$_is%}"
#ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg[red]%}(!)%{$_is%}"
#ZSH_THEME_GIT_PROMPT_DIVERGED=" %{$fg[red]%}(!)%{$_is%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="// %{$fg[magenta]%}↑ should push%{$reset_color%} // "
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="// %{$fg_bold[magenta]%}↓ should pull%{$reset_color%} //"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="// %{$fg_bold[magenta]%}↕ should rebase%{$reset_color%} //"

# Format for git_prompt_ahead()
#ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[red]%}(!)%{$_is%}"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_TRACKING_BEFORE="  %{$_is%}tracking %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_TRACKING_AFTER="%{$reset_color%}"

# 1}}}

#local tracking='${$(command git rev-parse --verify @{upstream} --symbolic-full-name 2>/dev/null)/^refs\//}'
function git_upstream_tracking {
    echo "$(command git rev-parse --verify @{upstream} --symbolic-full-name 2>/dev/null)"
}

function perl_setup {

    # we assume perlbrew and local::lib, but don't check for too much else.

    if [ "x$PERL_LOCAL_LIB_ROOT" != "x" ] ; then
        print -P ' %{$_is%}and %{$fg[cyan]%}local::lib at' $PERL_LOCAL_LIB_ROOT
    fi
}

#local tracking="$(git rev-parse --verify @{upstream} --symbolic-full-name 2>/dev/null)"
local tracking='$(_tracking_upstream)'

local   git_info='$(git_prompt_info)'
local git_status='$(git_prompt_status)'
local git_remote_status='%{$reset_color%}$(git_remote_status)'
local   rvm_info='$(rvm_prompt_info)'
local perl_gen_info='$(perl_setup)'

local git_tracking_info='$(git_upstream_tracking)'

local user_info="%{$FG[040]%}%n%{$reset_color%} %{$_is%}at%{$reset_color%} %{$FG[033]%}%m%{$reset_color%}"
local path_info="%{$_is%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}%~%{$reset_color%}"
local jobs_info="%{$_is%}with %{$fg[green]%}%j job(s)%{$reset_color%}"
local perl_info="%{$_is%}using %{$fg[cyan]%}system perl"



# the actual prompt :)
PROMPT="
╭─$user_info $path_info $jobs_info $perl_info$perl_gen_info$rvm_info$git_info$git_status$git_remote_status$git_tracking%{$reset_color%}
╰─(%~)>> "
#|  $git_info %{$_is%}=> %{$reset_color%}%{$fg[purple]%}$tracking%{$reset_color%}
#╭─%{$FG[040]%}%n%{$reset_color%} %{$_is%}at%{$reset_color%} %{$FG[033]%}%m%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}%~%{$reset_color%}$jobs_info$rvm_info
#╰─ %n@%m:%~ >> "

#╰─$(virtualenv_info)$(prompt_char) "
