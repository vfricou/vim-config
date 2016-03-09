" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim
runtime! /usr/local/share/vim/word_complete.vim
" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!


" No vi compatibility
	set nocompatible
" Syntaxic coloration
	syntax on

" Display line number
"	set number

" Display line number relative to cursor
	set relativenumber

" Set tab to 4 columns
	set tabstop=4

" Set tab to 4 columns
	set shiftwidth=4

" Set intelligent indentation
	set smartindent

" Auto indent to next lines
	set autoindent

" Intelligent backspace
	set backspace=indent,eol,start

" Indent to next tab
	set shiftround

" Display mode
	set showmode

" Display cursor
	set ruler

" Display uncomplete commands
	set showcmd

" Backup file
	set backup

" Highlight redundant whitespaces
	highlight RedundantSpaces ctermbg=lightred guibg=red
	match RedundantSpaces /\s\+$\|  \+\ze\t\| /

" always show ^M in DOS files
	set fileformats=unix

" Display matching brackets
	set showmatch

" Switch between spelling languages
function! ToggleSpellLang()
	if &spelllang =~# 'en'
		:set spelllang=fr
	else
		:set spelllang=en
	endif
endfunction
nnoremap <F7> :setlocal spell!<CR> " toggle spell on or off
nnoremap <F8> :call ToggleSpellLang()<CR> " toggle language

" Set encoding to UTF-8
	set encoding=utf-8

" No line wrap
	set nowrap

" Auto close brackets
"	" Ajout automatique de '}'
"	inoremap { {}<Left>
"	inoremap {<CR> {<CR>}<Esc>O
"	inoremap {<Right> {<Right>
"	inoremap {<End> {<End>
"	inoremap {{ {
"	inoremap {} {}
"	" Ajout automatique de ')'
"	inoremap ( ()<Left>
"	inoremap (<CR> (<CR>)<Esc>O
"	inoremap (<Right> (<Right>
"	inoremap (<End> (<End>
"	inoremap (( (
"	inoremap () ()
"	" Ajout automatique de '['
"	inoremap [ []<LEFT>
"	inoremap [<CR> [<CR>]<Esc>O
"	inoremap [<Right> [<Right>
"	inoremap [<End> [<End>
"	inoremap [[ [
"	inoremap [] []
"	" Ajout automatique de '"'
"	inoremap " ""<Left>
"	inoremap "" "
"	inoremap "<Right> "<Right>
"	inoremap "<End> "<End>
"	inoremap "<Home> "<Home>
"	inoremap "<Esc> "
"	" Ajout automatique de "'"
"	inoremap ' ''<Left>
"	inoremap '' '
"	inoremap '<Right> '<Right>
"	inoremap '<End> '<End>
"	inoremap '<Home> '<Home>
"	inoremap '<Esc> '
"	" Ajout automatique de '«'
"	inoremap « «»<LEFT>
"	inoremap «<CR> «<CR>»<Esc>O
"	inoremap «<Right> «<Right>
"	inoremap «<End> «<End>
"	inoremap «« «
"	inoremap «» «»
"	" Ajout automatique de '«'
"	inoremap < <><LEFT>
"	inoremap <<CR> <<CR>><Esc>O
"	inoremap <<Right> <<Right>
"	inoremap <<End> <<End>
"	inoremap << <
"	inoremap <> <>

" Explicit display of chars 
	if &term =~ "linux"
		set list listchars=nbsp:+,tab:\|·,trail:·,extends:>,precedes:<
	else
		set list listchars=nbsp:¬,tab:⎢·,trail:·,extends:>,precedes:<
	endif

" Set undo level to 256
	set undolevels=256

" Highlight search
	set hlsearch

autocmd FileType html,htmldjango,jinjahtml,eruby,mako,php let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako,php source /usr/local/share/vim/closetag.vim

autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Activate Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-scripts/vim-dokuwiki'
call vundle#end()
filetype plugin indent on

" Activation and configuration for vim-airline
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?":&readonly?"⭤":"}',
      \   'modified': '%{&filetype=="help"?":&modified?"+":&modifiable?":"-"}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" Active gitgutter
let g:gitgutter_avoid_cmd_prompt_on_windows = 0

