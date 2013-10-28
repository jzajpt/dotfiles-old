# Prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\u@\h:\w \$(parse_git_branch) $ "

# Editor
export EDITOR=vim
export BUNDLER_EDITOR=mate

# RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Define Vim wrappers which unsets GEM_HOME and GEM_PATH before
# invoking vim and all known aliases
#
# @author Wael Nasreddine <wael.nasreddine@gmail.com>
function define_vim_wrappers()
{
  vim_commands=(
    eview evim gview gvim gvimdiff gvimtutor rgview
    rgvim rview rvim vim vimdiff vimtutor xxd mvim
  )
  for cmd in ${vim_commands[@]}; do
    cmd_path=`/usr/bin/env which -a "${cmd}" 2>/dev/null | grep '^/'`
    if [ -x "${cmd_path}" ]; then
      eval "function ${cmd} () { (unset GEM_HOME; unset GEM_PATH; $cmd_path \$@) }"
    fi
  done
}
# define_vim_wrappers

source ~/.aliases

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PGHOST=localhost

