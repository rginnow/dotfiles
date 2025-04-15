# bin

This directory holds helper scripts and additional commands.

## Base Scripts

Some useful tools:

- `create-sshkey` will build you a new SSH key using the new *ed25519* standard, prompting for your email, a name for the new key, and a passphrase.
- `shell-safe-rm` is a script I found from [mattmc3](https://github.com/mattmc3) that will attempt to safely trash, or delete your file. Not sure how reliable it is, but it seemed like something useful to include.
- `starship-theme` is a helper tool to change the starship theme by using fzf to search the themes directory and selecting it for you.
- `t` is a helper tool for tmux sessions, taken out of [Jess Archer's dotfiles](https://github.com/jessarcher/dotfiles/tree/master/scripts).

## Scheduled Scripts

> Credit to this article: [Effortlessly Automate Homebrew Updates on MacOS - Medium](https://nopnithi.medium.com/effortlessly-automate-homebrew-updates-on-macos-24941d0213d1).

This directory holds a couple of scripts to update my homebrew packages. It requires the user to register a few cron jobs.

Currently, my crontab looks a bit like this:

```plaintext
55 11 * * 1 ~/.local/bin/scheduled/clean_brew_update_logs.sh
0 12 * * 1 ~/.local/bin/scheduled/update_brew.sh > ~/.local/bin/local/brew_update_logs.txt 2>&1
```

### Explanation of the Crontab

The crontab entries above schedule two tasks to automate the maintenance of Homebrew:

1. **Log Cleanup (`clean_brew_update_logs.sh`)**
   - **Schedule:** Every Monday at 11:55 AM.
   - **Purpose:** This script cleans up old Homebrew update logs to ensure that unnecessary files do not accumulate over time.

2. **Homebrew Update (`update_brew.sh`)**
   - **Schedule:** Every Monday at 12:00 PM (noon).
   - **Purpose:** This script updates Homebrew and its installed packages. The output of this process, including any errors, is logged to `~/.local/bin/local/brew_update_logs.txt`.

These tasks ensure that Homebrew remains up-to-date and that log files are managed efficiently, all without requiring manual intervention.
