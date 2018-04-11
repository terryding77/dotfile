" <F5> 编译和运行C
au filetype cpp nmap <leader>r :call CompileRunGpp()<CR>
au filetype c nmap <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "!gcc % -o %< && ./%<"
endfunc
func! CompileRunGpp()
    exec "w"
    exec "!g++ % -o %< && ./%<"
endfunc
