"==========================
"  Vundle github snippent
"==========================

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'ryanoasis/vim-devicons'

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
colorscheme solarized

let g:ctrlp_map ='<c-p>'
map <C-n> :NERDTreeToggle<CR>
