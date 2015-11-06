" Basic
set nocompatible
set autoread
set noswapfile
set hidden
set noerrorbells
set guioptions-=m
set vb t_vb=
set backupdir=~/.vim/tmp

" Display
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

" Editor
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set clipboard+=unnamed
set clipboard=unnamed
set backspace=indent,eol,start

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
noremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>

" Keymap
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

" neobundle
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpote/vim-endwise'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim' }
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'nanotech/jellybeans.vim'
call neobundle#end()

filetype plugin indent on

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

" vimfiler
let g:vimfiler_as_default_explorer = 1

nnoremap <C-O> :<C-U>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

au FileType vimfiler noremap <silent> <buffer> <ESC><ESC> :q<CR>

" vim-fugitive
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
let g:indent_guides_guide_size=1

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=235

" powerline
let g:Powerline_symbols = 'compatible'

set t_Co=256

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplete_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplete_use_vimproc = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#sources#dictionary#dictionaries = {
\   'default' : '',
\   'vimshell' : $HOME.'/.vimshell_hist',
\   'scheme' : $HOME.'/.gosh_completions'
\ }

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><TAB>  pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-H>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" yankround.vim
let g:yankround_max_history = 100

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-]> <Plug>(yankround-prev)
nmap <C-[> <Plug>(yankround-next)

" quickrun
let g:quickrun_config = {
\   "_" : {
\     "outputter/buffer/split" : "botright 8sp",
\     "outputter/buffer/close_on_empty" : 1,
\     "outputter/buffer" : "quickfix"
\   }
\ }

au FileType quickrun noremap <silent> <buffer> <ESC><ESC> :q<CR>

" vim-easy-align
vmap <CR> <Plug>(EasyAlign)

" Theme
colorscheme hybrid
syntax on
hi Visual  guifg=#0000FF guibg=#FFFF00 gui=none
