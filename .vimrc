set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-dispatch'
Plugin 'jacoborus/tender'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/gitignore'
Plugin 'raimondi/delimitmate'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jszakmeister/vim-togglecursor'
Plugin 'kshenoy/vim-signature'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-sleuth'
Plugin 'valloric/youcompleteme'

" NERDTree addons
Plugin 'ryanoasis/vim-devicons'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Display
set guifont=Inconsolata\ for\ Powerline:h15
set background=dark
colorscheme tender
if has("gui_running")
  " MacVim settings
  set guifont=SauceCodePro\ Nerd\ Font:h13
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let macvim_skip_colorscheme=1
  endif
  "disable right scrollbar
  set guioptions-=r
  set guioptions-=R
  "disable left scrollbar
  set guioptions-=l
  set guioptions-=L
else
  " Terminal settings
  set t_Co=256
  set fillchars+=stl:\ ,stlnc:\
  set term=xterm-256color
  set termencoding=utf-8
endif
set encoding=utf8
set cursorline
set number
set showcmd

set tabstop=2
set shiftwidth=2
" set expandtab


let mapleader = "\<Space>"
" universal mappings
inoremap jk <esc>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :vsplit ~/vimrc/.vimrc<cr>
nnoremap <leader>pi :PluginInstall<cr>
nnoremap <leader>wv :vsplit<cr>
nnoremap <leader>wh :split<cr>
nnoremap <leader>nr :call NumberToggle()<cr>

" navigation
" jump to last buffer
nnoremap <leader><tab> <C-^>
" jump to window number
nnoremap <leader>1 :exe 1 . "wincmd w"<cr>
nnoremap <leader>2 :exe 2 . "wincmd w"<cr>
nnoremap <leader>3 :exe 3 . "wincmd w"<cr>
nnoremap <leader>4 :exe 4 . "wincmd w"<cr>
nnoremap <leader>5 :exe 5 . "wincmd w"<cr>
nnoremap <leader>6 :exe 6 . "wincmd w"<cr>
nnoremap <leader>7 :exe 7 . "wincmd w"<cr>
nnoremap <leader>8 :exe 8 . "wincmd w"<cr>
nnoremap <leader>9 :exe 9 . "wincmd w"<cr>
" directional window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gP :Gpush<cr>
nnoremap <leader>gF :Gpull<cr>


" airline
let g:airline_powerline_fonts = 1
" let g:airline_section_y = '%{winnr()}'
" enable tender airline theme
let g:tender_airline = 1
" set airline theme
let g:airline_theme = 'tender'


" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
nnoremap <leader>ft :NERDTreeToggle<cr>
nnoremap <leader>fv :NERDTreeFind<cr>


" CtrlP
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fr :CtrlPMRU<cr>
nnoremap <leader>bb :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
" from https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }
endif


" Ack
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
nnoremap <leader>/ :Ack!<Space>


" Indent Guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2


" YouCompleteMe
" let g:ycm_autoclose_preview_window_after_completion = 1
" disable Preview
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" This fixes 'User Defined Completion' error message - https://github.com/Valloric/YouCompleteMe/issues/1562
set shortmess+=c


" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Javascript
let g:syntastic_javascript_checkers = ['eslint']
" autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
let g:jsx_ext_required = 0
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1
