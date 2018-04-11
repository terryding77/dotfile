let g:pymode = 0
let g:pymode_python = 'python3'
let g:pymode_lint_on_fly = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_doc = 1
"let g:pymode_doc_bind = '<leader>t'
"let g:pymode_rope = 1
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_autoimport = 1
"let g:pymode_rope_autoimport_import_after_complete = 1
"let g:pymode_rope_goto_definition_bind = '<C-]>'
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']

"autocmd FileType python noremap <buffer> <leader>b :call Autopep8()<CR>:w<CR>
au BufWrite *.py :call Autopep8()
let g:autopep8_disable_show_diff=1

" ale for python
let g:ale_linters = {'python': ['flake8']}
