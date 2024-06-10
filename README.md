# VIM light configuration

:!: Require VIM 8+ version

VIM configuration usable on servers. Require some steps to deploy :

1.Clone this repository : `git clone https://github.com/vfricou/vim_config.git ~/.vim`
2. Clone vim-airline plugin : `git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline`
3. Clone nerttree plugin : `git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree`
4. Clone nerdcommenter plugin : `git clone https://github.com/preservim/nerdcommenter.git ~/.vim/pack/vendor/start/nerdcommenter`
5. Install vim-airline helptags : `vim -u NONE -c ":helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q`
6. Install nerdtree helptags : `vim -u NONE -c ":helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q`
7. (optional) link vimrc configuration file : `ln -s ~/.vim/vimrc ~/.vimrc`

Step `7` is necessary on certains OS to get valid configuration loading.

## Bulk installation

```shell
git clone https://github.com/vfricou/vim_config.git ~/.vim
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
git clone https://github.com/preservim/nerdcommenter.git ~/.vim/pack/vendor/start/nerdcommenter
vim -u NONE -c ":helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q
vim -u NONE -c ":helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
ln -s ~/.vim/vimrc ~/.vimrc
```

## Features

- Enable syntax highlighting
- Display lines relative number
- Force tab to 4 chars
- Expand tabs to spaces
- Enable smartindent
- Enable intelligent backspace
- Display cursorline
- Enable file backup
- Enable modeline
- Highlight redundant spaces (trailing spaces)
- Display files in unix format (`^M` will displayed for DOS formatted files)
- Enable matching brackets displaying
- Enable spell check for en/fr lang
- Define default file encoding to UTF-8
- Enable line wrap
- Enable search highlight
- Plugin vim-airline
- Plugin NERDTree
- Plugin NERDCommenter

## Keybinding

| Sequence  | Description                            |
|-----------|----------------------------------------|
| `F7`      | Enable/Disable spellcheck              |
| `F8`      | Toggle spell lang en/fr                |
| `S-Left`  | Switch to previous buffer              |
| `S-Right` | Swithc to next buffer                  |
| `F2`      | Display and switch to NERDTree panel   |
| `S-Tab`   | Toggle line comment with NERDCommenter |
| `F3`      | Append modeline to file                |