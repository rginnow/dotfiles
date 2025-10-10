set -q MY_ABBRS_INITIALIZED; and return

# generic aliases
abbr -a -- zz exit
abbr -a -- vim nvim
abbr -a -- reload source $__fish_config_dir/config.fish

abbr -a -- cfc "rm -rf $__fish_cache_dir && exit"

abbr -a --position anywhere -- -h "-h 2>&1 | bat --language=help --style=plain"
abbr -a --position anywhere -- --help "--help 2>&1 | bat --language=help --style=plain"

# reset project
abbr -a -- fresh "rm -rf node_modules && rm -rf vendor && npm install && composer install"

# single key
abbr -a -- g git
abbr -a -- c clear
abbr -a -- h history

# quick nav
abbr -a -- lib "cd $HOME/Library"
abbr -a -- library "cd $HOME/Library"

abbr -a -- proj "cd $HOME/Code"
abbr -a -- projects "cd $HOME/Code"

#abbr -a -- site "cd $HOME/Code"
#abbr -a -- sites "cd $HOME/Herd"

abbr -a -- dot "cd $DOTFILES"
abbr -a -- dotf "cd $DOTFILES"
abbr -a -- dotfiles "cd $DOTFILES"

abbr -a -- fconf "cd $__fish_config_dir"
abbr -a -- fishconf "cd $__fish_config_dir"

# date/time
abbr -a -- today "date +%Y-%m-%d"
abbr -a -- datetime "date +%Y-%m-%dT%H:%M:%SZ"
abbr -a -- ymd "date +%Y%m%d"

# git
abbr -a -- wip "git add --all && git commit -m 'wip'"
abbr -a -- commit "git add --all && git commit -m"
abbr -a -- amend "git add --all && git commit --amend --no-edit"
abbr -a -- resolve "git add --all && git commit --no-edit"
abbr -a -- squash "git rebase -i HEAD~"
abbr -a -- stash "git stash -u"
abbr -a -- pop "git stash pop"
abbr -a -- yoink "git cherry-pick"
abbr -a -- nah "git reset --hard && git clean -df"
abbr -a -- current "git branch | grep \"^*\" | awk '{ print $2 }'"

# no need to run over-and-over
set -g MY_ABBRS_INITIALIZED true
