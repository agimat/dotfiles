" From public and personal repos
" agimat@gmail.com 

set nocompatible               
set fileformats=unix,dos,mac
set background=dark
set shiftwidth=2
set tabstop=2
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
set et sw=4 ts=4
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

"------------------------------------------------------------"

set incsearch
set ignorecase
set hlsearch
set showmatch
set diffopt=filler,iwhite


"------------------------------------------------------------"

let maplocalleader=','

filetype off     
filetype indent on
filetype plugin on              
syntax on

"------------------------------------------------------------"

set rtp+=~/dotfiles/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" original repos on github
Bundle 'Lokaltog/vim-powerline'

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

" Poweline 
let g:Powerline_symbols = 'fancy'
set laststatus=2

" highlight current line 
set cul                                           
hi CursorLine term=none cterm=none ctermbg=3     

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

