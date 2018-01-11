	nnoremap ]<leader> :GoImports<CR>
	noremap <C-g>t <esc> :GoToggleBreakpoint<cr>
	noremap <C-g><C-g> <esc> :GoDebug<cr>
	noremap <Leader>s <esc> :vsp \| :GoDef <cr>
	noremap <Leader>d <esc>:GoDef <cr>
	noremap <Leader>' <esc> :execute 'GoImport' input('name:')<cr>
	



	"SNIPPETS
	noreabbr meth func(:% struct %: :% <Type> %:) :% <funcName> %: (:% <params> %:):% <returnValues> %:{:% <funcBody> %:}
	noreabbr fnc func :% <funcName> %: (:% <params> %:):% <returnType> %:{:% <funcBody> %:}
	noreabbr tp type :%<name>%: :%<data>%:
	noreabbr hndl func :% <name> %:(w http.ResponseWriter,r *http.Request){:% <body> %:}
	noreabbr mdlw func :% <name> %:(next http.Handler)http.Handler{<cr>:% <body> %:<cr>}
	noreabbr _tst func Test:%<Name>%:(t *testing.T){<cr>:%<Body>%:<cr>} 
