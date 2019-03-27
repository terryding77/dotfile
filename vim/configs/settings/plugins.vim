scriptencoding utf-8
" set python3 first
if v:version > 800
    set pyxversion=0
endif
set pyxversion=3

call plug#begin('~/.vim/plugged')
" 1 appearance
" theme
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'vim-airline/vim-airline'

" 2 coding
" linter and fixer
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
" completion
""""" coc - use `npm install -g vim-node-rpc` before install
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
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
Plug 'lilydjwg/fcitx.vim'
" calculate startup's time
Plug 'tweekmonster/startuptime.vim'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Initialize plugin system
call plug#end()
