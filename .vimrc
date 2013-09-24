set nocompatible
set modelines=0

" Explicitly source pathogen since I installed it as a bundle.
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin on
colorscheme murphy
set cc=80
set relativenumber
let mapleader = ','

if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ 9
  " Remove toolbar
  set guioptions -=T
  " Remove menu
  set guioptions -=m
endif

" No tabs
"set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" Tabs
set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" Show useful formatting characters
set list
set listchars=tab:⌐⋅,trail:-
hi SpecialKey ctermfg=7 guifg=gray

set smartindent
set autoindent
filetype indent off
