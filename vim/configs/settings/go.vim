" tagbar with golang settings
" ensure ctags exist.(`pacin ctags` for archlinux)
" go get -u github.com/jstemmer/gotags
let g:tagbar_sort = 0
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" ale for go
let g:ale_linters['go'] = ['golint', 'go vet', 'go build']

" vim-go custom mappings
"au filetype go nmap <leader>s :w<CR><plug>(go-implements)
"au filetype go nmap <leader>i <plug>(go-info)
"au filetype go nmap <leader>gd <plug>(go-doc)
"au filetype go nmap <leader>gv <plug>(go-doc-vertical)
au filetype go nmap <leader>r :w<CR><plug>(go-imports)<plug>(go-run)
au filetype go nmap <leader>b :w<CR><plug>(go-imports)<plug>(go-build)
au filetype go nmap <leader>t :w<CR><plug>(go-test)
au filetype go nmap <leader>c <plug>(go-coverage)
"au filetype go nmap <leader>ds <plug>(go-def-split)
"au filetype go nmap <leader>dv <plug>(go-def-vertical)
"au filetype go nmap <leader>dt <plug>(go-def-tab)
"au filetype go nmap <leader>e <plug>(go-rename)
au FileType go nmap <leader>s :GoReferrers<CR>

""""vim-go"""
" highlight options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
" 显示引用列表的窗口高度
let g:go_list_height = 10
