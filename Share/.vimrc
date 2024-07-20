
" set showmode              " set shell=/bin/bash
" set expandtab             " set hlsearch
" set wildmenu              " set incsearch
" set scrolloff=3           " set ignorecase
" set list                  " set smartcase
" set wrap                  " set softtabstop=2
" set showtabline=1         " set shiftwidth=2
" set termwinsize=10*0
"set et textwidth=80 filetype=vim foldmethod=marker foldmarker={{{,}}}:

set softtabstop=2
set shiftwidth=2

set ignorecase
set number
set numberwidth=1
set mouse=r
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
syntax on "enable
set tabstop=2
set autoindent
set laststatus=2
set bg=dark
set listchars=tab:>☣,trail:☣  "listchars = ['•‣','☣','☢','☠','…','⁂','❃','✮','❀','✿','✲','❈','❉','❁']
colorscheme slate "gruvbox

" ============== PLUGINS FOR VIM ==============
" ### MORE PLUGS FOR INSTALL ###
" Plug 'alvan/vim-closetag'       "completa etiquetas de html
" Plug 'tpope/vim-surround'       "envuelve una variable con algun signo
" Plug 'junegunn/fzf'             "buacar archivos de textos dentro de archivos
" Plug 'mhinz/vim-signify'        "agrega un signo de + o - cuando agregems una linea
" Plug 'scrooloose/nerdcommenter' "para convertir una li    nea en comentario
" =============================================
" ############### PLUGINSTALL #################
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'          " SINTAXS RESALT FOR LENGUAGES PYTHON
Plug 'maximbaz/lightline-ale'        " STATUS BAR
Plug 'itchyny/lightline.vim'         " COMPLETHEME OF STATUS BAR
Plug 'jiangmiao/auto-pairs'          " COMPLETE AN [] () '' {}
Plug 'benmills/vimux'                " SEND INSTRUCTIONS AN OTHERS PANELS
"autocomplete
Plug 'sirver/ultisnips'              " CURSOR INSIDE OF THE SIGNES ()
" ####### TEST ########
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'
Plug 'editorconfig/editorconfig-vim' " DO TWO TAB SPACE
Plug 'junegunn/fzf'                  " FIND SEARCH FILES OF TEXT INSIDE OF DIRECTORY
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'  " MULTIPLE CURSOR
Plug 'yggdroot/indentline'           " INDENT LINE OF CODIGO
Plug 'glepnir/oceanic-material'
" ######## THEME #######
Plug 'morhetz/gruvbox'               " THEME
Plug 'shinchu/lightline-gruvbox.vim' " COMPLETHEME
" ======== IDE ========
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'           " LEADER SPACE nt = ONE WINDOW
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-one'
Plug 'vim-python/python-syntax'
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'

call plug#end()
"
"
"
let NERDTreeQuitOnOpen=1
let g:gruvbox_contrast_dark = "hard"
let mapleader=" "

" ================ Cursor Position ======================
nnoremap <Leader><TAB> :<C-U>TmuxNavigatePrevious<CR>
"nnoremap <Leader>c :call multiple_cursors#select_all("n", 0)<CR>
map <Leader>c :<C-U>call multiple_cursors#new('v', 1)<CR>
" ================ SIZE VIM ======================
nnoremap <Leader><RIGHT> 10<C-w>>
nnoremap <Leader><LEFT> 10<C-w><
" =============== SAVE / EXIT ====================
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <C-d> :q!<CR>
"9
nmap <Leader>m :call fzf#vim#maps('n', 0)<CR>
nmap <Leader>s :call EasyMotion#T(-1,0,0)<CR>
map <Leader>b :Buffers<CR>
" ================ RUN FILE =====================
nnoremap <Leader>x :!node %<cr>
" ======= AUTOCOMPLETIONS FOR PYTHON ============
if &filetype =="python"
  inoremap <c-space> <C-x><C-u>
else
  inoremap <silent><expr> <c-space> coc#refresh()
endif

let python_higthlight_all = 1
" ============= OPEN NERDTREE ===================
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>n :NERDTreeToggle<CR>
" ============= OPEN TERMINAL ===================
nnoremap <Leader>t :belowright terminal<CR>
" ================= INDENTATE ===================
let g:indentLine_char = '┋'    " char_list = ['|', '¦', '┆', '┊', '▏','┋','┃','╏','⁑','⁞','']
"
" ============ SETTINGS PLUG VIM-COC ============
set updatetime=100
set pumheight=20
nmap <Leader>l <Plug>(coc-definition)
nmap <Leader>j <Plug>(coc-references)
nmap <Leader>k <Plug>(coc-implementation)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'
