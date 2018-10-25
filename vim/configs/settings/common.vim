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
"                              Bufkill settings                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             nerdtree settings                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <F3> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_yarp = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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



" undo tree
nnoremap <F5> :GundoToggle<CR>
