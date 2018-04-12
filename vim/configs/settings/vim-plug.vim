call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'

Plug 'suan/vim-instant-markdown',
      \ { 'do': 'npm -g install instant-markdown-d' }                 "   Instantly preview markdown

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'elzr/vim-json'

" auto complete plug; deoplete for vim8.0 need `has('python3')` for async " `pip3 install neovim` is required or `pacin python-neovim` in archlinux
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete engine
autocmd FileType c,cpp let b:deoplete_disable_auto_complete = 1
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }                                            " golang
Plug 'zchee/deoplete-jedi'                                                                         " python
Plug 'Shougo/neco-vim', {'for': 'vim'}                                                             " Vim
Plug 'wellle/tmux-complete.vim'                                                                    " tmux panes
Plug 'fszymanski/deoplete-emoji'                                                                   " emoji
"Plug 'mhartington/nvim-typescript', { 'do': 'npm install -g typescript', 'for': 'typescript' }

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --go-completer --system-libclang
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cpp'], 'do': function('BuildYCM') }


" Snippets are separated from the engine. Add this if you want them:
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" python
"Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'davidhalter/jedi-vim'
Plug 'tell-k/vim-autopep8'

" Tagbar: a class outline viewer for Vim
Plug 'majutsushi/tagbar'

" zoom a pane by 'ctrl-w o'
Plug 'vim-scripts/ZoomWin'

" mini buffer expl
"Plug 'fholgado/minibufexpl.vim'

" unload file buffer without destory window layout
Plug 'qpkorr/vim-bufkill'

" vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
"Plug 'bling/vim-bufferline'

" async lint
Plug 'w0rp/ale'

" file search
Plug 'ctrlpvim/ctrlp.vim'

" code search
Plug 'mileszs/ack.vim'
"Plug 'wsdjeg/FlyGrep.vim'

" start page 
Plug 'mhinz/vim-startify'

" code leader space prettify
Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'

"Plugin 'kien/rainbow_parentheses.vim'
Plug 'kien/rainbow_parentheses.vim'

" insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" search highlight & enhance
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-surround'

" Diff directories
Plug 'will133/vim-dirdiff'
let g:DirDiffExcludes = ".git,node_modules,vendor,dist,.DS_Store,.*.swp"

" html js css
Plug 'mattn/emmet-vim', { 'for': ['html', 'xml', 'typescript'] }
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
" typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'mxw/vim-jsx' ", { 'for': 'javascript.jsx' }

" Initialize plugin system
call plug#end()
