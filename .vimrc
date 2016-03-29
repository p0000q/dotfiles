call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Yggdroot/LeaderF'
Plug 'tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'lervag/vimtex'
call plug#end()


"setting goes here
syntax on
syntax enable
set relativenumber
set number

filetype plugin on
filetype indent on 

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

" undo settings
set undodir=~/.vim/undodir
set undofile
set undolevels=1000                         "maximum number of changes that can be undone
set undoreload=10000                        "maximum number lines to save

"color scheme
"colorscheme onedark
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

let mapleader=","

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

 "Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neocomplete#force_overwrite_completefunc = 1

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
"imap <C-i>     <Plug>(neosnippet_expand_or_jump)
"smap <C-i>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-i>     <Plug>(neosnippet_expand_target)
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

"if has('conceal')
  "set conceallevel=2 concealcursor=i
"endif

"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" airline configuration
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme= 'dark'
let g:airline#extensions#branch#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#branch#empty_message = 'No branch'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled= 1
let g:airline#extensions#unite#enable= 1
let g:airline#extensions#hunks#enable= 1
let g:airline#extensions#tagbar#enable= 1


let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

