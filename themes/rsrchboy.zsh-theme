# /* vim: set foldmethod=marker : */

# Originally based on the Fino theme by Max Masnick (http://max.masnick.me)

# Use with a dark background and 256-color terminal!
# Meant for people with Perl, RVM (maybe?) and git.

#autoload -U add-zsh-hook
#add-zsh-hook chpwd prompt_chpwd # update remotes only when changing dir

#function theme_precmd {

setopt prompt_subst
setopt PROMPT_PERCENT
setopt RE_MATCH_PCRE

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
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}\n| %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=""
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}%{$fg[green]%}✔%{$_is%} with %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg[red]%}±%{$_is%} with "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}±"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} %{$_is%}with "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "

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
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$_is%}and %{$fg[magenta]%}↑ should push %{$_is%}to%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$_is%}and %{$fg_bold[magenta]%}↓ should pull%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$_is%}and %{$fg_bold[magenta]%}↕ should rebase%{$reset_color%} "

# Format for git_prompt_ahead()
#ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[red]%}(!)%{$_is%}"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_TRACKING_BEFORE="  %{$_is%}tracking %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_TRACKING_AFTER="%{$reset_color%}"

# 1}}}
ZSH_THEME_GIT_PROMPT_TRACKING_BEFORE="  %{$_is%}tracking %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_TRACKING_AFTER="%{$reset_color%}"

#local tracking='${$(command git rev-parse --verify @{upstream} --symbolic-full-name 2>/dev/null)/^refs\//}'
function git_upstream_tracking {
    echo "$(command git rev-parse --verify @{upstream} --symbolic-full-name 2>/dev/null)"
}

ZSH_THEME_PERL_PROMPT_PREFIX="%{$_is%}using %{$fg[green]%}"
ZSH_THEME_PERL_PROMPT_SUFFIX=""

function perl_prompt_info {

    # e.g.
    #PERLBREW_BASHRC_VERSION=0.63
    #PERLBREW_HOME=/home/rsrchboy/.perlbrew
    #PERLBREW_LIB=trunk
    #PERLBREW_MANPATH=/home/rsrchboy/.perlbrew/libs/perl-5.16.2@trunk/man:/home/rsrchboy/perl5/perlbrew/perls/perl-5.16.2/man
    #PERLBREW_PATH=/home/rsrchboy/.perlbrew/libs/perl-5.16.2@trunk/bin:/home/rsrchboy/perl5/perlbrew/bin:/home/rsrchboy/perl5/perlbrew/perls/perl-5.16.2/bin
    #PERLBREW_PERL=perl-5.16.2
    #PERLBREW_ROOT=/home/rsrchboy/perl5/perlbrew
    #PERLBREW_VERSION=0.63
    #PERL_LOCAL_LIB_ROOT=/home/rsrchboy/.perlbrew/libs/perl-5.16.2@trunk
    #PERL5LIB=/home/rsrchboy/.perlbrew/libs/perl-5.16.2@trunk/lib/perl5

    # we assume perlbrew and local::lib, but don't check for too much else.

    # XXX: NOT FINISHED!

    #PSTAT=''

    if [ "x$PERLBREW_PERL" = "x" ] ; then
        PSTAT="system perl"
        if [ "x$PERL_LOCAL_LIB_ROOT" != "x" ] ; then
            PSTAT="$PSTAT and local::lib at ${PERL_LOCAL_LIB_ROOT/#:$HOME/~}"
        fi
    elif [ "x$PERLBREW_PERL" != "x" ] ; then
        PSTAT="$PERLBREW_PERL"
        if [ "x$PERLBREW_LIB" != "x" ] ; then
            PSTAT="$PSTAT@$PERLBREW_LIB"
        fi
    elif [ "x$PERL_LOCAL_LIB_ROOT" != "x" ] ; then
        #echo ' %{$_is%}and %{$fg[cyan]%}local::lib at' $PERL_LOCAL_LIB_ROOT
    fi
    test ! -z "$PSTAT" && echo "$ZSH_THEME_PERL_PROMPT_PREFIX$PSTAT$ZSH_THEME_PERL_PROMPT_SUFFIX"
}

local   git_info='$(git_prompt_info)'
local git_status='$(git_prompt_status)'
local git_remote_status='%{$reset_color%}$(git_remote_status)'

local git_tracking_info='$(git_upstream_tracking)'
local git_short_sha='$(git_prompt_short_sha)'

local rvm_info='$(rvm_prompt_info)'
local user_info="%{$FG[040]%}%n%{$reset_color%} %{$_is%}at%{$reset_color%} %{$FG[033]%}%m%{$reset_color%}"
local path_info="%{$_is%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}%~%{$reset_color%}"
local git_info1="%{$reset_color%}%{$terminfo[bold]$FG[226]%}$git_short_sha|$git_info%{$reset_color%}"
local jobs_info="%{$_is%}with %{$fg[red]%}%j job%(2j.s.)%{$reset_color%}"
jobs_info=" %(1j.$jobs_info .)"
local perl_info='$(perl_prompt_info)'

local user_info2="%{$FG[040]%}%n%{$reset_color%}%{$fg[brown]%}@%{$FG[033]%}%m%{$reset_color%}%{$fg[brown]%}:%{$fg[yellow]%}%~%{$reset_color%}"

# the actual prompt :)
PROMPT="
╭─$git_info1$git_status$git_remote_status$git_tracking_info$jobs_info$perl_info$rvm_info%{$reset_color%}
╰─($user_info2)─%(!.$fg_bold[red]PRIV.)>> %{$reset_color%}"
#╰─%(!.%{$fg_bold[red]%}.)(%n@%m:%~)>> %{$reset_color%}"
#╰─(%n@%(!.%{$fg_bold[red]%}.%{$FG[033]%})%m:%~)>> %{$reset_color%}"
#╰─%(!.%{$fg_bold[red]%}.)(%~)>> %{$reset_color%}"
#|  $git_info %{$_is%}=> %{$reset_color%}%{$fg[purple]%}$tracking%{$reset_color%}
#╭─%{$FG[040]%}%n%{$reset_color%} %{$_is%}at%{$reset_color%} %{$FG[033]%}%m%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}%~%{$reset_color%}$jobs_info$rvm_info
#╰─ %n@%m:%~ >> "

#╰─$(virtualenv_info)$(prompt_char) "
