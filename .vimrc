" Display
colorscheme desert
syntax on
set title
set number
set ruler
set wildmenu
set showcmd
set showmatch
highlight LineNr ctermfg=gray

" Editor
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set autoindent
set cursorline
highlight CursorLine cterm=bold

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase
noremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>

" Keymap
noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap L $
noremap H ^
noremap <C-H> X
noremap <Space>o o<Esc>
noremap ZZ <Nop>
noremap ZQ <Nop>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-D> <Del>

" Setup NeoBundle
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
NeoBundle 'kakkyz81/evervim'
call neobundle#end()

filetype plugin indent on

" Unite.vim
let g:unite_enable_start_insert=1

noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>

noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" vim-fugitive
set statusline+=%{fugitive#statusline()}

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 4
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=100
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_guide_size = 1

" Change status-line-color while insert mode
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
  	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
		exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction
