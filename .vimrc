" ===================================
" filename: .vimrc
" author  : leviosa42
" license : MIT license
" ===================================

" ===================================
"   GENERAL
" ===================================
" Vi Improved
if &compatible
    set nocompatible
endif
set runtimepath^=~/.vim
set runtimepath+=~/.vim/after

" Encodings
set fileformat=unix
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

set clipboard+=unnamed
set clipboard+=unnamedplus

set whichwrap=b,s,h,l,<,>,[,]

syntax on

filetype plugin indent off

augroup filetype_settings
    au BufNewFile,BufRead *.vim   set filetype=vim
    au BufNewFile,BufRead *.vimrc set filetype=vim
    au BufNewFile,BufRead *.c     set filetype=c
    au BufNewFile,BufRead *.js    set filetype=javascript
    au BufNewFile,BufRead *.py    set filetype=python
    au BufNewFile,BufRead *.sh    set filetype=sh
    au BufNewFile,BufRead *.bash  set filetype=sh
    au BufNewFile,BufRead *.ash   set filetype=sh
augroup END

" ===================================
"   EDITING
" ===================================
set incsearch
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wildmode=longest:list,full
set autochdir
set backspace=indent,eol,start

" indent
set noexpandtab
set tabstop=4
set softtabstop=-1
set shiftwidth=0
set autoindent
set smartindent
" ref: https://qiita.com/ysn/items/f4fc8f245ba50d5fb8b0
augroup filetype_indent_settings
    au FileType vim    setl et   ts=2 sts=-1 sw=0
    au FileType c      setl noet ts=4 sts=-1 sw=0
    au FileType js     setl noet ts=4 sts=-1 sw=0
    au FileType python setl et   ts=4 sts=-1 sw=0
    au FileType sh     setl et   ts=2 sts=-1 sw=0
augroup END

" ===================================
"   APPEARANCE
" ===================================
set number
set ruler
set cursorline
set showmatch
set showmode
set list
set listchars+=tab:>\ 
set listchars+=trail:~
set listchars+=nbsp:%
"set listchars+=eol:$
set listchars+=extends:»
set listchars+=precedes:«
"set listchars+=space:·
set laststatus=2

" ===================================
"   KEYBINDINGS
" ===================================
nnoremap j gj
nnoremap k gk
nnoremap <Up> gj
nnoremap <Down> gk

filetype on
filetype plugin on
filetype indent on

set background=dark
colorscheme default