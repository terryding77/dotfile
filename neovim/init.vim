scriptencoding utf-8
call plug#begin('~/.vim/plugged')
" appearance
Plug 'tyrannicaltoucan/vim-quantum'
"" 设置主题及颜色
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

" 2 coding
" linter and fixer
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
" completion
""""" coc - use `npm install -g vim-node-rpc` before install
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
" CocInstall coc-css coc-html coc-json coc-tsserver coc-rls coc-highlight coc-emmet coc-snippets coc-yaml coc-pyls coc-vimtex coc-pairs
""""" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" commentary
Plug 'tpope/vim-commentary'
" csv
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" compile and run
Plug 'thinca/vim-quickrun'
" github and gitlab website jump
Plug 'terryding77/vim-gh-line'

" 3 operation
" tmux window
Plug 'christoomey/vim-tmux-navigator'
" delete buffer
Plug 'qpkorr/vim-bufkill'
" open new buffer or windows
Plug 'Shougo/denite.nvim'
" chinese input
" Plug 'lilydjwg/fcitx.vim'
" calculate startup's time
Plug 'tweekmonster/startuptime.vim'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()

colorscheme quantum


"" below is temp add
" will change later

set mouse=a

" always show signcolumns
set signcolumn=yes

" 设置搜索高亮
set hlsearch
" 显示tab和空格
set list
" 设置tab和空格样式
set listchars=tab:\|\ ,nbsp:%,trail:-
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
" 允许在未保存的情况下切换窗口
set hidden
" 设置相对行号
set number
set relativenumber

" set mapleader 将空格作为leader键
let mapleader = ' '

" stop myself hitting them accidentally (particularly q:):
map q: <Nop>
nnoremap Q <nop>

" 使用leader加sudo将不具备权限的文件写入
map <leader>sudo :w !sudo tee %<CR>
" set ctrl-hjkl to switch splited windows
" 增加ctrl键加hjkl进行窗口间的移动
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

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

" airline 增加leader配数字键移动到指定下标的窗口
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
"普通模式下，leader{前往上一个git修改，leader}前往下一个git修改
nmap <leader>{ <Plug>GitGutterPrevHunk
nmap <leader>} <Plug>GitGutterNextHunk
nmap <leader>u <Plug>GitGutterUndoHunk

" ale
"普通模式下，leader[前往上一个错误或警告，leader]前往下一个错误或警告
nmap <leader>[ <Plug>(ale_previous_wrap)
nmap <leader>] <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <leader>e :ALEDetail<CR>
nmap <leader>f :ALEFindReferences<CR>
nmap <leader>g :ALEGoToDefinition<CR>
" nnoremap <C-]> :ALEGoToDefinition<CR>kj

" vim-gh-line
" 用于在git仓库的代码里直接通过快捷键进入仓库网站
" To disable default key mapping:
let g:gh_line_map_default = 0
" Use your own mapping:
let g:gh_line_map = '<leader>gh'

" Bufkill
nmap <leader>x :BD<CR>

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" denite
" Change mappings.
call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')

" nerdtree
nmap <F3> :NERDTreeToggle<CR>

" coc
" 使用cr来代替默认的ctrl-y进行snippets的选择操作
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#rpc#request('doKeymap', ['snippets-expand', "\<TAB>"])

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" looks good for go mod package files
nnoremap <C-]> :call CocAction('jumpDefinition')<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>n <Plug>(coc-rename)
" Use K for show documentation in preview window
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

" " Setup formatexpr specified filetype(s).
" augroup cocgroup
"   autocmd!
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" augroup end
" " Shortcuts for denite interface
" " Show extension list
" nnoremap <silent> <space>e  :<C-u>Denite coc-extension<cr>
" " Show symbols of current buffer
" nnoremap <silent> <space>o  :<C-u>Denite coc-symbols<cr>
" " Search symbols of current workspace
" nnoremap <silent> <space>t  :<C-u>Denite coc-workspace<cr>
" " Show available commands
" nnoremap <silent> <space>c  :<C-u>Denite coc-command<cr>
" " Show available services
" nnoremap <silent> <space>s  :<C-u>Denite coc-service<cr>
" " Show links of current buffer
" nnoremap <silent> <space>l  :<C-u>Denite coc-link<cr>

" SingleCompile
" 单文件编译运行插件
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr><cr>
" nmap <leader>b :SCCompile<cr>
nmap <leader>r :SCCompileRun<cr><cr>

" quickrun
let g:quickrun_config = {
\   '_' : {
\       'outputter' : 'message',
\   },
\}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>

" gitgutter
let g:gitgutter_sign_added = 'A '
let g:gitgutter_sign_modified = 'M '
let g:gitgutter_sign_removed = 'D '
let g:gitgutter_sign_removed_first_line = 'DF'
let g:gitgutter_sign_modified_removed = 'MD'

" ale
let g:ale_fixers = {}
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers['c'] = ['clang-format']
let g:ale_fixers['cpp'] = ['clang-format']
let g:ale_c_clangformat_options = '
\   -style="{
\       BasedOnStyle: llvm,
\       IndentWidth: 4,
\       ColumnLimit: 100,
\       AllowShortFunctionsOnASingleLine: None,
\       KeepEmptyLinesAtTheStartOfBlocks: false
\   }"'
let g:ale_fixers['css'] = ['prettier']
let g:ale_fixers['go'] = ['gofmt', 'goimports']
let g:ale_fixers['java'] = ['google_java_format']
let g:ale_java_google_java_format_options = '-aosp'
let g:ale_fixers['javascript'] = ['prettier_eslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['less'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']
let g:ale_fixers['python'] = ['autopep8']
let g:ale_fixers['scss'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_fixers['vue'] = ['prettier']
let g:ale_fixers['yaml'] = ['prettier']
" ale
let g:ale_linters = {}
let g:ale_linters['c'] = ['clangd'] " lsp
let g:ale_linters['cpp'] = ['clangd'] " lsp
let g:ale_linters['css'] = ['csslint']
let g:ale_linters['go'] = ['bingo', 'gofmt', 'golint', 'go build', 'golangci-lint'] " lsp
let g:ale_go_golangci_lint_options='-D typecheck deadcode'
"let g:ale_linters['java'] = ['javalsp'] " lsp
"let g:ale_java_javalsp_jar = 'javacs.jar'
let g:ale_linters['javascript'] = ['tsserver'] " lsp
let g:ale_linters['python'] = ['pyls'] " lsp
let g:ale_linters['sh'] = ['language_server'] " lsp
let g:ale_linters['typescript'] = ['tsserver'] " lsp
let g:ale_linters['vim'] = ['vint']

"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:ale_change_sign_column_color = 1
"自定义error和warning图标⚡
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', ' %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = '✗'
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%] %code%'
let g:ale_completion_enabled = 0
let g:ale_open_list = 0
let g:ale_lint_delay = 100
let g:ale_set_balloons = 0

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    au BufNewFile,BufRead *.tsx set filetype=typescript.tsx
augroup END

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Do not lint or fix minified files.
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
" If you configure g:ale_pattern_options outside of vimrc, you need this.
let g:ale_pattern_options_enabled = 1

" vim-gh-line
" 用于在git仓库的代码里直接通过快捷键进入仓库网站
" Use a custom program to open link:
let g:gh_open_command = 'chromium '
" Use canonical version hash for url in place of branch name:
let g:gh_use_canonical = 0
" Use self deployed gitlab:
let g:gh_gitlab_domain = 'git.hyperchain.cn'
let g:gh_gitlab_only_http = 1

" denite
" 使用ag作为搜索指令
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" Change default prompt
call denite#custom#option('default', 'prompt', '输入搜索内容:')

" coc
" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" ultisnips
let g:UltiSnipsEditSplit='vertical'

" filetype
autocmd FileType yaml setlocal et sta sw=2 sts=2
