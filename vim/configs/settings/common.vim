
" airline theme
let g:airline_theme="bubblegum"
let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
"let g:airline_skip_empty_sections = 1
let g:airline_extensions = ['branch', 'tabline']

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

" ale lint
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_swift_swiftlint_use_defaults = 1
let g:ale_open_list = 0
let g:ale_lint_delay = 1000
let g:ale_linters = {
  \ 'go': ['golint', 'go vet', 'go build'],
  \ 'python': ['pylint'],
  \ 'javascript': ['eslint'],
  \ }

" you complete me
" #####YouCompleteMe Configure   
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'  
" 自动补全配置  
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)  
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口  
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项  
"上下左右键的行为 会显示其他信息  
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"  
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"  
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"  
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"  
  
"youcompleteme  默认tab  s-tab 和自动补全冲突  
"let g:ycm_key_list_select_completion=['<c-n>']  
let g:ycm_key_list_select_completion = ['<Down>']  
"let g:ycm_key_list_previous_completion=['<c-p>']  
let g:ycm_key_list_previous_completion = ['<Up>']  
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示  
  
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎  
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项  
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项  
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全  
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    
" force recomile with syntastic  
"nnoremap <leader>lo :lopen<CR> "open locationlist  
"nnoremap <leader>lc :lclose<CR>    "close locationlist  
"inoremap <leader><leader> <C-x><C-o>  
"在注释输入中也能补全  
let g:ycm_complete_in_comments = 1  
"在字符串输入中也能补全  
let g:ycm_complete_in_strings = 1  
"注释和字符串中的文字也会被收入补全  
let g:ycm_collect_identifiers_from_comments_and_strings = 0  
let g:clang_user_options='|| exit 0'  
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处  
" #####YouCompleteMe Configure
"
" ctrlp 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
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

" ack.vim
" `pacin the_silver_searcher`
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

function Search(string) abort
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
