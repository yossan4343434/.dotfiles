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
set laststatus=2
set scrolloff=5
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
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-D> <Del>

" theme
colorscheme hybrid
hi Visual guifg=#0000FF guibg=#FFFF00 gui=none

" dein
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimproc')
  call dein#add('Shougo/neomru.vim')
  call dein#add('rking/ag.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpote/vim-endwise')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('kannokanno/previm')
  call dein#add('tyru/open-browser.vim')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" unite.vim
let g:unite_enable_start_insert = 1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

nnoremap <C-P> :Unite buffer<CR>
nnoremap <C-N> :Unite -buffer-name=file file<CR>
nnoremap <C-F> :<C-U>UniteWithBufferDir file -buffer-name=file<CR>
nnoremap <C-B> :Unite file_mru<CR>
nnoremap <C-G> :<C-U>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <Space>g :<C-U>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

au FileType unite noremap <silent> <buffer> <ESC><ESC> :q<CR>

" vim-fugitive
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=235
