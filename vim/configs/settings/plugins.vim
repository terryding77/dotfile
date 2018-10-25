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
" completion
""""" coc use for typescript
Plug 'neoclide/coc.nvim', {'do': 'yarn install', 'for': ['typescript', 'typescript.tsx']}
""""" ncm2 use for python
Plug 'ncm2/ncm2', {'for': ['python']}
if has('nvim')
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
Plug 'ncm2/ncm2-jedi', {'for': ['python']}
Plug 'ncm2/ncm2-go', {'for': ['go']}
Plug 'ncm2/ncm2-ultisnips', {'for': ['python']}
Plug 'ncm2/ncm2-vim', {'for': 'vim'} | Plug 'Shougo/neco-vim', {'for': 'vim'}
""""" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': ['go'] }
else
"  Plug 'Shougo/deoplete.nvim' ", {'for': ['go']}
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
""""" snippets
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
