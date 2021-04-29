set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Awesome plugins:
Plugin 'tpope/vim-fugitive'
Plugin 'ayu-theme/ayu-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-bufferline'
Plugin 'scrooloose/syntastic'
Plugin 'junegunn/fzf'

" Tabnine
Plugin 'zxqfl/tabnine-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" " Ayu color scheme
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu




" " support 256 colors(for Xterm)
set t_Co=256
syntax enable
set backspace=indent,eol,start
set number
set ruler

"" " " 4 spaces for 'Tab' for >> or <<
"" set shiftwidth=4
"" set softtabstop=4
"" set showcmd
"" set wildmenu
"" set visualbell
"" set ruler
"" set nocompatible
"" set encoding=utf-8
"" ""set wrap
"" set textwidth=79
"" set formatoptions=tcqrn1
"" set listchars=tab:▸\ ,eol:¬
"" "
"" " " set tabs to have 4 spaces
"" set ts=4
"" "
"" " " indent when moving to the next line while writing code
"" set autoindent
"" "
"" " " expand tabs into spaces
"" set expandtab
"" set noshiftround
"" set ttyfast
"" set laststatus=2
"" set showmode
"" 
"" "
"" " " show a visual line under the cursor's current line
"" set cursorline
"" "
"" " " show the matching part of the pair for [] {} and ()
"" set showmatch
"" set lazyredraw
"" set incsearch
"" set hlsearch
"" set foldenable
"" set foldlevelstart=10
"" set foldnestmax=10
"" set foldmethod=indent
"" 
"" set background=dark
"" "
"" " " enable full mouse support
"" set mouse=a
"" " " enable all Python syntax highlighting features
"" let python_highlight_all = 1
"" set secure
"" 
"" " " enable highlighting on overlimit rule
"" set colorcolumn=80
"" "highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"" "match OverLength /\%100v.\+/
"" 
"" " " change cursor shape in different modes
"" " " default for visual, line for insert mods
"" "let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"" "let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"" "let &t_EI = "\<Esc>]50;CursorShape=0\x7"
