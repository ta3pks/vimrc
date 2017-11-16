"vim plug init
call plug#begin('~/plugged')
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
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'fatih/vim-go'
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
colorscheme elflord
if has("gui_running")
	colorscheme evening
endif
"sets
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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let syntastic_javascript_checkers = ["eslint"]
"maps
noremap <Leader>1 ^
noremap <Leader>2 $
noremap <Leader>l :set list!<cr>
noremap <Leader>p <C-p>
noremap <Leader>b :CtrlPBuffer<cr>
noremap <Leader><Leader> %
noremap <Leader><cr> <ESC>:!tmux a -t vim<cr>
noremap <Leader>w <C-w>
noremap <Leader>] <esc> :lopen <cr>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
noremap <C-l> :GoImports<CR>
noremap <Leader>. <ESC> :vsp <cfile><CR>
noremap <C-o> <ESC> :execute 'find' input("file:")<CR>
if has('nvim')
	noremap <Leader><cr> :vsp\|:term <cr> 
endif
autocmd BufNewFile,BufRead *.go nnoremap .. :GoRun<CR>
"habbit breaking
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"habbit breaking end
"functions
