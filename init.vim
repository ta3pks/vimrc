au!
"vim plug init
call plug#begin('~/plugged')
Plug 'jodosha/vim-godebug'
Plug 'w0rp/ale'
Plug 'ternjs/tern_for_vim'
Plug 'Raimondi/delimitMate'
Plug 'stephpy/vim-yaml'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'scrooloose/nerdtree'
Plug 'gregsexton/MatchTag'
Plug 'ctrlpvim/ctrlp.vim'
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
call plug#end()
"settings
syntax on
set t_Co=256 
colorscheme elflord
"sets
set ignorecase
set smartcase
set background=dark
set linebreak
set wrap
set foldmethod=indent
set foldlevel=0
set nofoldenable
set tabstop=4
set noexpandtab
set shiftwidth=4
set list
set listchars=tab:▸\ ,eol:¬  
set nohlsearch
set wildmenu
set wildmode=longest,list
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
let g:ctrlp_extensions = ['autoignore']
let g:ale_fixers = {
			\   'javascript': ['eslint'],
			\}
let g:ale_linters = {
			\   'javascript': ['eslint'],
			\   'go':['go build'],
			\}
let g:ale_set_highlights= 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let NERDTreeWinSize = 30
"maps
inoremap ;; <esc>/{%[^%]*%}<cr>v/%}<cr><right>c
"placeholder
abbr plhd {%%}<left><left> 
noremap <C-w>r <esc>:so $MYVIMRC<cr>
noremap <C-w><C-s> <esc>:tabnew $MYVIMRC<cr>
noremap <Leader>1 ^
noremap <Leader>2 $
noremap <Leader>g :Gstatus<CR>
noremap <Leader>c :Gcommit<CR>
noremap <Leader>l :set list!<cr>
noremap <Leader>p :Gpush<cr>
noremap <C-b> :CtrlPBuffer<cr>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader><Leader> %
if has('nvim')
	noremap <Leader><cr> :vsp\|:term <cr> 
else
	noremap <Leader><cr> <ESC>:!tmux a -t vim<cr>
endif
au VimLeavePre * :mksession! ./Session.vim 
au VimEnter * :call LoadSession()
au BufWritePost * :call OpenFolded()
au FileType javascript noremap <Leader>s <esc> :vsp \| :TernDef<cr>
au FileType javascript noremap <Leader>d <esc>:TernDef <cr>
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
function! OpenFolded()
	if foldclosed(getcurpos()[1]) != -1
		:foldopen
	endif
endfunction
