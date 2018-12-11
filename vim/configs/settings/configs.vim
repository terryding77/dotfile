scriptencoding utf-8
set mouse=a
set ttymouse=xterm

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

" 设置主题及颜色
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has('termguicolors'))
 set termguicolors
endif
set t_Co=256
set background=dark
syntax on
let g:quantum_black=1
colorscheme quantum

" airline theme
let g:airline_theme='quantum'

let g:airline_powerline_fonts = 1
let g:airline_detect_modified=1
"let g:airline_skip_empty_sections = 1
let g:airline_extensions = ['branch', 'tabline', 'ale', 'hunks', 'wordcount']
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"""""""vim-airline""
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#excludes = ['']
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#show_close_button = 1
let airline#extensions#tabline#middle_click_preserves_windows = 1

" airline + gitgutter
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['增', '改', '删']
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']

let g:airline#extensions#wordcount#enabled = 1

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
let g:ale_linters['go'] = ['golangserver', 'gofmt', 'golint', 'go build', 'gometalinter'] " lsp
let g:ale_go_gometalinter_options = '--fast'
"let g:ale_linters['java'] = ['javalsp'] " lsp
"let g:ale_java_javalsp_jar = 'javacs.jar'
let g:ale_linters['javascript'] = ['tsserver'] " lsp
let g:ale_linters['python'] = ['pyls'] " lsp
let g:ale_linters['sh'] = ['language_server'] " lsp
let g:ale_linters['typescript'] = ['tsserver'] " lsp
let g:ale_linters['vim'] = ['vint']

let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = '✗ '
let airline#extensions#ale#warning_symbol = ' '
let airline#extensions#ale#show_line_numbers = 0
let airline#extensions#ale#open_lnum_symbol = '(line:'
let airline#extensions#ale#close_lnum_symbol = ')'
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
