# Ryan's Dotfiles

This repository (based on Dries) serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Look through mine, or take a look at the post by Dries to start building your own.

📖 Read the blog post: https://driesvints.com/blog/getting-started-with-dotfiles  
📹 Watch the screencast on Laracasts: https://laracasts.com/series/guest-spotlight/episodes/1

## Your own fresh setup

Please view Dries in-depth [README](https://github.com/driesvints/dotfiles) for more 

> Note: The "clean install" article has you format your USB drive as APFS, but the bootable media for MacOS Catalina does NOT support it. Stick with the first option.

## Dotfiles contents
[`.zshrc`](./.zshrc): The [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization) settings

[`.macos`](./.macos): Basically sets up all your mac settings and defaults.
You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

[`Brewfile`](./Brewfile): Adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

[`aliases.zsh`](./aliases.zsh): add your own aliases. If you need to tweak your `$PATH` check out the [`path.zsh`](./path.zsh) file. These files get loaded in because the `$ZSH_CUSTOM` setting points to the `.dotfiles` directory.

Backup all your app settings with Mackup. and backup your settings with the commands below. My backup goes to Google Drive, but they suppor Dropbox and iCloud as well. [Checkout the documentation](https://github.com/lra/mackup/blob/master/doc/README.md#storage). Also make sure your `.zshrc` file is symlinked from your dotfiles repo to your home directory. 

## Thanks To...

[Dries Vints](https://github.com/driesvints/dotfiles) - Go check out his content for his setup.
