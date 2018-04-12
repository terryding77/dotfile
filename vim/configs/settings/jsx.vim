let javascript_enable_domhtmlcss = 1

" ale for python
let g:ale_linters['typescript'] = ['tslint']
let g:ale_fixers['typescript'] = ['tslint']
let g:ale_fixers['javascript'] = ['eslint']
au filetype javascript nmap <leader>f :ALEFix<CR>
au filetype typescript nmap <leader>f :ALEFix<CR>

" typescript settings 
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

" tagbar settings
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds': [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
"" ts需要下载: npm install --global git+https://github.com/Perlence/tstags.git
"let g:tagbar_type_typescript = {
"  \ 'ctagsbin' : 'tstags',
"  \ 'ctagsargs' : '-f-',
"  \ 'kinds': [
"    \ 'e:enums:0:1',
"    \ 'f:function:0:1',
"    \ 't:typealias:0:1',
"    \ 'M:Module:0:1',
"    \ 'I:import:0:1',
"    \ 'i:interface:0:1',
"    \ 'C:class:0:1',
"    \ 'm:method:0:1',
"    \ 'p:property:0:1',
"    \ 'v:variable:0:1',
"    \ 'c:const:0:1',
"  \ ],
"  \ 'sort' : 0
"\ }
"""""end""
""""""emmet-vim settings""
let g:user_emmet_install_global = 0
""""""end""

" Set bin if you have many instalations
"let g:deoplete#sources#ternjs#tern_bin = '/path/to/tern_bin'
let g:deoplete#sources#ternjs#timeout = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some
" heuristics to try and return some properties anyway. Set this to 0 to
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0


"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
