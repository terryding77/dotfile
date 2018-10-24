call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Word Completion                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set python3 first
if v:version > 800
    set pyxversion=0
endif
set pyxversion=3
Plug 'Shougo/neco-vim', {'for': 'vim'}
Plug 'wellle/tmux-complete.vim'
Plug 'ujihisa/neco-look'
" Snippets are separated from the engine. Add this if you want them:
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Golang Plugins                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Python Plugins                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'davidhalter/jedi-vim', {'for': 'python' }
Plug 'tell-k/vim-autopep8', {'for': 'python' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            JS/HTML/CSS Plugins                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'typescript'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['html', 'css', 'typescript'] }
Plug 'groenewege/vim-less', { 'for': ['html', 'css', 'typescript'] }
"Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color', { 'for': 'css' }
" typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'mxw/vim-jsx' ", { 'for': 'javascript.jsx' }
"Plug 'mhartington/nvim-typescript', { 'do': 'npm install -g typescript', 'for': 'typescript' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Theme Plugins                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tyrannicaltoucan/vim-quantum'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            CSV Relevant Plugins                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        File Search Relevant Plugins                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Code Lint Plugins                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" async lint
Plug 'w0rp/ale'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Other Common Plugins                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar: a class outline viewer for Vim
Plug 'majutsushi/tagbar'
" start page
Plug 'mhinz/vim-startify'
" code leader space prettify
Plug 'Yggdroot/indentLine'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
" Diff directories
Plug 'will133/vim-dirdiff'
let g:DirDiffExcludes = ".git,node_modules,vendor,dist,.DS_Store,.*.swp"
" tmux navigator with vim
Plug 'christoomey/vim-tmux-navigator'
" markdown
Plug 'godlygeek/tabular' , {'for': 'markdown'}
Plug 'plasticboy/vim-markdown' , {'for': 'markdown'}
Plug 'iamcco/mathjax-support-for-mkdp' , {'for': 'markdown'}
Plug 'iamcco/markdown-preview.vim' , {'for': 'markdown'}
" json
Plug 'elzr/vim-json'
" unload file buffer without destory window layout
Plug 'qpkorr/vim-bufkill'
" comment
Plug 'tpope/vim-commentary'
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
" calculate startup's time
Plug 'tweekmonster/startuptime.vim'
Plug 'terryding77/vim-gh-line'
Plug 'sjl/gundo.vim' " undo tree
Plug 'wannesm/wmgraphviz.vim'
Plug 'lilydjwg/fcitx.vim'
" Initialize plugin system
call plug#end()
