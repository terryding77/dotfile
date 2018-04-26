
" airline theme
let g:airline_theme="bubblegum"
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
"let g:airline_skip_empty_sections = 1
let g:airline_extensions = ['branch', 'tabline']

"""""""vim-airline""
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
nmap <leader>= <Plug>AirlineSelectNextTab

nmap <m-1> <Plug>AirlineSelectTab1
nmap <m-2> <Plug>AirlineSelectTab2
nmap <m-3> <Plug>AirlineSelectTab3

" ale lint
"ale
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标⚡
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '' 
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', ' %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] [%code%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <leader>e :ALEDetail<CR>
let g:ale_completion_enabled = 1
let g:ale_swift_swiftlint_use_defaults = 1
let g:ale_open_list = 0
let g:ale_lint_delay = 100
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {}
let g:ale_fixers = {}


" ctrlp 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
"map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_working_path_mode = 'ra'

" ack.vim
" `pacin the_silver_searcher`
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

function! Search(string) abort
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    execute 'Ack!' shellescape(a:string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction

"cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>a :call Search("")<left><left>

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

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_guide_size = 1

" Bufkill
nmap <leader>x :BD<CR>

" gitgutter keymap
nmap <leader>+ <Plug>GitGutterNextHunk
nmap <leader>= <Plug>GitGutterNextHunk
nmap <leader>- <Plug>GitGutterPrevHunk
let g:gitgutter_sign_added = 'A'
let g:gitgutter_sign_modified = 'M'
let g:gitgutter_sign_removed = 'D'
let g:gitgutter_sign_removed_first_line = 'DF'
let g:gitgutter_sign_modified_removed = 'MD'

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



"Plugin 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
                        \ ['brown',       'RoyalBlue3'],
                        \ ['Darkblue',    'SeaGreen3'],
                        \ ['darkgray',    'DarkOrchid3'],
                        \ ['darkgreen',   'firebrick3'],
                        \ ['darkcyan',    'RoyalBlue3'],
                        \ ['darkred',     'SeaGreen3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['brown',       'firebrick3'],
                        \ ['gray',        'RoyalBlue3'],
                        \ ['darkmagenta', 'DarkOrchid3'],
                        \ ['Darkblue',    'firebrick3'],
                        \ ['darkgreen',   'RoyalBlue3'],
                        \ ['darkcyan',    'SeaGreen3'],
                        \ ['darkred',     'DarkOrchid3'],
                        \ ['red',         'firebrick3'],
                        \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""""""incsearch settings""
"input `/`or`?`or`g/`to search like default vim action 
"when searching press `tab` move to next result 
"press `ctrl+j` scroll page down
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
""""""end""

" fugitive
nnoremap <silent> <leader>gst :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gcmsg :Gcommit<CR>
nnoremap <silent> <leader>gbl :Gblame<CR>
nnoremap <silent> <leader>glol :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>ga :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
