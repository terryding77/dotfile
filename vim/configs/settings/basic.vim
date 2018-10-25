scriptencoding utf-8
set hlsearch
set mouse=a
set cursorline

set guifont=sauce\ code\ pro\ nf\ bold\ 12
set ttimeoutlen=100


set wildmode=list,longest
set wildmenu

" set viminfo location
set viminfo+=n~/.vim/.viminfo

" show last edit position when we reopen file
"au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" set transparent
hi Normal ctermbg=NONE
hi NonText ctermbg=none
hi LineNr ctermbg=none


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

" set tags search from current directory to root
set tags=tags;

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

nmap <leader>w :w<CR>
fu! OpenTerminal()
    " open split windows on the topleft
    botright split
    " resize the height of terminal windows to 30
    resize 10
    :call term_start('zsh', {'curwin' : 1, 'term_finish' : 'close'})
endf
nmap <leader>t :call OpenTerminal()<CR>

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz


" Source the vimrc file after saving it
augroup ReloadVimrc
  autocmd!
  autocmd bufwritepost *vim source $MYVIMRC |
        \ AirlineRefresh |
        \ redraw |
        \ echo '~/.vimrc reloaded!'
augroup END

" let tmux do not only show vim in title bar.
" https://stackoverflow.com/questions/15123477/tmux-tabs-with-name-of-file-open-in-vim
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
""""""incsearch settings""
"input `/`or`?`or`g/`to search like default vim action
"when searching press `tab` move to next result
"press `ctrl+j` scroll page down
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
""""""end""

map <leader>sudo :w !sudo tee %<CR>
