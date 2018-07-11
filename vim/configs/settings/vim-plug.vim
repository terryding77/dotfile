call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Word Completion                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set python3 first
if v:version > 800
    set pyxversion=0
endif
set pyxversion=3
" auto complete plug; deoplete for vim8.0 need `has('python3')` for async " `pip3 install neovim` is required or `pacin python-neovim` in archlinux
Plug 'Shougo/deoplete.nvim'  " Autocomplete engine
autocmd FileType c,cpp let b:deoplete_disable_auto_complete = 1
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/neco-vim', {'for': 'vim'}
Plug 'wellle/tmux-complete.vim'
Plug 'fszymanski/deoplete-emoji'
Plug 'ujihisa/neco-look'
" Snippets are separated from the engine. Add this if you want them:
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Golang Plugins                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Python Plugins                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'zchee/deoplete-jedi', {'for': 'python' }
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
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': 'js' }
"Plug 'mhartington/nvim-typescript', { 'do': 'npm install -g typescript', 'for': 'typescript' }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Theme Plugins                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'crusoexia/vim-monokai'
Plug 'chriskempson/base16-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'joshdick/onedark.vim'
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
" Initialize plugin system
call plug#end()
