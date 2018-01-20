set number
set hlsearch
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set mouse=a

syntax enable
set t_Co=256
set background=dark
colorscheme Tomorrow-Night

" set viminfo location 
set viminfo+=n~/.vim/.viminfo

" show last edit position when we reopen file 
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif  

" set ctrl-hjkl to switch splited windows
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" set transparent
hi Normal ctermbg=NONE

" set mapleader
let mapleader = " "
