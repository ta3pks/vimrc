	augroup golangCustom
		au! golangCustom
	augroup END
	nnoremap <buffer> ]<leader> :GoImports<CR>
	nnoremap <buffer> <C-g>t <esc> :GoToggleBreakpoint<cr>
	nnoremap <buffer> <C-g><C-g> <esc> :GoDebug<cr>
	nnoremap <buffer> <C-g>s <esc> :vsp \| :GoDef <cr>
	nnoremap <buffer> <C-g>' <esc> :execute 'GoImport' input('name:')<cr>
	nnoremap <buffer> <C-g>k :GoKeyify<cr>
	nnoremap <buffer> <C-g>a :GoAddTags<cr>
	nnoremap <buffer> <C-g>r :GoRename<cr>
	nnoremap <buffer> <C-g>c :GoCallers<cr>
	

	"SNIPPETS
	inoreabbr <buffer> td: //TODO: 
	inoreabbr <buffer> meth func(:% struct %: :% <Type> %:) :% <funcName> %: (:% <params> %:):% <returnValues> %:{:% <funcBody> %:}
	inoreabbr <buffer> fnc func :% <funcName> %: (:% <params> %:):% <returnType> %:{:% <funcBody> %:}
	inoreabbr <buffer> tp type :%<name>%: :%<data>%:
	inoreabbr <buffer> hndl func :% <name> %:(w http.ResponseWriter,r *http.Request){:% <body> %:}
	inoreabbr <buffer> hndlf http.HandlerFunc(func :% <name> %:(w http.ResponseWriter,r *http.Request){:% <body> %:})
	inoreabbr <buffer> mdlw func :% <name> %:(next http.Handler)http.Handler{<cr>:% <body> %:<cr>}
	inoreabbr <buffer> _tst func Test:%<Name>%:(t *testing.T){<cr>:%<Body>%:<cr>} 
