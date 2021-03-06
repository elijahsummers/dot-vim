set nocompatible
set modelines=0

" Explicitly source pathogen since I installed it as a bundle.
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

if &t_Co > 2 || has("gui_running")
  syntax enable
  "set hlsearch
endif

filetype plugin on
colorscheme jellybeans
set cc=80,120
set relativenumber
let mapleader = ','

if has('gui_running')
  if has('gui_macvim')
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
  else
    "set guifont=DejaVu\ Sans\ Mono\ 9
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
  endif
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

"set smartindent
"set autoindent
filetype indent on

" Treat smarty templates as html, until I find a better solution.
au BufNewFile,BufRead *.tpl set filetype=html

"
" Plugins
"

" Load matchit version that ships with Vim
runtime! macros/matchit.vim

" pdv PHP doc
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
autocmd FileType php nnoremap <Leader>p :call pdv#DocumentWithSnip()<CR>

" Open NERDTree on startup (when no file/stdin is given as arg)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Set which javascript libraries to add to syntax highlighting.
let g:used_javascript_libs = 'jquery,underscore,backbone'

" Add powerline font symbols
let g:airline_powerline_fonts = 1

" Load snippets from plugins (assuming they have a folder named 'snippets')
"let g:UltiSnipsSnippetDirectories=['snippets', 'UltiSnips']

" Make fugitive and editorconfig play nice
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Use silver searcher, if available, for fast Ctrl-P
if executable('ag')
  " Use Ag over Grep
  "set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
