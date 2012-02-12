" From public and personal repos
" agimat@gmail.com 

set nocompatible               
set fileformats=unix,dos,mac
set background=dark
set ruler
set more
set autoread
set number 
set hidden
set noautowrite
set lazyredraw
set showmode
set showcmd
set autoindent smartindent
set smarttab
set sw=4 ts=4
set scrolloff=5
set sidescrolloff=5
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2
set undolevels=1000
set updatecount=100
set complete=.,w,b,u,U,t,i,d
set ttyfast
set noerrorbells
set shell=bash
set wildmode=longest:full
set wildmenu
set encoding=utf-8

"------------------------------------------------------------"

set incsearch
set ignorecase
set hlsearch
set showmatch
set matchtime=2
set diffopt=filler,iwhite
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache


"------------------------------------------------------------"

let maplocalleader=','

filetype off     
filetype indent on
filetype plugin on              
syntax on
let g:indent_guides_enable_on_vim_startup=1

"------------------------------------------------------------"
set rtp+=~/dotfiles/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" original repos on github
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'gregsexton/MatchTag'
Bundle 'itspriddle/vim-jquery'
Bundle 'vim-scripts/ZoomWin'

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"------------------------------------------------------------"

let g:Powerline_symbols = 'fancy'
set laststatus=2
" let g:jellybeans_use_lowcolor_black = 0

" highlight current line 
" set cul                                           
" hi CursorLine term=none cterm=none ctermbg=3     

" mappings 
" toggle list mode
nmap <LocalLeader>tl :set list!<cr>
" toggle paste mode
nmap <LocalLeader>pp :set paste!<cr>

" handle cursor wrap on long lines
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

map cc :.,$s/^ *//<CR>

" highlight flicker cterm=bold ctermfg=white
" au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'

" 
" set t_Co=256 

" Open Nerdtree if no file specified in commandline
autocmd vimenter * if !argc() | NERDTree | endif

" Close if Nerdtree is the last window open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
" Previous Window
nmap <silent> <C-p> :wincmd p<CR>
"
" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>
"
" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>

" Nerdtree 
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node

" zoomwin
nmap <silent> <leader>wo :ZoomWin<CR>

" vundle
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bc :BundleClean<CR>



