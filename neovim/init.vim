scriptencoding utf-8

set mouse=a

" always show signcolumns
set signcolumn=yes

set ignorecase
" 设置搜索高亮
set hlsearch
" 显示tab和空格
set list
" 允许在未保存的情况下切换窗口
set hidden
" 设置相对行号
set number
set relativenumber

" 设置tab和空格样式
set listchars=tab:\|\ ,nbsp:%,trail:-
set backspace=indent,eol,start
set tabstop=4     " ts=4
set softtabstop=4 " sts=4
set shiftwidth=4  " sw=4
set expandtab     " et
set smarttab      " sta
if has('autocmd')
    " 根据具体文件格式设置缩进
    augroup ag_filetab
        autocmd FileType javascript setlocal ts=2 sts=2 sw=2 et sta
        autocmd FileType typescript setlocal ts=2 sts=2 sw=2 et sta
        autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 et sta
    augroup end
endif

" set mapleader 将空格作为leader键
let mapleader = ' '
" Define prefix dictionary
let g:which_key_map =  {}
" stop myself hitting them accidentally (particularly q:):
map q: <Nop>
nnoremap Q <nop>

" 使用leader加sudo将不具备权限的文件写入
map <leader>sudo :w !sudo tee %<CR>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

nmap <leader>w :w<CR>:w<CR>
let g:which_key_map.w = '保存当前标签页'
if has('nvim')
    fu! OpenTerminal()
        " open split windows on the topleft
        " topleft split
        botright split
        " resize the height of terminal windows to 30
        resize 10
        :terminal
    endf
else
    fu! OpenTerminal()
        " open split windows on the topleft
        botright split
        " resize the height of terminal windows to 30
        resize 10
        :call term_start('zsh', {'curwin' : 1, 'term_finish' : 'close'})
    endf
endif
nmap <leader>t :call OpenTerminal()<CR>
let g:which_key_map.t = '打开命令行'

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 使用vim-plug安装插件
call plug#begin('~/.vim/plugged')
    " appearance设置主题及颜色
    Plug 'morhetz/gruvbox'
    Plug 'tyrannicaltoucan/vim-quantum'
        "" If you have vim >=8.0 or Neovim >= 0.1.5
        " if (has('termguicolors'))
        "   set termguicolors
        " endif
        " set background=dark
        " let g:quantum_black=1

    Plug 'itchyny/lightline.vim'
        let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'gitbranch', 'readonly', 'filename', 'modified', 'diagnostic', 'cocstatus'],
            \   ],
            \   'right':[
            \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
            \     [ 'blame' ]
            \   ],
            \ },
            \ 'component_function': {
            \   'blame': 'LightlineGitBlame',
            \   'cocstatus': 'coc#status'
            \ },
        \ }

    Plug 'mengelbrecht/lightline-bufferline'
        let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
        let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
        let g:lightline.component_type   = {'buffers': 'tabsel'}
        let g:lightline#bufferline#show_number  = 2
        let g:lightline#bufferline#shorten_path = 1
        let g:lightline#bufferline#unicode_symbols = 1
        let g:lightline#bufferline#unnamed      = '[No Name]'
        let g:lightline#bufferline#filename_modifier = ':t'
        set showtabline=2
        nmap <leader>1 <Plug>lightline#bufferline#go(1)
        nmap <leader>2 <Plug>lightline#bufferline#go(2)
        nmap <leader>3 <Plug>lightline#bufferline#go(3)
        nmap <leader>4 <Plug>lightline#bufferline#go(4)
        nmap <leader>5 <Plug>lightline#bufferline#go(5)
        nmap <leader>6 <Plug>lightline#bufferline#go(6)
        nmap <leader>7 <Plug>lightline#bufferline#go(7)
        nmap <leader>8 <Plug>lightline#bufferline#go(8)
        nmap <leader>9 <Plug>lightline#bufferline#go(9)
        nmap <leader>0 <Plug>lightline#bufferline#go(10)
        let g:which_key_map.1 = '1-9数字跳转对应标签页'
        let g:which_key_map.2 = 'which_key_ignore'
        let g:which_key_map.3 = 'which_key_ignore'
        let g:which_key_map.4 = 'which_key_ignore'
        let g:which_key_map.5 = 'which_key_ignore'
        let g:which_key_map.6 = 'which_key_ignore'
        let g:which_key_map.7 = 'which_key_ignore'
        let g:which_key_map.8 = 'which_key_ignore'
        let g:which_key_map.9 = 'which_key_ignore'
        let g:which_key_map.0 = 'which_key_ignore'
        augroup ThemeCommands
            autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
        augroup END


    " 2 coding
    " linter and fixer
    Plug 'w0rp/ale'
        let g:ale_linters = {
                    \   'go': ['golangci-lint'],
                    \}
        let g:ale_fixers = {
                    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
                    \}
        let g:ale_fix_on_save = 1
    Plug 'editorconfig/editorconfig-vim'
    " completion
    """"" coc - use `npm install -g vim-node-rpc` before install
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        let g:coc_global_extensions = [
                    \ 'coc-css',
                    \ 'coc-emmet',
                    \ 'coc-git',
                    \ 'coc-highlight',
                    \ 'coc-html',
                    \ 'coc-json',
                    \ 'coc-lists',
                    \ 'coc-pairs',
                    \ 'coc-python',
                    \ 'coc-rls',
                    \ 'coc-snippets',
                    \ 'coc-tsserver',
                    \ 'coc-vimtex',
                    \ 'coc-yaml',
                    \ 'coc-yank',
                    \ ]

    " normal coc config
        nmap <silent> <c-]> <Plug>(coc-definition)
        nmap <silent> <leader>s <Plug>(coc-codeaction)
        " Use K to show documentation in preview window
        nnoremap <silent> K :call <SID>show_documentation()<CR>

        function! s:show_documentation()
          if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
          else
            call CocAction('doHover')
          endif
        endfunction
        " Highlight symbol under cursor on CursorHold
        autocmd CursorHold * silent call CocActionAsync('highlight')
        autocmd BufWritePost * silent call CocAction('format')

    " coc-git
        let g:which_key_map.g = { 'name' : '+git相关'}

        let g:which_key_map.g['-'] = '前一个Git修改'
        nmap <leader>g- <Plug>(coc-git-prevchunk)
        let g:which_key_map.g['+'] = '后一个Git修改'
        nmap <leader>g+ <Plug>(coc-git-nextchunk)
        nmap <leader>g= <Plug>(coc-git-nextchunk)

        let g:which_key_map.g['k'] = '显示chunkinfo'
        nmap <leader>gk <Plug>(coc-git-chunkinfo)

        function! LightlineGitBlame() abort
            let blame = get(b:, 'coc_git_blame', '')
            if len(blame) == 0
                let blame = 'Not Committed Yet'
            else
                let blame = blame
            endif
            " return blame
            return winwidth(0) > 120 ? blame : ''
        endfunction

    " coc-lists
        let g:which_key_map.f = { 'name' : '+搜索' }

        let g:which_key_map.f['f'] = '搜索文件'
        nnoremap <silent> <Leader>ff :CocList gfiles<CR>

        let g:which_key_map.f['d'] = '搜索代码'
        command! -nargs=+ -complete=custom,s:GrepArgs Ag exe 'CocList grep '.<q-args>
        function! s:GrepArgs(...)
            let list = ['-i', '-w', '-word',
                        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
            return join(list, "\n")
        endfunction
        nnoremap <silent> <Leader>fd :CocList grep<CR>

        let g:which_key_map.f['l'] = '搜索已打开文件列表'
        nnoremap <silent> <Leader>fl :CocList buffers<CR>

        let g:which_key_map.f['m'] = '查找vim快捷键'
        nnoremap <silent> <Leader>fm :CocList maps<CR>

        let g:which_key_map.f['r'] = '重置上次搜索窗口'
        nnoremap <silent> <Leader>fr :CocListResume<CR>

    " coc-pair
        " disable pairs for markdown file
        autocmd FileType markdown let b:coc_pairs_disabled = ['`']
        " disable pairs for vim file
        autocmd FileType vim let b:coc_pairs_disabled = ['`', '"']

    " coc-yank
        let g:which_key_map.f['y'] = '查找剪切板'
        nnoremap <silent> <leader>fy  :<C-u>CocList -A --normal yank<cr>
    " coc custom extensions
        xmap <silent> <F5> <Plug>(coc-repl-sendvisualtext)
        nmap <silent> <F5> <Plug>(coc-repl-sendnormaltext)
        imap <silent> <F5> <c-o><Plug>(coc-repl-sendnormaltext)

    """"" snippets
    Plug 'SirVer/ultisnips'
        " ultisnips
        " let g:UltiSnipsExpandTrigger='<tab>'
        let g:UltiSnipsJumpForwardTrigger='<tab>'
        let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
        let g:UltiSnipsEditSplit='vertical'
    Plug 'honza/vim-snippets'
    " commentary
    Plug 'tpope/vim-commentary'
    " csv
    Plug 'tpope/vim-fugitive'
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

    " compile and run
    Plug 'thinca/vim-quickrun'
        " quickrun
        let g:quickrun_config = {
        \   '_' : {
        \       'outputter' : 'message',
        \   },
        \}

        let g:quickrun_no_default_key_mappings = 1
        nmap <Leader>r <Plug>(quickrun)
        map <F10> :QuickRun<CR>
    " github and gitlab website jump
    Plug 'terryding77/vim-gh-line'
        " vim-gh-line
        " 用于在git仓库的代码里直接通过快捷键进入仓库网站
        " To disable default key mapping:
        let g:gh_line_map_default = 0
        " Use your own mapping:
        let g:gh_line_map = '<leader>gh'
        let g:which_key_map.g.h = '跳转到代码web网页'
        " vim-gh-line
        " 用于在git仓库的代码里直接通过快捷键进入仓库网站
        " Use a custom program to open link:
        let g:gh_open_command = 'chromium '
        " Use canonical version hash for url in place of branch name:
        let g:gh_use_canonical = 0
        " Use self deployed gitlab:
        let g:gh_gitlab_domain = 'git.hyperchain.cn'
        let g:gh_gitlab_only_http = 1

    " 3 operation
    Plug 'liuchengxu/vim-which-key'
        " By default timeoutlen is 1000 ms
        set timeoutlen=500
        let g:mapleader = "\<Space>"
        let g:maplocalleader = ','
        nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
        vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
        nnoremap <localleader> :<c-u>WhichKey  ','<CR>
        vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>

    " tmux window
    Plug 'christoomey/vim-tmux-navigator'
        " set ctrl-hjkl to switch splited windows
        " 增加ctrl键加hjkl进行窗口间的移动
        map <c-h> <c-w>h
        map <c-j> <c-w>j
        map <c-k> <c-w>k
        map <c-l> <c-w>l

    " delete buffer
    Plug 'qpkorr/vim-bufkill'
        " Bufkill
        nmap <leader>x :BD<CR>
        let g:which_key_map.x = '关闭当前标签页'

    " chinese input
    " Plug 'lilydjwg/fcitx.vim'
    " calculate startup's time
    Plug 'tweekmonster/startuptime.vim'
    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        " nerdtree
        nmap <F3> :NERDTreeToggle<CR>

    Plug 'voldikss/vim-translate-me'
        nmap <silent> <c-t> <Plug>TranslateW
        vmap <silent> <c-t> <Plug>TranslateWV
        let g:vtm_default_engines=['ciba', 'youdao', 'google']
        let g:vtm_default_mapping=0

call plug#end()

colorscheme gruvbox
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
highlight CocFloating ctermfg=Yellow  guifg=#B8860B


" whichkey
call which_key#register('<Space>', 'g:which_key_map')
