au!
"vim plug init
call plug#begin('~/plugged')
Plug 'godlygeek/tabular'
Plug 'mtth/scratch.vim'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'jodosha/vim-godebug' "for neovim
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'
Plug 'ternjs/tern_for_vim'
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
set smartcase
set background=dark
set linebreak
set wrap
set foldlevel=0
set nofoldenable
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
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let NERDTreeWinSize = 30
"placeholder
inoreabbr plhd :%%:<left><left>
if has('nvim')
	noremap <silent> <Leader><cr> :vsp\|:term <cr> 
else
	noremap <Leader><cr> <ESC>:!tmux a -t vim<cr>
endif
au VimLeavePre * :mksession! ./Session.vim 
au VimEnter * :call LoadSession()
au FileType javascript noremap <Leader>s <esc> :vsp \| :TernDef<cr>
au FileType javascript noremap <Leader>d <esc>:TernDef <cr>
"maps
inoremap ;; <esc>/:%[^%]*%:<cr>v/%:<cr><right>c
inoremap <C-space> <C-x><C-o>
nnoremap <silent><C-w>r <esc>:so $MYVIMRC<cr>
nnoremap <silent><C-w><C-s> <esc>:tabnew $MYVIMRC<cr>
nnoremap <silent><Leader>1 ^
nnoremap <silent><Leader>2 $
nnoremap <silent><Leader>j :jumps<cr>
nnoremap <silent><Leader>gg :Gstatus<CR>
nnoremap <silent><Leader>l :set list!<cr>
nnoremap <silent><Leader>p :Gpush<cr>
nnoremap <silent><C-b> :CtrlPBuffer<cr>
nnoremap <silent><Leader>nt :NERDTreeToggle<cr>
nnoremap <silent><Leader>nf :NERDTreeFocus<cr>
nnoremap <silent><Leader><Leader> %
nnoremap <silent> Q :q<cr>
nnoremap <silent><C-Up> ddkP
nnoremap <silent><C-Down> ddp
vnoremap <silent><C-Down> xp`[V`]
vnoremap <silent><C-Up> xkP`[V`]
nnoremap <silent><Leader>o :only<cr>
nnoremap <silent><Leader>tt :grep TODO: -r .<cr>
nnoremap <silent> \td :s/\c\(todo\):/\1[x]:/<cr>
nnoremap <silent> \tc /\v^\s*\/\/todo[x.*$<cr>dd
nnoremap <silent> \tn /TODO:<cr>
nnoremap <silent> \tp ?TODO:<cr>
nnoremap <silent><Leader>tn :cn<cr>
nnoremap <silent><Leader>tp :cp<cr>
nnoremap <silent><C-k> :lprevious<cr>
nnoremap <silent><C-j> :lnext<cr>
nnoremap <silent><C-f> :lfirst<cr>
nnoremap <silent><C-K> :cprevious<cr>
nnoremap <silent><C-J> :cnext<cr>
nnoremap <silent><C-F> :cfirst<cr>
nnoremap <silent>cp :let @" = expand("%")<cr>
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


