" " support 256 colors(for Xterm)
set t_Co=256
"
" " 4 spaces for 'Tab' for >> or <<
set shiftwidth=4
set softtabstop=4
"
" " enable syntax highlighting
syntax enable
"
" " show line numbers
set number
set showcmd
set wildmenu
set visualbell
set ruler
set nocompatible
set encoding=utf-8
set wrap
set textwidth=79
set formatoptions=tcqrn1
set listchars=tab:▸\ ,eol:¬
"
" " set tabs to have 4 spaces
set ts=4
"
" " indent when moving to the next line while writing code
set autoindent
"
" " expand tabs into spaces
set expandtab
set noshiftround
set ttyfast
set laststatus=2
set showmode

"
" " show a visual line under the cursor's current line
set cursorline
"
" " show the matching part of the pair for [] {} and ()
set showmatch
set lazyredraw
set incsearch
set hlsearch
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

set background=dark
"
" " enable full mouse support
set mouse=a
" " enable all Python syntax highlighting features
let python_highlight_all = 1
set secure

" " enable highlighting on overlimit rule
set colorcolumn=100
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%100v.\+/

" " change cursor shape in different modes
" " default for visual, line for insert mods
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[5 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
