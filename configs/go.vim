augroup go
	au!
	au FileType go nnoremap ]] :GoImports<CR>
	au FileType go noremap <C-g>t <esc> :GoToggleBreakpoint<cr>
	au FileType go noremap <C-g><C-g> <esc> :GoDebug<cr>
	au FileType go noremap <Leader>s <esc> :vsp \| :GoDef <cr>
	au FileType go noremap <Leader>d <esc>:GoDef <cr>
	au FileType go noremap <Leader>' <esc> :execute 'GoImport' input('name:')<cr>
	"SNIPPETS
	au FileType go abbr meth func(<%--%> <%--%>) <%--%> (<%--%>)<%--%>{<%--%>}
	au FileType go abbr fnc func <%--%> (<%--%>)<%--%>{<%--%>}
augroup END

