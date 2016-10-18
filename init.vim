set nocompatible "be improved, required
filetype off " required

" windows setting
set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/unite.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'
call vundle#end()

filetype plugin indent on

"setting goes here
if has("gui_running")
    set guifont=Source_Code_Pro:h14:cANSI:qDRAFT
    set guioptions-=m
    set guioptions-=T
endif

set termguicolors
set t_Co=256
set background=dark
colo onedark

syntax on
syntax enable
"set relativenumber
set number


set noswapfile
set title

"search settings
set incsearch
set ignorecase
set showmatch
set smartcase

" tab settings
set expandtab
set smarttab
set autoindent
set copyindent
set shiftround
set tabstop=4 shiftwidth=4 softtabstop=4
set foldmethod=indent
set smartindent
set foldlevel=99

"system related settings
set mouse=a
set spell
set cursorline
set history=1000
set clipboard=unnamed     
set backspace=indent,eol,start              " Make backspace behave normally.
set autowriteall
"set visualbell
set modifiable
" wildmenu settings
set wildmode=list:longest,full
set wildmenu

set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words
set encoding=utf-8

" undo settings
set undodir=~/.vim/undodir
set undofile
set undolevels=1000                         "maximum number of changes that can be undone
set undoreload=10000                        "maximum number lines to save

let mapleader=" "


" airline configuration
set laststatus=2

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" key-mappings
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

nnoremap <leader>t<TAB> :<C-u>IndentGuidesToggle<cr>

" key-mappings for fzf
nnoremap <leader>ff :<C-u>Files
nnoremap <leader>fg :<C-u>GFiles<cr>

" key-mappings for unite
nnoremap <leader>b :<c-u>Unite -no-split -buffer-name=buffer buffer<cr>

let g:python_host_prog = '/home/julian/.pyenv/versions/neovim2/bin/python'

"use deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = []

