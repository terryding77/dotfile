scriptencoding utf-8

set mouse=a

" always show signcolumns
set signcolumn=yes

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

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

nmap <leader>w :w<CR>
let g:which_key_map.w = "保存当前标签页"
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
let g:which_key_map.t = "打开命令行"

"Keep search pattern at the center of the screen."
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" filetype
autocmd FileType yaml setlocal et sta sw=2 sts=2


" 使用vim-plug安装插件
call plug#begin('~/.vim/plugged')
    " appearance设置主题及颜色
    Plug 'tyrannicaltoucan/vim-quantum'
        "" If you have vim >=8.0 or Neovim >= 0.1.5
        if (has('termguicolors'))
          set termguicolors
        endif
        set background=dark
        let g:quantum_black=1

    Plug 'itchyny/lightline.vim'
        let g:lightline = {
              \ 'colorscheme': 'quantum',
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
        let g:which_key_map.1 = "1-9数字跳转对应标签页"
        let g:which_key_map.2 = "which_key_ignore"
        let g:which_key_map.3 = "which_key_ignore"
        let g:which_key_map.4 = "which_key_ignore"
        let g:which_key_map.5 = "which_key_ignore"
        let g:which_key_map.6 = "which_key_ignore"
        let g:which_key_map.7 = "which_key_ignore"
        let g:which_key_map.8 = "which_key_ignore"
        let g:which_key_map.9 = "which_key_ignore"
        let g:which_key_map.0 = "which_key_ignore"
        augroup ThemeCommands
            autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
        augroup END


    " 2 coding
    " linter and fixer
    " Plug 'w0rp/ale'
    Plug 'editorconfig/editorconfig-vim'
    " completion
    """"" coc - use `npm install -g vim-node-rpc` before install
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        let g:coc_global_extensions = [
                    \ 'coc-yank', 'coc-git', 'coc-css', 'coc-html',
                    \ 'coc-json', 'coc-tsserver', 'coc-rls', 'coc-highlight',
                    \ 'coc-emmet', 'coc-snippets', 'coc-yaml', 'coc-pyls', 'coc-vimtex',
                    \ 'coc-pairs',
                    \ ]
        nmap <leader>{ <Plug>(coc-git-prevchunk)
        let g:which_key_map['{'] = "前一个Git修改"
        nmap <leader>} <Plug>(coc-git-nextchunk)
        let g:which_key_map['}'] = "后一个Git修改"
        nmap gs <Plug>(coc-git-chunkinfo)

        nmap <silent> <c-]> <Plug>(coc-definition)
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
        nnoremap <silent> <leader>gg :SignifyToggle<CR>

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
        let g:which_key_map.g = { 'name' : '+git相关'}
        let g:which_key_map.g.h = "跳转到代码web网页"
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
        let g:maplocalleader = ","
        nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
        nnoremap <silent> <localleader> :WhichKey ','<CR> vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

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
        let g:which_key_map.x = "关闭当前标签页"

    Plug 'Shougo/denite.nvim'
		" from spacevim
		let g:which_key_map.f = { 'name' : '+搜索' }
		nnoremap <silent> <Leader>f<Space> :Denite menu:CustomKeyMaps<CR>
		let g:which_key_map.f[' '] = "查找快捷键"
		nnoremap <silent> <Leader>fe :<C-u>Denite register<CR>
		let g:which_key_map.f['e'] = "搜索寄存器"
		" nnoremap <silent> <Leader>fh :<C-u>Denite neoyank<CR>
		" let g:which_key_map.f['h'] = "搜索 history/yank"
		nnoremap <silent> <Leader>fj :<C-u>Denite jump<CR>
		let g:which_key_map.f['j'] = "搜索跳转和修改"
		" nnoremap <silent> <Leader>fl :<C-u>Denite location_list<CR>
		" let g:which_key_map.f['l'] = "搜索 location list"
		nnoremap <silent> <Leader>fm :<C-u>Denite output:message<CR>
		let g:which_key_map.f['m'] = "搜索log内容"
		" nnoremap <silent> <Leader>fo  :<C-u>Denite outline<CR>
		" let g:which_key_map.f['o'] = "搜索函数列表"
		" nnoremap <silent> <Leader>fp  :<C-u>Denite menu:AddedPlugins<CR>)
		" nnoremap <silent> <Leader>fq :<C-u>Denite quickfix<CR>
		" let g:which_key_map.f['q'] = "搜索 quickfix list"
		nnoremap <silent> <Leader>fr :<C-u>Denite -resume<CR>
		let g:which_key_map.f['r'] = "重置上次搜索窗口"
    " chinese input
    " Plug 'lilydjwg/fcitx.vim'
    " calculate startup's time
    Plug 'tweekmonster/startuptime.vim'
    " On-demand loading
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        " nerdtree
        nmap <F3> :NERDTreeToggle<CR>
call plug#end()

colorscheme quantum

" whichkey
call which_key#register('<Space>', "g:which_key_map")

" denite
" Change mappings.修改映射
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<tab>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

" 使用git进行项目文件搜索
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])
nnoremap <silent> <Leader>ff :<C-u>Denite `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<cr>
let g:which_key_map.f['f'] = "搜索文件"

" 使用ag进行全文搜索
nnoremap <silent> <Leader>fd :DeniteProjectDir -highlight-mode-insert=WildMenu -buffer-name=grep grep:::!<CR>
let g:which_key_map.f['d'] = "搜索代码"
call denite#custom#source('grep', 'matchers', ['matcher_regexp'])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Change default prompt
call denite#custom#option('default', {
			\ 'prompt': '输入搜索内容：',
			\ 'winheight': '25',
            \ 'highlight_mode_insert': 'WildMenu',
			\ 'split': 'floating',
            \ })

