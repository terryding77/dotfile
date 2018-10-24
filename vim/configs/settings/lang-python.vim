"autocmd FileType python noremap <buffer> <leader>b :call Autopep8()<CR>:w<CR>
au BufWrite *.py :call Autopep8()
let g:autopep8_disable_show_diff=1

" ale for python
let g:ale_linters['python'] = ['flake8']
let g:ale_fixers['python'] = ['autopep8']
au filetype python nmap <leader>f :ALEFix<CR>
" let g:ale_python_flake8_args = '-m flake8 --max-line-length=120'
""jedi
let g:jedi#force_py_version = 3
let g:jedi#goto_command = "<C-]>"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>i"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>s"
let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#show_call_signatures = 0

au filetype python nmap <leader>r :call CompileRunPython()<CR>
func! CompileRunPython()
    exec "w"
    exec "!time python %"
endfunc
