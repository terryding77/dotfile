" tagbar with golang settings
" ensure ctags exist.(`pacin ctags` for archlinux)
" go get -u github.com/jstemmer/gotags
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
let g:ale_linters = {'go': ['golint', 'go vet', 'go build']}

" vim-go custom mappings
au filetype go nmap <leader>s :w<CR><plug>(go-implements)
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
au filetype go nmap <leader>e <plug>(go-rename)
