" Basic
set nocompatible
set autoread
set noswapfile
set hidden

" Display
set title
set number
set ruler
set wildmenu
set showcmd
set showmatch
set laststatus=2
highlight LineNr ctermfg=gray
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
noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap L $
noremap H ^
noremap <C-H> X
noremap o A<CR>
noremap <Space>o o<Esc>
noremap ZZ <Nop>
noremap ZQ <Nop>
nnoremap ; :
nnoremap : ;
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-D> <Del>

" NeoBundle
set nocompatible
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
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp': 'powerline/bindings/vim' }
NeoBundle 'Lokaltog/powerline-fontpatcher'
NeoBundle 'altog/powerline-fontpatcher'
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
call neobundle#end()

filetype plugin indent on

" unite.vim
let g:unite_enable_start_insert = 1

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-B> :Unite file_mru<CR>
noremap <C-F> :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

nnoremap <silent> <Space>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> <Space>cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

au FileType unite noremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite noremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite noremap <silent> <buffer> <ESC><ESC> :q<CR>

" vimfiler
let g:vimfiler_as_default_explorer = 1

nnoremap <silent> <Space>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

" vim-fugitive
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=233
let g:indent_guides_guide_size=1

" powerline
let g:Powerline_symbols = 'compatible'

set t_Co=256

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplete_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'vimshell' : $HOME.'/.vimshell_hist',
  \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Theme
colorscheme hybrid
syntax on
