" Disable vi compatibility
set nocompatible

" Enable syntax coloration
syntax on

" Display lines number
" set number
" Disable lines number relative to cursor
set relativenumber

" Set tab to 4 columns
set tabstop=4
set shiftwidth=4

" Enable tab expansion
set expandtab

" Set intelligent indentation
set smartindent

" Auto indent to next lines
set autoindent

" Intelligent backspace
set backspace=indent,eol,start

" Indent to next tab
" set shiftround

" Display mode
set showmode

" Display cursor line
set cursorline

" Display uncomplete commands
set showcmd

" Enable auto backup file
set backup

" Enable vim modeline
set modeline

" Highlight redundant whitespaces
highlight RedundantSpaces ctermbg=lightred
match RedundantSpaces /\s\+$\|  \+\ze\t\|�/

" Enable display for CRLF (^M) in DOS files
set fileformats=unix

" Enable brackets matching display
set showmatch

" Function to toggle spelling languages
function! ToggleSpellLang()
    if &spelllang =~# 'en'
        :set spelllang=fr
    else
        :set spelllang=en
    endif
endfunction
" Toggle spell on or off
nnoremap <F7> :setlocal spell!<CR>
" Toggle language
nnoremap <F8> :call ToggleSpellLang()<CR>

" Set default file encoding to UTF-8
set encoding=utf-8

" Enable line wrap
set wrap

" Explicitly display chars
if &term =~ "linux"
    set list listchars=nbsp:+,tab:\|·,trail:·,extends:>,precedes:<
else
    set list listchars=nbsp:�,tab:��,trail:�,extends:>,precedes:<
endif

" Set undo level
set undolevels=256

" Highlight search pattern
set hlsearch

" Force buffer to keep lines and column on parsing
set scrolloff=3
set sidescrolloff=5

" Buffer navigation mapping
noremap <S-LEFT> :bprev<CR>
noremap <S-RIGHT> :bnext<CR>

" Keep buffer position accros file openning
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Activate and configure vim-airline
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#rmuxline#enabled = 1

" Active nerdtree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F2> :NERDTreeToggle<CR> " This map <F2> to open or close NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Remap NerdCommenter comment toggle
nnoremap <S-Tab> :call nerdcommenter#Comment(0,"toggle") <CR>
vnoremap <S-Tab> :call nerdcommenter#Comment(0,"toggle") <CR>
filetype plugin on

" Append modeline to files by pressing F3
function! AppendModeline()
    let l:modeline = printf(" vim: set ai ts=%d ws=%d tw=%d %set :",
          \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    call append(line("$"), l:modeline)
endfunction
map <F3> :call AppendModeline()<CR>