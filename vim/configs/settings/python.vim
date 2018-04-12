"autocmd FileType python noremap <buffer> <leader>b :call Autopep8()<CR>:w<CR>
au BufWrite *.py :call Autopep8()
let g:autopep8_disable_show_diff=1

" ale for python
let g:ale_linters['python'] = ['flake8']
let g:ale_fixers['python'] = ['autopep8']
au filetype python nmap <leader>f :ALEFix<CR>
"let g:ale_python_flake8_args = '-m flake8 --max-line-length=120'

""jedi
let g:jedi#goto_command = "<C-]>"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>i"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>s"
let g:jedi#completions_enabled = 0

" set python3 first
if v:version > 800
    set pyxversion=0
endif

au filetype python nmap <leader>r :call CompileRunPython()<CR>
func! CompileRunPython()
    exec "w"
    exec "!time python %"
endfunc
