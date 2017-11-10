"vim plug init
call plug#begin('~/plugged')
Plug 'Raimondi/delimitMate'
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
colorscheme slate
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
"maps
map <Leader>1 ^
map <Leader>2 $
map <Leader>l :set list!<cr>
map <Leader>p <C-p>
map <Leader>b :CtrlPBuffer<cr>
map <Leader><Leader> %
map <Leader><cr> <ESC>:!tmux a -t vim<cr>

inoremap jk <ESC>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nmap .. :GoRun<CR>
map <Leader>w <C-w>
map <C-l> :GoImports<CR>
map <Leader>. <ESC> :vsp <cfile><CR>
map <C-o> <ESC> :execute 'find' input("file:")<CR>
"habbit breaking
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"habbit breaking end
