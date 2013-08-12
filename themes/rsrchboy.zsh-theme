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

local _is="$reset_color$FG[239]"

#ZSH_THEME_SEP="%{$reset_color%})─("
ZSH_THEME_SEP="$_is)─("

# ZSH_THEME_RVM_PROMPT_* {{{1
ZSH_THEME_RVM_PROMPT_OPTIONS='i v g'
ZSH_THEME_RVM_PROMPT_PREFIX=" ${_is}using$FG[243] ‹"
ZSH_THEME_RVM_PROMPT_SUFFIX="›%{$reset_color%}"
# 1}}}
# ZSH_THEME_PERL_PROMPT_* {{{1
ZSH_THEME_PERL_PROMPT_PREFIX="$reset_color$fg[green]"
ZSH_THEME_PERL_PROMPT_SUFFIX=""
# 1}}}
# ZSH_THEME_GIT_PROMPT_* {{{1

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="$reset_color$fg_bold[green]✔"
ZSH_THEME_GIT_PROMPT_DIRTY="$reset_color$fg_bold[red]±"

ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"

#ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖ deleted,"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ± modified%{$_is%},"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜ renamed,"
ZSH_THEME_GIT_PROMPT_STASHED="${reset_color}ST,"
ZSH_THEME_GIT_PROMPT_ADDED="${fg[green]}✚,"
ZSH_THEME_GIT_PROMPT_DELETED="${fg[red]}✖,"
ZSH_THEME_GIT_PROMPT_MODIFIED="${fg[blue]}±,"
ZSH_THEME_GIT_PROMPT_RENAMED="${fg[magenta]}➜ "
ZSH_THEME_GIT_PROMPT_UNMERGED="${fg[yellow]}═ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="${fg[cyan]}? "

#ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[red]%}(!)%{$_is%}"
#ZSH_THEME_GIT_PROMPT_BEHIND=" %{$fg[red]%}(!)%{$_is%}"
#ZSH_THEME_GIT_PROMPT_DIVERGED=" %{$fg[red]%}(!)%{$_is%}"
#ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$_is%}and %{$fg[magenta]%}↑ should push %{$_is%}to%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$_is%}and %{$fg_bold[magenta]%}↓ should pull%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$_is%}and %{$fg_bold[magenta]%}↕ should rebase%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="$fg[magenta]↑ should push "
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="$fg[magenta]↓ should pull$reset_color "
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$fg[magenta]↕ should rebase$reset_color "

# Format for git_prompt_ahead()
#ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg[red]%}(!)%{$_is%}"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="$_is at ‹"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="›$ZSH_THEME_SEP"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_TRACKING_BEFORE="${_is}tracking $fg[cyan]"
ZSH_THEME_GIT_PROMPT_TRACKING_AFTER="$ZSH_THEME_SEP"

#ZSH_THEME_GIT_PROMPT_STATUS_PREFIX
# 1}}}

# ancillary functions {{{1
function git_upstream_tracking {
    TRACKING="$(command git rev-parse --verify @{upstream} --symbolic-full-name 2>/dev/null)" &&
        echo "$ZSH_THEME_GIT_PROMPT_TRACKING_BEFORE${TRACKING/refs\//}$ZSH_THEME_GIT_PROMPT_TRACKING_AFTER"
}
# 1}}}

local          git_info='$(git_prompt_info)'
local        git_status='$(git_prompt_status)'
local git_remote_status='%{$reset_color%}$(git_remote_status)'
local git_tracking_info='$(git_upstream_tracking)'
local     git_short_sha='$(git_prompt_short_sha)'
local         perl_info='$(perl_prompt_info)'
local          rvm_info='$(rvm_prompt_info)'

local user_info="$FG[040]%n$_is at $reset_color$FG[033]%m$reset_color"
local git_info1="$reset_color$terminfo[bold]$FG[226]$git_info$git_short_sha$reset_color"

local jobs_info="%(1j.$fg[red]%j job%(2j.s.)$ZSH_THEME_SEP.)"

local user_info2="$FG[040]%n$reset_color$fg[brown]@$FG[033]%m$reset_color$fg[brown]:$fg[yellow]%~$reset_color"

# the actual prompt :)
PROMPT="$_is
╭─($git_info1$git_status$git_remote_status$git_tracking_info$jobs_info$perl_info$rvm_info$_is)
╰─($user_info2$_is)─%(!.$fg_bold[red]PRIV>>.>>) $reset_color"
