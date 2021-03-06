# rsrchboy.zsh-theme

# Borrowing^WStealing shamelessly from these oh-my-zsh themes:
#   fino
#   agnoster

# XXX ???
autoload -U colors
colors

autoload -U add-zsh-hook

# for job-related information
zmodload zsh/mapfile zsh/pcre zsh/parameter

#setopt PROMPT_PERCENT
setopt PROMPT_SUBST
setopt RE_MATCH_PCRE

## Environment Variables

# A few utility functions to make it easy and re-usable to draw segmented prompts

# Env. variables that impact theme prompts {{{1

# Delete all existing ZSH_THEME vars
unset RPROMPT PROMPT `set | grep -a ZSH_THEME | sed -e 's/=.*$//'`

### Fonts & Icons:

# see also: https://github.com/gabrielelana/dotfiles/blob/master/zsh/plugins/git/git.plugin.zsh
GIT_AHEAD_SYMBOL="\u${CODEPOINT_OF_AWESOME_ARROW_UP}"
GIT_BEHIND_SYMBOL="\u${CODEPOINT_OF_AWESOME_ARROW_DOWN}"
GIT_DIVERGED_SYMBOL="\u${CODEPOINT_OF_AWESOME_CARET_LEFT}\u${CODEPOINT_OF_AWESOME_CARET_RIGHT}"
GIT_UNTRACKED_SYMBOL="\u${CODEPOINT_OF_AWESOME_UNLINK}"
GIT_DETACHED_SYMBOL="\u${CODEPOINT_OF_AWESOME_LOCK}"
GIT_UNCHANGED_SYMBOL="\u00b7"
GIT_CHANGES_SYMBOL="\u${CODEPOINT_OF_AWESOME_STAR}"
GIT_STASHED_SYMBOL="\u${CODEPOINT_OF_AWESOME_BEAKER}"
GIT_TOCOMMIT_SYMBOL="\u${CODEPOINT_OF_AWESOME_SHOPPING_CART}"
GIT_CONFLICT_SYMBOL="\u${CODEPOINT_OF_OCTICONS_DIFF}"
#GIT_GITHUB_SYMBOL="\u${CODEPOINT_OF_OCTICONS_OCTOFACE}"
#GIT_GITHUB_SYMBOL="\u${CODEPOINT_OF_OCTICONS_MARK_GITHUB}"
GIT_GITHUB_SYMBOL="\u${CODEPOINT_OF_AWESOME_GITHUB}"
#GIT_GITHUB_SYMBOL="\u${CODEPOINT_OF_AWESOME_GITHUB_SIGN}"
GIT_GIT_SYMBOL="\u${CODEPOINT_OF_OCTICONS_GIT_BRANCH}"

iGITHUB="\u${CODEPOINT_OF_AWESOME_GITHUB}"
iFROWN="\u${CODEPOINT_OF_AWESOME_FROWN}"
# iJOB="\u${CODEPOINT_OF_AWESOME_COG}"
iJOB="J"
iJOBS="\u${CODEPOINT_OF_AWESOME_COGS}"
iROOT="\u${CODEPOINT_OF_AWESOME_EXCLAMATION_SIGN}"
#iROOT="\u${CODEPOINT_OF_OCTICONS_ALERT}"
#iDESC="\u${CODEPOINT_OF_AWESOME_HDD}"
#iDESC="\u${CODEPOINT_OF_AWESOME_TAGS} "
iDESC="\u${CODEPOINT_OF_OCTICONS_LOCATION}"
#iSEP="\u${CODEPOINT_OF_AWESOME_ARROW_RIGHT}"
#iSEP="\u${CODEPOINT_OF_AWESOME_CHEVRON_RIGHT}"
#iSEP="\u${CODEPOINT_OF_AWESOME_CHEVRON_SIGN_RIGHT}"
iSEP="➜"
iOK="\u${CODEPOINT_OF_AWESOME_DOT_CIRCLE_ALT}"
#iREPO="\u${CODEPOINT_OF_AWESOME_BRIEFCASE}"
iREPO="\u${CODEPOINT_OF_AWESOME_HDD}"
iPOWER="\u${CODEPOINT_OF_AWESOME_OFF}"
iPOWER_UP="\u${CODEPOINT_OF_AWESOME_OFF}"
iPOWER_DOWN="\u${CODEPOINT_OF_AWESOME_OFF}"
iPERL="\u${CODEPOINT_OF_AWESOME_COFFEE}"
iRUBY="\u${CODEPOINT_OF_OCTICONS_RUBY}"

iSUFFIX="\u${CODEPOINT_OF_AWESOME_DOUBLE_ANGLE_RIGHT}"

### segment vars {{{

CURRENT_BG='NONE'
local tween_color="$FG[239]"

#SEGMENT_SEPARATOR_BEGIN="➜ "
SEGMENT_SEPARATOR_BEGIN="$iSEP "
SEGMENT_SEPARATOR_END=" "

# sooo lazy...
iA=$SEGMENT_SEPARATOR_BEGIN
iZ="%{%F{default}%}$SEGMENT_SEPARATOR_END"

### git vars
#
# We're not actually using any of these at the moment...

#ZSH_THEME_GIT_PROMPT_PREFIX=" "
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%}↑ should push%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%}↓ should pull%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%}↕ should rebase%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_STASHED="%{$reset_color%}ST"
#ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
#ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
#ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}±"
#ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}R"
#ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"
#ZSH_THEME_GIT_PROMPT_TRACKING_BEFORE=":"
#ZSH_THEME_GIT_PROMPT_TRACKING_AFTER

### Perl vars

#ZSH_THEME_PERL_PROMPT_PREFIX="$iPERL "
ZSH_THEME_PERL_PROMPT_PREFIX=""
ZSH_THEME_PERL_PROMPT_SUFFIX=""
ZSH_THEME_PERL_PROMPT_SYSTEM_PERL="system perl"
ZSH_THEME_PERL_PROMPT_LIB_SYMBOL="@"

### ruby/rvm vars
ZSH_THEME_RVM_PROMPT_PREFIX=""
ZSH_THEME_RVM_PROMPT_SUFFIX=""

#=

#*

## SegmentHelpers:

### Begin a segment: prompt_segment()
#
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  #if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    #echo -n "$SEGMENT_SEPARATOR_BEGIN%{$bg%F{$CURRENT_BG}%}%{$fg%}"
  #else
    #echo -n "$SEGMENT_SEPARATOR_BEGIN%{$bg%}%{$fg%}"
    #echo -n "$SEGMENT_SEPARATOR_BEGIN%{$fg%}"
  #fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n "$SEGMENT_SEPARATOR_BEGIN%{$fg%}$3%{%f%}$SEGMENT_SEPARATOR_END"
}

### TODO: End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

#*

## zsh hook definitions {{{2

add-zsh-hook precmd vcs_info
#add-zsh-hook chpwd  vcs_info
#add-zsh-hook chpwd  prompt_chpwd # update remotes only when changing dir...?
# or hook chpwd!
add-zsh-hook preexec tmux_pane_title
add-zsh-hook precmd  tmux_pane_title
#add-zsh-hook chpwd  tmux_pane_title

## Set our tmux pane title

# zsh hook attached above

function tmux_pane_title {

    [ -z $TMUX ] && return

    # local title="${vcs_info_msg_0_:-${PWD/#$HOME/~}}$vcs_info_msg_3_"
    local title="zsh: ${PWD/#$HOME/~}"

    if [ $1 ] ; then
        title+=": ${1%% *}"
    fi

    #echo -n "\ek$vcs_info_msg_3_\e\\"
    #echo -n "\ek${vcs_info_msg_3_:-${PWD/#$HOME/~}}${${1%% *}\e\\"
    echo -n "\ek$title\e\\"
}

##VCS Info (zsh module)

autoload -Uz vcs_info

### vcs styles {{{2

zstyle ':vcs_info:*' enable git hg bzr
zstyle ':vcs_info:*' max-exports 4
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' use-prompt-escapes true
#zstyle ':vcs_info:*' stagedstr '✚'
zstyle ':vcs_info:*' stagedstr "%{$fg[green]%}✚%{$reset_color%}"
#zstyle ':vcs_info:git:*' unstagedstr "%{$fg[red]%}✘%{$reset_color%}"
zstyle ':vcs_info:git:*' unstagedstr ""

# disable vcs_info on our git-annex repos
zstyle ':vcs_info:*' disable-patterns "$HOME/(|Desktop/)annex(|/*)"

# 0: repo workdir root
# 1: HEAD 'git describe ...'
# 2: detailed branch origin/tracking/ahead/behind/etc
# 3: workdir, vcs symbol, local dir
zstyle ':vcs_info:*' formats       \
    '%r' \
    '%m' \
    " %b" \
    "$iREPO %S"
    #"$iREPO %%B%S/%%b"
zstyle ':vcs_info:*' actionformats '%r %b %u%c %i %s %a'
#zstyle ':vcs_info:git+set-branch-format:*'

zstyle ':vcs_info:git*+set-message:*' hooks git-st git-remotebranch git-revision git-assemble

### vcs hooks {{{2

#### git: Show +N/-N when your local branch is ahead-of or behind remote HEAD.  {{{3

# Make sure you have added misc to your 'formats':  %m
#zstyle ':vcs_info:git*+set-message:*' hooks git-st
function +vi-git-st() {
    local ahead behind
    local -a gitstatus

    # only run once, no matter how many formats we have
    [ $user_data[vi_git_st_run] ] && return
    user_data[vi_git_st_run]=1

    # for git prior to 1.7
    # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    #(( $ahead )) && gitstatus+=( "%{$fg[green]%}+${ahead}" )
    (( $ahead )) && gitstatus+=( "%{$FG[148]%}+${ahead}%{$reset_color%}" )

    # for git prior to 1.7
    # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
    (( $behind )) && gitstatus+=( "%{$fg[red]%}-${behind}%{$reset_color%}" )

    #[ $gitstatus ] && hook_com[misc]+="${(j:/:)gitstatus}"
    user_data[branch_variance_ahead]=$ahead
    user_data[branch_variance_behind]=$behind
    test -n "$gitstatus" && user_data[branch_variance]="${(j:/:)gitstatus}"
    #user_data[gitstatus]="$(prompt_segment black default ${(j:/:)gitstatus})"
    #[ $gitstatus ] && hook_com[misc]+="$user_data[gitstatus]"

    # wtf?!
    ret=0
}

#### git: get remotes and host providers {{{3

function +vi-git-remotebranch() {

    # we still run twice?!
    [ $user_data[vi_git_remotes] ] && return
    user_data[vi_git_remotes]=1

    # config is something like:
    #
    # remote.origin.url git://github.com/robbyrussell/oh-my-zsh.git
    # remote.RsrchBoy.url git@github.com:RsrchBoy/oh-my-zsh.git
    # remote.wps.url git@git.wps.io:rsrchboy/oh-my-zsh.git
    #
    local config="$(git config --get-regexp 'remote\..+\.url')"

    # now, take it and create an associative array of remotename => provider
    # (??)

}

#### git: Show remote branch name for remote-tracking branches {{{3

#zstyle ':vcs_info:git*+set-message:*' hooks git-remotebranch

function +vi-git-remotebranch() {

    # we still run twice?!
    [ $user_data[vi_git_remotebranch] ] && return
    user_data[vi_git_remotebranch]=1

    # do we have a remote-tracking branch?
    local remote=$(git rev-parse --verify ${hook_com[branch_orig]}@{upstream} --symbolic-full-name 2>/dev/null)

    # The first test will show a tracking branch whenever there is one. The
    # second test, however, will only show the remote branch's name if it
    # differs from the local one.
    # TODO
    if [[ -n ${remote} ]] ; then
    #if [[ -n ${remote} && ${remote#*/} != ${hook_com[branch]} ]] ; then
        #hook_com[branch]="${hook_com[branch]} [${remote}]"
        #hook_com[branch]="${hook_com[branch]}:${remote}"

        # remotes/origin/topic/foo
        user_data[remote_ref]="$remote"
        # remotes/origin/topic/foo
        user_data[remote_full]="${remote#refs/remotes/}"
        # remotes/origin/topic/foo
        user_data[remote_origin]="${user_data[remote_full]%%/*}"
        # remotes/origin/topic/foo
        user_data[remote_branch]="${user_data[remote_full]#*/}"
    fi

    ret=0
}

#### git: a lengthier revision {{{3

function +vi-git-revision() {

    # only run once, no matter how many formats we have
    [ $user_data[vi_git_revision] ] && return
    user_data[vi_git_revision]=1

    #local desc
    #if

    [ "$user_data[described]" ] ||
        user_data[described]="$(git describe --all --long --dirty 2>&/dev/null)"
    ret=0
}

#### git*+set-message: assemble into our export  {{{3

function +vi-git-assemble() {
    local misc

    if (( $1 == 0 )) ; then
        misc=
    elif (( $1 == 1 )) ; then
        misc="$user_data[described]"
    elif (( $1 == 2 )) ; then

        # make our branch look all purdy
        if [ "$user_data[remote_full]" ] ; then

            # local branch, remote host type (FIXME), remote name
            hook_com[branch]="$hook_com[branch_orig]:$iGITHUB $user_data[remote_origin]"

            # only show the remote branch name iff != local branch name (sans
            # the remotes/... prefix)
            local rb_desc="${user_data[remote_branch]%%$hook_com[branch_orig]}"
            hook_com[branch]+="${rb_desc:+/}$rb_desc"
        fi
        #[[ user_data[remote_branch]="${#*/}"
        [ "$user_data[branch_variance]" ] &&
            hook_com[branch]+=" %{$reset_color%}[$user_data[branch_variance]%{$reset_color%}]"
    fi

    hook_com[misc]="$misc"
    ret=0
}

#*

## Prompt components {{{1
#
# Each component will draw itself, and hide itself if no information needs to be shown

### Context: user@hostname (who am I and where am I) {{{2
function prompt_context() {

  # FIXME get rid of this external command!
  local user=`whoami`
  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" || -n "$SSH_CONNECTION" ]]; then
    #prompt_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
    #prompt_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
    prompt_segment black red "%(!.$iROOT .)%n@%m"
    #prompt_segment black red "%n@%m (%y)"
  fi
}

### Virtualenv: current working virtualenv {{{2
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment blue black "${virtualenv_path:t}"  #"(`basename $virtualenv_path`)"
  fi
}

### rbenv info: {{{2

prompt_rubyenv() {
  local rbenv="${$(<~/.rbenv/version):-system (global)}"
  #local rbenv="${rbenv:-system (global)}"

  rbenv="${${RBENV_VERSION:+$RBENV_VERSION (shell)}:-$rbenv}"

  prompt_segment black yellow "${rbenv:+$iRUBY  $rbenv}"
}

# }}}1

#*

## Main prompt {{{

function build_prompt() {

  # stash this away...
  RETVAL=$?
  # FIXME -- pull in powr information
  source /sys/class/power_supply/BAT0/uevent 2>/dev/null
  # namespace conflict
  #source /sys/class/power_supply/AC/uevent 2>/dev/null

  echo -n "╭"
  prompt_context
  prompt_segment black magenta "${vcs_info_msg_0_}"
  prompt_segment black blue    "${vcs_info_msg_2_}"
  prompt_segment black white   "$iPOWER $POWER_SUPPLY_CAPACITY%%"
  prompt_segment black green   "$iPERL  ${$(perl_prompt_info)#perl-}"
  #prompt_segment black magenta "ruby: ${$(<~/.rbenv/version):-system}"
  #local rbenv="${$(<~/.rbenv/version):-system (global)}"
  #local rbenv="${rbenv:-system (global)}"
  prompt_rubyenv
  # local goes here
  prompt_segment black yellow  "${vcs_info_msg_1_:+$iDESC }${vcs_info_msg_1_#heads/}"
  # FIXME rbenv segment is **too slow!**
  #prompt_segment black blue "$(rbenv_prompt_info)"
  prompt_virtualenv
  # FIXME battery/power bits are slow, and defunct on my machine
  #echo -n "$SEGMENT_SEPARATOR_BEGIN$(battery_level_gauge)$SEGMENT_SEPARATOR_END"
  echo
  echo -n "╰"

  prompt_segment black 226 "${vcs_info_msg_3_:-%B${PWD/#$HOME/~}%b}"
  # echo -n                  "%(1j.$iA%{%F{cyan}%}${iJOB}%(2j. x%j.)$iZ.)"
  echo -n                  "%(1j.$iA%{%F{cyan}%}${iJOB}%(2j.x%j.)$iZ.)"
  # echo -n                  "$iA%(?.%{%F{green}%}$iOK.%{%F{red}%}$iFROWN)$iZ"
  echo -n                  "$iA%(?.%{%F{green}%}.%{%F{red}%}X)$iZ"
  echo -n "%B%(!.%{%F{red}%}#.$)%b%{%f%} "
  # echo -n "%B%(!.%{%F{red}%}.) $iSUFFIX%b%{%f%} "
}

function build_rprompt() {

    [ $vcs_info_msg_3_ ] ||
        echo -n "$(prompt_segment black yellow ${PWD/#$HOME/~})"
    echo -n "${vcs_info_msg_1_}"
}

## Final control variable settings

PROMPT='$(build_prompt)'
#RPROMPT='$(build_rprompt)n'

# 1}}}


# vim: set fdc=5 fdm=marker :
