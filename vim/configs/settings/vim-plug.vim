call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'suan/vim-instant-markdown',
      \ { 'do': 'npm -g install instant-markdown-d' }                 "   Instantly preview markdown

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'}
Plug 'elzr/vim-json'

" auto complete plug; deoplete for vim8.0 need `has('python3')` for async " `pip3 install neovim` is required or `pacin python-neovim` in archlinux
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete engine
autocmd FileType c,cpp let b:deoplete_disable_auto_complete = 1
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'zchee/deoplete-go', { 'do': 'make'}                     " golang
Plug 'Shougo/neco-vim', {'for': 'vim'}                        " Vim
Plug 'wellle/tmux-complete.vim'                               " tmux panes

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
Plug 'python-mode/python-mode'
Plug 'davidhalter/jedi-vim'

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
"
" async lint
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()
