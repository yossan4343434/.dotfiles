" general
set autoread
set noswapfile
set nobackup
set hidden
set noerrorbells
set guioptions-=m

" display
set title
set number
set ruler
set wildmenu
set showcmd
set showmatch
set lazyredraw
set laststatus=2
set scrolloff=5
set completeopt=menuone
au BufRead, BufNewFile *md set filetype=markdown
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" editor
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set clipboard+=unnamed
set clipboard=unnamed
set backspace=indent,eol,start

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
noremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>

" keymap
noremap <Space> :w<CR>
noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap L $
noremap H ^
noremap <C-H> X
noremap ZZ <Nop>
noremap ZQ <Nop>
nnoremap <silent> <Space>o o<Esc>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *N
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap ; :
nnoremap : ;

inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-D> <Del>
inoremap jj <Esc>

" theme
colorscheme hybrid
hi Visual guifg=#0000FF guibg=#FFFF00 gui=none

" dein
if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir      = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:rc_dir    = expand('~/.config/nvim')
  let s:toml      = s:rc_dir . '/dein.toml'
  let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" go
autocmd FileType go setlocal noexpandtab
autocmd FileType go setlocal tabstop=4
autocmd FileType go setlocal shiftwidth=4

filetype plugin indent on
syntax enable
