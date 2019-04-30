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

" set mouse=a

" " always show signcolumns
" set signcolumn=yes

" " 设置搜索高亮
" set hlsearch
" " 显示tab和空格
" set list
" " 设置tab和空格样式
" set listchars=tab:\|\ ,nbsp:%,trail:-
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set expandtab
" set backspace=indent,eol,start
" " 允许在未保存的情况下切换窗口
" set hidden
" " 设置相对行号
" set number
" set relativenumber

