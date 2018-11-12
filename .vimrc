set nocompatible

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')
    call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('dannyob/quickfixstatus')
    call dein#add('jceb/vim-hier')
    call dein#add('kannokanno/previm')
    call dein#add('osyo-manga/vim-watchdogs')
    call dein#add('Shougo/neocomplete')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#add('thinca/vim-quickrun')
    call dein#add('thinca/vim-ref')
    call dein#add('tpope/vim-endwise')
    call dein#add('tikhomirov/vim-glsl')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

filetype plugin indent on
syntax enable

colorscheme molokai
set number
set laststatus=2
set display=lastline
set cursorline
set wildmenu
set wildmode=list:full
set showcmd

if has('gui_running')
    set lines=40
    set columns=130
    set guifont=Dejavu\ Sans\ Mono\ 11
    set guioptions=aegimrLt
end

set encoding=utf-8

set expandtab
set tabstop=4
set smarttab
set shiftwidth=4
set autoindent
set smartindent
set incsearch
set ignorecase
set smartcase
set hlsearch

set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start

call system('mkdir -p ~/.vim/backup')
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set browsedir=buffer

set history=1000

set autoread
set hidden

set novisualbell

set list
set listchars=tab:>>,trail:#

nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap :tn :tabnew<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

augroup DisableIMEWhenInsertLeave
    autocmd!
    autocmd InsertLeave * call system('fcitx-remote -c')
augroup END

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead README,*.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
let g:previm_open_cmd = 'chromium-browser'

let g:quickrun_config = {
\   '_': {'tempfile': '%{expand("%:p:h") . "/" . system("echo -n $(uuidgen)")}'}
\}

