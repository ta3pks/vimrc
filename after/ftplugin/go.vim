	augroup golangCustom
		au! golangCustom
		au BufWritePost *.go :normal zv
	augroup END
	let path=&path . ",".$GOPATH."/src/"
	let &path=path
	nnoremap <buffer> <Leader>gt <esc> :GoTest<cr>
	nnoremap <buffer> <Leader>gb :GoToggleBreakpoint<cr>
	nnoremap <buffer> <Leader>gd <esc> :GoDef<cr>
	nnoremap <buffer> <Leader>gs <esc> :call <SID>ADDCOMMENT() <cr>
	nnoremap <buffer> <Leader>gi <esc> :execute 'GoImport' input('name:')<cr>
	nnoremap <buffer> <Leader>gk :GoKeyify<cr>
	nnoremap <buffer> <Leader>gm :GoMetaLinter<cr>
	nnoremap <buffer> <Leader>ga :execute 'GoAddTags' input('type: ')<cr>
	nnoremap <buffer> <Leader>gr :GoRename<cr>
	nnoremap <buffer> <Leader>gc :GoCallers<cr>
	nnoremap <buffer> <Leader>ge :call <SID>RUNGO() <cr>
	nnoremap <buffer> <leader>g] :tabnew /tmp/main.go<CR>
	nnoremap <buffer> !! :GoAlternate<CR>
	nnoremap <buffer> <C-d> :GoDecls<cr>
	nnoremap <buffer><silent> \\ :GoImports<cr>

	"SNIPPETS
	inoreabbr <buffer> noimp fmt.Errorf("not implemented yet")
	inoreabbr <buffer> ferrf fmt.Errorf(":% <error message> %:")
	inoreabbr <buffer> td: //TODO: 
	inoreabbr <buffer> meth func(:% struct %: :% <Type> %:) :% <funcName> %: (:% <params> %:):% <returnValues> %:{:% <funcBody> %:}
	inoreabbr <buffer> fnc func :% <funcName> %: (:% <params> %:):% <returnType> %:{:% <funcBody> %:}
	inoreabbr <buffer> tp type :%<name>%: :%<data>%:
	inoreabbr <buffer> hndl func :% <name> %:(w http.ResponseWriter,r *http.Request){:% <body> %:}
	inoreabbr <buffer> hndlp func :% <name> %:(w http.ResponseWriter,r *http.Request,p httprouter.Params){:% <body> %:}
	inoreabbr <buffer> hndlf http.HandlerFunc(func :% <name> %:(w http.ResponseWriter,r *http.Request){:% <body> %:})
	inoreabbr <buffer> mdlw func :% <name> %:(next http.Handler)http.Handler{<cr>:% <body> %:<cr>}
	inoreabbr <buffer> _tst func Test:%<Name>%:(t *testing.T){<cr>:%<Body>%:<cr>} 
	inoreabbr <buffer> finit func init(){<cr>:%<Body>%:<cr>} 
	inoreabbr <buffer> map map[:%<key>%:]:%<value>%:
	inoreabbr <buffer> mapi map[string]interface{}{:% <Body> %:}
	inoreabbr <buffer> _maps map[string]string{:% <Body> %:}
	
	function!  s:RUNGO() 
			GoRun
			execute "normal \<c-w>\<c-w>i"
		endfunction	
	function! s:ADDCOMMENT()
		call feedkeys("yiwO//pA ")
	endfunction
