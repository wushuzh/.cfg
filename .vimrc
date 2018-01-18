"==========================
"  Vundle github snippent
"==========================

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-unimpaired'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-surround'
Plugin 'raimondi/delimitmate'
Plugin 'majutsushi/tagbar'
Plugin 'valloric/youcompleteme'

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
" see :h vundle for more details or wiki for FAQ

set updatetime=250           " after typing, wait 250ms and let plugin govner

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" edit vimrc file with ,v
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

"============================
" speical chars section
"============================
set encoding=utf8
set list
nmap <leader>l :set list!<CR>   " toggle set list
set listchars=tab:▸\ ,eol:¬     " set tab eol appearance symbol

"============================
" appearance
"============================
set guicursor=
set cursorline
set cursorcolumn
set number relativenumber       " show hybrid line numbers
augroup numbertoggle            " show abs line number when focus/insert
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set guioptions=a              " hide scrollbars/menu/tabs

" enable colorschema
syntax enable
if has('gui_running')
  set background=light
  set lines=999 columns=999                 " set gvim windows max
  set guifont=DroidSansMono\ Nerd\ Font\ 11 " set nerd font for vim-devicons
  set guifontwide=Source\ Han\ Sans\ 12     " set Chinese font
else
  set background=dark
endif
let g:solarized_visibility = "low"          " make tab eol less visible
let g:solarized_termcolors = 256            " no gray background any more
colorscheme solarized

let g:ctrlp_map ='<c-p>'
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1                 " close nerdtree after open sth

nmap <F8> :TagbarToggle<CR>

" Javascript
autocmd Filetype javascript set sw=2 ts=2 expandtab
" make JSX syntax highlight also for file.js
let g:jsx_ext_required = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

if has('nvim')
  " Esc or Ctrl+[ to exit terminal mode
  " Alt+[ to send Esc to underline app
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <Esc>
  " Quickly create a new terminal in a new tab
  tnoremap <leader>c <C-\><C-n>:tab new<CR>:term<CR>
  noremap <leader>c :tab new<CR>:term<CR>
  inoremap <leader>c <Esc>:tab new<CR>:term<CR>
  " Quickly create a new terminal in a vertical split
  noremap <leader>% :vsp<CR><C-w><C-w>:term<CR>
  inoremap <leader>% <Esc>:vsp<CR><C-w><C-w>:term<CR>
  " Quickly create a new terminal in a horizontal split
  noremap <leader>" :sp<CR><C-w><C-w>:term<CR>
  inoremap <leader>" <Esc>:sp<CR><C-w><C-w>:term<CR>
  " Switching between split windows:
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif
