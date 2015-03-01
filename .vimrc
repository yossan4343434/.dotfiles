syntax enable
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set incsearch
set hlsearch
set nowrap
set showmatch
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set tabstop=4
set shiftwidth=2
set helplang=en
colorscheme desert

noremap <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
noremap k gk
noremap j gj
noremap gk k
noremap gj j
noremap L $
noremap H ^
noremap <C-h> X
noremap <Space>o o<Esc>
noremap ZZ <Nop>
noremap ZQ <Nop>

inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

