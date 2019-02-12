set nocompatible		" be iMproved, required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'joshdick/onedark.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap nt :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Theme
colorscheme dracula
let g:airline_theme='dracula'
" colorscheme PaperColor
" set background=dark
" colorscheme onedark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Common
" Auto syntax highlight
set syntax=on

" Show line number
set number

" Set 1 tab equal 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Set rembermer history
set history=1024

" Set indent
set autoindent
set smartindent

" Set encoding | error in windows
set encoding:utf-8
set fileencodings:utf-8,gbk,gb2312,cp936
set fileencoding:

" Set J == 5j, K == 5k
nmap J 5j
nmap K 5k

" Show tabs and spaces
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tagbar
let g:tagbar_autofocus=1
nmap tb :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"

" CtrlP

