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

" set leader tab mark 
" 显示tab和空格
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-

nnoremap ? :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=10
     echo 'Highlight current word: off'
     return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=10
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction
