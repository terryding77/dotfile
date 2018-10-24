let g:ale_linters['c'] = ['clang']
let g:ale_fixers['c'] = ['clang-format']
au filetype c nmap <leader>f :ALEFix<CR>

let g:ale_linters['cpp'] = ['clang']
let g:ale_fixers['cpp'] = ['clang-format']
au filetype cpp nmap <leader>f :ALEFix<CR>

let g:ale_c_clangformat_options = '
\   -style="{
\       BasedOnStyle: llvm,
\       IndentWidth: 4,
\       ColumnLimit: 100,
\       AllowShortFunctionsOnASingleLine: None,
\       KeepEmptyLinesAtTheStartOfBlocks: false
\   }"'

" <leader>r 编译和运行C
au filetype c nmap <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %< && ./%<"
endfunc

" <leader>r 编译和运行CPP
au filetype cpp nmap <leader>r :call CompileRunGpp()<CR>
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %< && ./%<"
endfunc
