runtime! archlinux.vim
runtime! ~/.vim/bundle/word_complete.vim

" No vi compatibility
  set nocompatible
" Syntaxic coloration
  syntax on

" Configuration for gvim default color for foreground in white and background
" in black
highlight Normal guifg=white guibg=black

" Display line number
"  set number

" Display line number relative to cursor
  set relativenumber

" Set tab to 4 columns
  set tabstop=2

" Set tab to 4 columns
  set shiftwidth=2

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
  set cursorline

" Display uncomplete commands
  set showcmd

" Backup file
  set backup

" Activate modeline
  set modeline

" Activate expand tabs
  set expandtab

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

" Set line wrap
  set wrap

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

" Force buffer to keep lines and column on parsing
  set scrolloff=3
  set sidescrolloff=5

" Buffer navigation mapping
  noremap <C-LEFT> :bprev<CR>
  noremap <C-RIGHT> :bnext<CR>

" Autoclose tags
  autocmd FileType html,htmldjango,jinjahtml,eruby,mako,php let b:closetag_html_style=1
  autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako,php source ~/.vim/bundle/closetag.vim

" Keep buffer position
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Activate Vundle
  filetype off

  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'Townk/vim-autoclose'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-airline/vim-airline-themes'
  call vundle#end()
  filetype plugin indent on

" Activation and configuration for vim-airline
  set laststatus=2
  set t_Co=256
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tmuxline#enabled = 1
  let g:airline_theme='serene'


" Active gitgutter
  let g:gitgutter_avoid_cmd_prompt_on_windows = 0

" Active nerdtree
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  map <F2> :NERDTreeToggle<CR> " This map <F2> to open or close NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Append modeline to files by pressing F3
  function! AppendModeline()
    let l:modeline = printf(" vim: set ai ts=%d ws=%d tw=%d %set :",
          \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
  endfunction
  map <F3> :call AppendModeline()<CR>
