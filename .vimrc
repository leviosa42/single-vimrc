" ===================================
" filename: .vimrc
" author  : leviosa42
" license : MIT license
" ===================================

" Vi Improved
set nocompatible

" ===================================
"   VARIABLES
" ===================================
let g:custom_colorscheme = 'elflord'
"let g:custom_colorscheme = 'molokai'
let g:custom_background = 'dark'
let g:custom_guifont = 'HackGen\ Console:h13'
let g:custom_default_use_softtab = 1
let g:custom_indent_width = 4

let g:custom_enable_pluginmanager = 1
let g:custom_enable_pluginmanager = 0

" ===================================
"   GENERAL
" ===================================
"set runtimepath^=~/.vim
"set runtimepath+=~/.vim/after

" Encodings
set fileformat=unix
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

set clipboard+=unnamed
set clipboard+=unnamedplus

set mouse=a

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
if g:custom_default_use_softtab
  set expandtab
else
  set noexpandtab
endif
execute 'set tabstop=' . g:custom_indent_width
set softtabstop=-1
set shiftwidth=0
set autoindent
set smartindent
" ref: https://qiita.com/ysn/items/f4fc8f245ba50d5fb8b0
augroup filetype_indent_settings
  au FileType vim    setl et   ts=2 sts=-1 sw=0
  au FileType c      setl noet ts=4 sts=-1 sw=0 cindent
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
set showcmd
set showmatch
set showmode
set list
set listchars=   " init
set listchars+=tab:>\ 
set listchars+=trail:~
set listchars+=nbsp:%
"set listchars+=eol:$
set listchars+=extends:»
set listchars+=precedes:«
"set listchars+=space:·

" ===================================
"  STATUSLINE
" ===================================
set laststatus=2
set statusline=   " init
set statusline+=%f
set statusline+=%m
set statusline+=%r
set statusline+=%=
"set statusline+=[%{&fileformat}]
set statusline+=l:%l/%L

" ===================================
"   PLUGINS
" ===================================
if g:custom_enable_pluginmanager
  " bootstrap
  let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
  let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
  if !filereadable(s:jetpackfile)
    call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
  endif
  " plugins
  runtime */jetack.vim
  call jetpack#begin()
  Jetpack 'tani/vim-jetpack', {'opt': 1}
  Jetpack 'vim-jp/vimdoc-ja'
  call jetpack#end()
endif

" ===================================
"   KEYBINDINGS
" ===================================
nnoremap j gj
nnoremap k gk
nnoremap <Up> gk
nnoremap <Down> gj

"inoremap { {}<Left>
"inoremap [ []<Left>
"inoremap ( ()<Left>
"inoremap ' ''<Left>
"inoremap " ""<Left>

filetype on
filetype plugin on
filetype indent on

execute 'set guifont=' . g:custom_guifont
execute 'set background=' . g:custom_background
execute 'colorscheme ' . g:custom_colorscheme

