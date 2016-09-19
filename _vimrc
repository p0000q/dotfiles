set nocompatible "be improved, required
filetype off " required

" windows setting
set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/vimproc.vim'
Plugin 'tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/AutoFenc'
Plugin 'Rip-Rip/clang_complete'
call vundle#end()

filetype plugin indent on

"setting goes here
if has("gui_running")
    set guifont=Source_Code_Pro:h14:cANSI:qDRAFT
    set guioptions-=m
    set guioptions-=T
endif
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
set t_Co=256
set encoding=utf-8

" undo settings
set undodir=~/.vim/undodir
set undofile
set undolevels=1000                         "maximum number of changes that can be undone
set undoreload=10000                        "maximum number lines to save

let mapleader=" "


" airline configuration
set laststatus=2

"neocomplete configuration
let g:neocomplete#enable_at_startup = 1 "use neocomplete
let g:neocomplete#enable_smart_case = 1 " use smartcase
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.c =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
        \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.objcpp =
        \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
"let g:clang_use_library = 1
"
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

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


" unite key-mappings
nnoremap [unite] <Nop>
nmap <leader>u [unite]
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir
            \ -buffer-name=files buffer bookmark file<CR>

nnoremap <silent> [unite]f :<C-u>Unite file_rec<cr>

nnoremap <silent> [unite]b :<C-u>Unite buffer<cr>

nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<cr>

nnoremap <silent> [unite]p :<C-u>Unite file_rec/git<cr>
if executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_encoding = 'utf-8'
endif
