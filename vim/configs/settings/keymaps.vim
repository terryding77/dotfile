scriptencoding utf-8
" set mapleader 将空格作为leader键
let mapleader = ' '

" 使用leader加sudo将不具备权限的文件写入
map <leader>sudo :w !sudo tee %<CR>
" set ctrl-hjkl to switch splited windows
" 增加ctrl键加hjkl进行窗口间的移动
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" airline
" 增加leader配数字键移动到指定下标的窗口
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
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

" fugitive
" leader加g配成git操作的快捷键
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

" gitgutter
" nmap <leader>+ <Plug>GitGutterNextHunk
" nmap <leader>= <Plug>GitGutterNextHunk
" nmap <leader>- <Plug>GitGutterPrevHunk
nmap <leader>u <Plug>GitGutterUndoHunk

" ale
"普通模式下，leader[前往上一个错误或警告，leader]前往下一个错误或警告
nmap <leader>[ <Plug>(ale_previous_wrap)
nmap <leader>] <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <leader>e :ALEDetail<CR>
nmap <leader>e :ALEDetail<CR>
nmap <leader>f :ALEFindReferences<CR>
nmap <leader>g :ALEGoToDefinition<CR>
nnoremap <C-]> :ALEGoToDefinition<CR>
nnoremap <C-LeftMouse> :ALEGoToDefinition<CR>

" vim-gh-line
" 用于在git仓库的代码里直接通过快捷键进入仓库网站
" To disable default key mapping:
let g:gh_line_map_default = 0
" Use your own mapping:
let g:gh_line_map = '<leader>gh'

" Bufkill
nmap <leader>x :BD<CR>
