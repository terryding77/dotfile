scriptencoding utf-8
call plug#begin('~/.vim/plugged')
" 1 appearance
" theme
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 2 coding
" linter and fixer
Plug 'w0rp/ale'
" completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" commentary
Plug 'tpope/vim-commentary'
" csv
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
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
" Initialize plugin system
call plug#end()
