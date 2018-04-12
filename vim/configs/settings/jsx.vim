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
