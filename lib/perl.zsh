# oh-my-zsh library helper file for Perl prompts and the like
#
# Chris Weyl <rsrchboy@cpan.org> 2014

ZSH_THEME_PERL_PROMPT_PREFIX=""
ZSH_THEME_PERL_PROMPT_SUFFIX=""

ZSH_THEME_PERL_PROMPT_SYSTEM_PERL="system perl"
ZSH_THEME_PERL_PROMPT_LIB_SYMBOL="@"

function perl_prompt_info {

    # there are a number of environment variables we might expect to see in a
    # typical, modern Perl environment.  Three of the more popular (and
    # mildly, at least, sane ways) options involve just using the system perl,
    # using the system perl with a local::lib-managed environment, and using
    # perlbrew (and letting it manage local::lib libraries, if any).  We can
    # expect to see things like this:

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

    # NOTE: We assume perlbrew and local::lib, but don't check for too much
    # else. If we're not using a perlbrew'ed perl, then we assume we're using
    # the system perl.  We also do not currently check for additional
    # local::lib's being used concurrently within a perlbrew environment.

    local PSTAT

    if [ -z $PERLBREW_PERL ] ; then

        # we're using the system perl
        PSTAT="$ZSH_THEME_PERL_PROMPT_SYSTEM_PERL"

        if [ $PERL_LOCAL_LIB_ROOT ] ; then
            # ...with a local::lib library
            PSTAT="$PSTAT$ZSH_THEME_PERL_PROMPT_LIB_SYMBOL${PERL_LOCAL_LIB_ROOT/#:$HOME/~}"
        fi

    elif [ $PERLBREW_PERL ] ; then

        # we're using a perlbrew'ed perl
        PSTAT="$PERLBREW_PERL"

        if [ $PERLBREW_LIB ] ; then
            # ...with a perlbrew library
            PSTAT="$PSTAT$ZSH_THEME_PERL_PROMPT_LIB_SYMBOL$PERLBREW_LIB"
        fi
    fi

    # only print if we actually have anything interesting to print
    test -n "$PSTAT" && echo "$ZSH_THEME_PERL_PROMPT_PREFIX$PSTAT$ZSH_THEME_PERL_PROMPT_SUFFIX"
}

# fin...
