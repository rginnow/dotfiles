# ------------------------------
# GIT COMMAND GUARD
# This prevents you from running git commands from outside a repository root.
# Idea from https://www.mislam.dev/new-mac-setup-zenful-developer-experience
# ------------------------------

# List of commands that don't require being in a repo root.
allowed_commands=("init" "clone" "config" "help" "version")

git() {
  # Check if the first argument is one of the allowed commands.
  for cmd in "${allowed_commands[@]}"; do
    if [[ "$1" == "$cmd" ]]; then
      command git "$@"
      return
    fi
  done

  # For other commands, try to determine the repository root.
  local git_root
  if ! git_root=$(command git rev-parse --show-toplevel 2>/dev/null); then
    echo "Not a git repository." >&2
    return 1
  fi

  # Check if we're in the repository root.
  if [[ "$PWD" != "$git_root" ]]; then
    echo "Please run git commands from the repository root: $git_root" >&2
    return 1
  fi

  # Execute the git command normally.
  command git "$@"
}
