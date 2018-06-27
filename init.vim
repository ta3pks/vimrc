au!
"vim plug init
call plug#begin('~/plugged')
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'chr4/nginx.vim'
Plug 'sk1418/HowMuch'
Plug 'tmux-plugins/vim-tmux'
Plug 'vim-scripts/netrw.vim'
Plug 'tpope/vim-dadbod'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'jodosha/vim-godebug' "for neovim
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'Raimondi/delimitMate'
Plug 'stephpy/vim-yaml'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'scrooloose/nerdtree'
Plug 'gregsexton/MatchTag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ludovicchabant/vim-ctrlp-autoignore'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'wakatime/vim-wakatime'
Plug 'bling/vim-airline'
Plug 'leafgarland/typescript-vim'
call plug#end()
"settings
syntax on
set t_Co=256 
colorscheme elflord
"sets
set ignorecase
set numberwidth=1
set smartcase
set background=dark
set linebreak
set wrap
set foldlevel=0
set nofoldenable
set foldmethod=indent
set tabstop=4
set noexpandtab
set shiftwidth=4
set list
set listchars=tab:▸\ ,eol:¬  
set nohlsearch
set wildmenu
set wildmode=full
set wildignore=*node_modules/*,*/vendor/*
set wildignorecase
set nospell
set splitbelow
set splitright
set path=.,/usr/include,,**
set nu
set rnu
set autoindent
set backspace=2
set splitright
set mouse=a
set statusline+=%#warningmsg#
set statusline+=%*
set statusline=%{LinterStatus()}
"registers


"""""""""""
let g:ctrlp_extensions = ['autoignore']
let g:ale_fixers = {
			\ 'javascript' : ['eslint'],
			\ 'go'         : ['goimports'],
			\ 'typescript' : ['tslint','prettier'],
			\}
let g:ale_linters = {
			\ 'javascript' : ['eslint'],
			\ 'go'         : ['go build'],
			\ 'html'       : ['tidy'],
			\}
let g:ale_set_highlights= 1
let g:scratch_insert_autohide = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme='violet'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let NERDTreeWinSize = 30
if has('nvim')
	func! OpenTerm()
		vsp
		term bash
		normal i
	endfunction
	noremap <silent> <Leader><cr> :call OpenTerm() <cr> 
else
	noremap <Leader><cr> <ESC>:!tmux a -t vim<cr>
endif
autocmd bufenter * :checktime
autocmd VimLeavePre * :mksession! ./Session.vim 
autocmd VimEnter * :call LoadSession()
autocmd FileType javascript noremap <Leader>s <esc> :vsp \| :TernDef<cr>
autocmd FileType javascript noremap <Leader>d <esc>:TernDef <cr>
"maps
inoremap <C-space> <C-x><C-o>
nnoremap <silent><C-w>r <esc>:so $MYVIMRC<cr>
nnoremap <silent><C-w><C-s> <esc>:tabnew $MYVIMRC<cr>
nnoremap <silent><Leader>j :jumps<cr>
nnoremap <silent><Leader>gg :Gstatus<CR>
nnoremap <silent><Leader>l :set list!<cr>
nnoremap <Leader>p :Gpush<cr>
nnoremap <silent><C-b> :CtrlPBuffer<cr>
nnoremap <silent><Leader>nt :NERDTreeToggle<cr>
nnoremap <silent><Leader>nf :NERDTreeFocus<cr>
nnoremap <silent><Leader><Leader> %
nnoremap <silent> Q :q<cr>
nnoremap <silent><C-Up> ddkP
nnoremap <silent><C-Down> ddp
vnoremap <silent><C-Down> xp`[V`]
vnoremap <silent><C-Up> xkP`[V`]
nnoremap <silent><Leader>tt :grep TODO: -r . --exclude-dir "vendor" --exclude-dir "node_modules"<cr>
nnoremap <silent><Leader>s :execute 'grep '.input('search: ').' -r . --exclude-dir "vendor" --exclude-dir "node_modules"'<cr>
nnoremap <silent> \td :s/\c\(todo\):/\1[x]:/<cr>
nnoremap <silent> \tc /\v^\s*\/\/todo[x.*$<cr>dd
nnoremap <silent> \tn //TODO: 
inoremap <silent> \tn //TODO: 
nnoremap <C-k> :lprevious<cr>
nnoremap <C-j> :lnext<cr>
nnoremap <C-f> :lfirst<cr>
nnoremap <C-h> :cprevious<cr>
nnoremap <C-l> :cnext<cr>
nnoremap cp :let @" = expand("%")<cr>
nnoremap # :b #<cr>
"habbit breaking
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
"habbit breaking end
"functions
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction
function! LoadSession()
	if argc()==0
		:silent! source ./Session.vim 
	endif
endfunction
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"registers
let @g="\<C-w>5>"
let @l="\<C-w>5<"
nnoremap U :UndotreeToggle\|:UndotreeFocus<cr>
au filetype javascript nnoremap \ge :!node %<cr>
