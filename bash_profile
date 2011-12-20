# Prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1="\u@\h:\w \$(parse_git_branch) $ "

# Bundler editor
export BUNDLER_EDITOR=mate

# RVM if present
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

source ~/.aliases
