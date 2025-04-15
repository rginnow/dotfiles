# Intro

These repo helps me maintain my current setup on my Macbook Pro, which helps quickly set up any new computer I get. The installation script helps take care of everything.

Eventually, it will become a bit more cross platform as I continue to build out my tooling for the different shells:

- fish
- bash
- zsh

## What are Dotfiles?

Essentially, these are just configuration files that store my preferences for all my applications and tools. There's a couple different reasons for dotfiles:

- Consistency: ensure that you use the same things across multiple computers
- Time Efficiency: Less manual labor during setup, more time for fun stuff
- Version Control: track your changes over time, revert when  necessary
- Share & Learn: open collaboration is how we innovate and learn

Read up on dotfiles from [this post by Dries Vints](https://driesvints.com/blog/getting-started-with-dotfiles)

## Getting Started

> [!WARNING]
> My dotfiles are under active construction, so use caution if you copy my stuff. Some things may not be fully tested!

### Installation

1. Clone the repository
2. Run the install script
3. Profit

```shell
./install
```

### Core Components

There are some main components that make up this repo:

- [Homebrew](homebrew/Brewfile): Holds a list of software and tooling to be installed using Homebrew on MacOS - useful for a fresh start
- [Ghostty](ghostty/config): Minimal config for the [Ghostty terminal emulator](https://ghostty.org/)
- [tmux](tmux): A basic tmux config (based off Jess Archer's dotfiles)
- [nvim](nvim): A simple nvim config that I'm building based off of the [kickstart](https://github.com/nvim-lua/kickstart.nvim) config, and other TJ/Primeagen settings and configs.
- ...and a variety of other components that make it nicer when using the terminal.

### Older Components

I don't use these mainly anymore, but they still exist here in case I want to switch back.

- [zsh & oh-my-zsh](zsh/zshrc): Custom ZSH config with aliases, Oh-My-ZSH, a Powerlevel10k theme, and plugins.
- [kitty](kitty): Minimal config for the [kitty terminal emulator](https://sw.kovidgoyal.net/kitty/)

## Special Thanks

Some wonderful people I've gotten ideas for my config files from:

- [Jess Archer](https://github.com/jessarcher/dotfiles)
- [Dries Vints](https://github.com/driesvints/dotfiles)
- [Mattmc3](https://github.com/mattmc3/dotfiles)
- [Michael Dyrynda](https://github.com/michaeldyrynda/dotfiles)
- [Alicia Sykes](https://github.com/Lissy93/Brewfile)
