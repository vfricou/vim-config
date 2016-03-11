Vim full configuration for user
======

This repository contain a full functionnal configuration for vim.

## Installation

### Prerequisites
To get this configuration and use it, you’ll install first the powerlines fonts.

### Cloning configuration
Next, you’ll clone this repository **INCLUDING** the submodules them is other git repositories.
> git clone --recursive https://github.com/vfricou/vim_config ~/.vim/

### Linking vimrc
When the repository is clones and all the submodules, you just make a link of vimrc file.
> ln -s ~/.vim/vimrc ~/.vimrc

## Include
This configuration include some configurations and plugins.
- Autoclosing of pairing chars such : () {} [] "" '' <> «»
- Autoclosing of balise for html code. (Actually necessary to get module on https://github.com/vfricou/vim_config)
- Set line number in file in mode "relative" (active line was always 0). Helpfull to copy/cut.
- Set tabulation spacing to four space lenght.
- Set intelligent indentation
- Automatic creation of backup file at current location (file suffixed by ~)
- Highlight redundant spaces, ending spaces, special spaces.
- Display EOL from DOS format
- DispalyDisplay EOL from DOS format
- Dispaly matching brackets.
- Enable spell checking for English or French (Activable or not with keybinding)
- Disable auto line wrapping (displaying option)
- Set undolevel to 256
- Set highlightning of search (Matchs)
- Plugin NERDTree to open pane with vim
- Changing airline color to 'serene' for a less intrusive colorscheme of airline

## Warning
Powerline font not work correctly with urxvt and probably xterm. So, in vim, you’ll probably have artefact instead of correct separator chars.
