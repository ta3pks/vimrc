"vim plug init
call plug#begin('~/plugged')
Plug 'keith/investigate.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'stephpy/vim-yaml'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'jwalton512/vim-blade'
Plug 'scrooloose/nerdtree'
Plug 'gregsexton/MatchTag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'zchee/deoplete-go'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'wakatime/vim-wakatime'
Plug 'bling/vim-airline'
call plug#end()
"settings
syntax on
set t_Co=256 
if has('nvim')
	colorscheme evening
else
	colorscheme elflord
endif
"sets
set linebreak
set wrap
set foldmethod=indent
set tabstop=4
set noexpandtab
set shiftwidth=4
set list
set listchars=tab:▸\ ,eol:¬  
set nohlsearch
set wildmenu
set wildmode=longest,list
set wildignore=*node_modules/*
set nowrap
set splitbelow
set splitright
set path=.,/usr/include,,**
set nu
set smartindent
set backspace=2
set splitright
set mouse=a
set statusline+=%#warningmsg#
set statusline+=%*
set statusline=%{LinterStatus()}
let g:ale_fixers = {
			\   'javascript': ['eslint'],
			\}
let g:ale_linters = {
			\   'javascript': ['eslint'],
			\}
let g:ale_set_balloons = 1
let g:ale_set_highlights= 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let NERDTreeWinSize = 30
"maps
noremap <Leader>1 ^
noremap <Leader>2 $
noremap <Leader>n :NERDTreeToggle<CR>
noremap <Leader>l :set list!<cr>
noremap <Leader>p <C-p>
noremap <Leader>b :CtrlPBuffer<cr>
noremap <Leader><Leader> %
noremap <Leader><cr> <ESC>:!tmux a -t vim<cr>
noremap <leader>q <esc>:wa <cr> :mksession! ~/Session.vim <cr> :qa <cr>
noremap <Leader>o <esc>:so ~/Session.vim <cr>
noremap <Leader>w <C-w>
noremap <Leader>] <esc> :lnext <cr>
noremap <Leader>[ <esc> :lprev <cr>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <Leader>' <esc> :execute 'GoImport' input('name:')<cr>
noremap <Leader>. <ESC> :vsp <cfile><CR>
noremap <C-o> <ESC> :execute 'find' input("file:")<CR>
if has('nvim')
	noremap <Leader><cr> :vsp\|:term <cr> 
endif
autocmd BufNewFile,BufRead *.go nnoremap .. :GoImports<CR>
autocmd vimenter * NERDTree
"habbit breaking
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
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
