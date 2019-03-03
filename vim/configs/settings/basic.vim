call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'typescript'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'typescript'] }
Plug 'groenewege/vim-less', { 'for': ['html', 'css', 'typescript'] }
"Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color', { 'for': 'css' }
" typescript
" file search
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" code search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" search highlight & enhance
Plug 'haya14busa/incsearch.vim'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
" Tagbar: a class outline viewer for Vim
Plug 'majutsushi/tagbar'
" start page
Plug 'mhinz/vim-startify'
" code leader space prettify
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
" Diff directories
Plug 'will133/vim-dirdiff'
let g:DirDiffExcludes = ".git,node_modules,vendor,dist,.DS_Store,.*.swp"
" tmux navigator with vim
" markdown
Plug 'godlygeek/tabular' , {'for': 'markdown'}
Plug 'plasticboy/vim-markdown' , {'for': 'markdown'}
Plug 'iamcco/mathjax-support-for-mkdp' , {'for': 'markdown'}
" comment
Plug 'cespare/vim-toml'
Plug 'wannesm/wmgraphviz.vim'
" Initialize plugin system
call plug#end()
scriptencoding utf-8
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            indentLine settings                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)
let g:indentLine_bgcolor_term = 111
let g:indentLine_first_char = '┆'              "设置对齐线的首字符
let g:indentLine_showFirstIndentLevel = 0   "显示对齐线首字符

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             nerdtree settings                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <F3> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>


nnoremap <silent> <C-w>w :ZoomWin<CR>

" nerdtree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" nerdtree syntax highlight
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1
"let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
"let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
