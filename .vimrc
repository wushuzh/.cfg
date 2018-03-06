
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-unimpaired'
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'glench/vim-jinja2-syntax'
Plug 'mxw/vim-jsx'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'raimondi/delimitmate'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'junegunn/goyo.vim'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-sensible'

call plug#end()


set updatetime=250           " after typing, wait 250ms and let plugin govner

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
" edit vimrc file with ,v
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" no warning with hidden buffer
set hidden

"============================
" speical chars section
"============================
set encoding=utf8
set list
nmap <leader>l :set list!<CR>   " toggle set list
set listchars=tab:▸\ ,eol:¬     " set tab eol appearance symbol

" force emmet indent using space
let g:user_emmet_settings = {
\  'html' : {
\    'indentation' : '    '
\  }
\}

"============================
" appearance
"============================
set guicursor=
set cursorline
set cursorcolumn
set number relativenumber       " show hybrid line numbers
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
" let g:solarized_visibility = "low"          " make tab eol less visible
let g:solarized_termcolors = 256            " no gray background any more
colorscheme solarized

" debug with conceal setting https://vi.stackexchange.com/a/12534
let g:indentLine_fileTypeExclude = ["markdown"]

map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1                 " close nerdtree after open sth

nmap <F8> :TagbarToggle<CR>

" Javascript
autocmd Filetype javascript set sw=2 ts=2 expandtab
" make JSX syntax highlight also for file.js
let g:jsx_ext_required = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " show tab number
let g:airline#extensions#tabline#fnamemod = ':t'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
  " Switching between split windows by meta key :h meta

  " Terminal mode
  tnoremap <M-h> <C-\><C-n><C-w>h
  tnoremap <M-j> <C-\><C-n><C-w>j
  tnoremap <M-k> <C-\><C-n><C-w>k
  tnoremap <M-l> <C-\><C-n><C-w>l

  " Insert mode
  inoremap <M-h> <Esc><C-w>h
  inoremap <M-j> <Esc><C-w>j
  inoremap <M-k> <Esc><C-w>k
  inoremap <M-l> <Esc><C-w>l

  " Visual mode
  vnoremap <M-h> <Esc><C-w>h
  vnoremap <M-j> <Esc><C-w>j
  vnoremap <M-k> <Esc><C-w>k
  vnoremap <M-l> <Esc><C-w>l

  " Normal mode
  nnoremap <M-h> <C-w>h
  nnoremap <M-j> <C-w>j
  nnoremap <M-k> <C-w>k
  nnoremap <M-l> <C-w>l
endif
