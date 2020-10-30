"==========<VUNDLE>===============================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'PotatoesMaster/i3-vim-syntax'
Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'morhetz/gruvbox'
"Plugin 'ycm-core/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

let g:rainbow_active = 1

"==========<FUNCTIONS>============================
function! ToggleWhiteCharacters()
   if (&list)
    :set nolist
    echo "list off"
  else
    :set list
    echo "list on"
  endif
endfunction

"==========<VIM CORE>=============================

set background=dark
let g:gruvbox_contrast_dark = 'high'
colorscheme gruvbox
syntax enable
set incsearch
set colorcolumn=0
set laststatus=2
set path=.
set tags=./tags;/
set ic
set autoindent
set listchars=tab:~\ `,trail:^
set list
set number relativenumber
set wrap
set splitbelow
set splitright
set wildmenu
set hlsearch

set tabstop=4 shiftwidth=4
"2 spaces indent
" set expandtab shiftwidth=2 softtabstop=2

if has("gui_running")
  set go-=T
  set go-=r
  set go-=m
  set guifont=JetBrains\ Mono\ NL\ 12
  set lines=999 columns=999
endif

inoremap jk <Esc>
inoremap {{ {}<Left><CR><CR><Up><Tab>
inoremap <C-v> <C-r>+

nnoremap <Space> :w<CR>
nnoremap Q :NERDTreeToggle<CR>
nnoremap S :call ToggleWhiteCharacters()<CR>
nnoremap <C-w>- :sp<CR>
nnoremap <C-w>/ :vs<CR>
nnoremap <C-w>_ :ter<CR>
nnoremap <C-w>? :vert ter<CR>
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>
nnoremap <Down> <C-w>-
nnoremap <Up> <C-w>+
nnoremap ZQ :q!<CR>
nnoremap ZZ :wq<CR>

vnoremap <C-c> "+y

autocmd VimEnter * set textwidth=0
autocmd VimEnter * highlight MatchParen cterm=none ctermbg=magenta ctermfg=white
autocmd BufWritePost .Xresources call system("xrdb ~/.Xresources")
autocmd BufWritePost .xbindkeysrc call system("pkill xbindkeys; xbindkeys")
autocmd BufWritePost picom.conf call system("systemctl --user restart compton")

"==========<PYTHON FILES>=========================
" autocmd BufRead *.py let python_highlight_all = 1
" autocmd BufRead *.py set colorcolumn=110

"==========<C/C++ FILES>==========================
" autocmd BufRead *.c set colorcolumn=110
" autocmd BufRead *.h set colorcolumn=110
" autocmd BufRead *.cpp set colorcolumn=110
" autocmd BufRead *.hpp set colorcolumn=110
