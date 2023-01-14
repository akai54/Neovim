# Neovim Lua Config

This is a collection of Lua configurations for Neovim that I use to improve my workflow and productivity. These keymaps are focused on window navigation, resizing, undotree, telescope, fugitive and some other keybindings that I find useful, for my daily programming tasks.

## Installation

1. Clone this repository to your Neovim config directory (usually `~/.config/nvim`)
2. Add the following lines to your `init.lua` file: `require "user.keymaps"`

## Keybindings

### Window Navigation
- `<C-Left>` : Move cursor to the left window
- `<C-Down>` : Move cursor down to the window below
- `<C-Up>` : Move cursor up to the window above
- `<C-Right>` : Move cursor to the right window

### Resizing
- `<S-Up>` : Resize the current window by subtracting 2
- `<S-Down>` : Resize the current window by adding 2
- `<S-Left>` : Resize the current window vertically by subtracting 2
- `<S-Right>` : Resize the current window vertically by adding 2

### Undotree
- `<Leader>u` : Show the undotree

### Telescope
- `<Leader>ts` : Use Telescope's live_grep feature
- `<Leader>tw` : Use Telescope's grep_string feature
- `<Leader>tf` : Use Telescope's find_files feature
- `<Leader>te` : Use Telescope's git_files feature
- `<Leader>tc` : Use Telescope's git_commits feature with previewer=false
- `<Leader>to` : Use Telescope's oldfiles feature
- `<Leader>tp` : Use Telescope's projects feature
- `<Leader>tb` : Use Telescope's buffers feature
- `<Leader>tr` : Use Telescope's resume feature

Check the `keymaps.lua` for the complete list of keymaps.

## Get healthy

Open `nvim` and enter the following:

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

### Fixing copy/paste

#### On Mac
`pbcopy` should be builtin

#### On Ubuntu
```sh
sudo apt install xsel
```
#### On Arch Linux
```sh
sudo pacman -S xsel
```

### Installing support for Python and Node

#### Neovim python support
```sh
pip install pynvim
```

#### Neovim node support
```sh
npm i --location=global neovim
```
