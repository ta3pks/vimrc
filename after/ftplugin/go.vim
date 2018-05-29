	augroup golangCustom
		au! golangCustom
	augroup END
	let path=&path . ",".$GOPATH."/src/"
	let &path=path
	nnoremap <buffer> <Leader>gt <esc> :GoTest<cr>
	nnoremap <buffer> <Leader>gb :GoToggleBreakpoint<cr>
	nnoremap <buffer> <Leader>gd <esc> :GoDef<cr>
	nnoremap <buffer> <Leader>gs <esc> :vsp \| :GoDef <cr>
	nnoremap <buffer> <Leader>gi <esc> :execute 'GoImport' input('name:')<cr>
	nnoremap <buffer> <Leader>gk :GoKeyify<cr>
	nnoremap <buffer> <Leader>gm :GoMetaLinter<cr>
	nnoremap <buffer> <Leader>ga :execute 'GoAddTags' input('type: ')<cr>
	nnoremap <buffer> <Leader>gr :GoRename<cr>
	nnoremap <buffer> <Leader>gc :GoCallers<cr>
	nnoremap <buffer> <Leader>ge :GoRun <cr>
	nnoremap <buffer> <leader>g] :GoImports<CR>
	nnoremap <buffer> !! :GoAlternate<CR>
	nnoremap <buffer> <C-d> :GoDecls<cr>
	

	"SNIPPETS
	inoreabbr <buffer> td: //TODO: 
	inoreabbr <buffer> meth func(:% struct %: :% <Type> %:) :% <funcName> %: (:% <params> %:):% <returnValues> %:{:% <funcBody> %:}
	inoreabbr <buffer> fnc func :% <funcName> %: (:% <params> %:):% <returnType> %:{:% <funcBody> %:}
	inoreabbr <buffer> tp type :%<name>%: :%<data>%:
	inoreabbr <buffer> hndl func :% <name> %:(w http.ResponseWriter,r *http.Request){:% <body> %:}
	inoreabbr <buffer> hndlf http.HandlerFunc(func :% <name> %:(w http.ResponseWriter,r *http.Request){:% <body> %:})
	inoreabbr <buffer> mdlw func :% <name> %:(next http.Handler)http.Handler{<cr>:% <body> %:<cr>}
	inoreabbr <buffer> _tst func Test:%<Name>%:(t *testing.T){<cr>:%<Body>%:<cr>} 
	inoreabbr <buffer> finit func init(){<cr>:%<Body>%:<cr>} 
	inoreabbr <buffer> mapi map[string]interface{}{:% <Body> %:}
