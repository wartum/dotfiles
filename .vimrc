"  _______________________________________
" < I'm just Vundle config, don't mind me >
"  ---------------------------------------
"         \   ^__^
"          \  (oo)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
"Plugin 'ycm-core/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

" ____________________________
"< Let's have some functions! >
" ----------------------------
"        \   ^__^
"         \  (oo)\_______
"            (__)\       )\/\
"                ||----w |
"                ||     ||
"
function! ToggleWhiteCharacters()
   if (&list)
    :set nolist
    echo "list off"
  else
    :set list
    echo "list on"
  endif
endfunction
"
"  ___________________________________
" / Much power you wield once vim you \
" \ master                            /
"  -----------------------------------
"         \   ^__^
"          \  (@@)\_______
"             (__)\       )\/\
"                 ||----w |
"                 ||     ||
"
colorscheme elflord
syntax enable
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
set expandtab shiftwidth=2 softtabstop=2


" standard insert key bindings "
inoremap jj <Esc>
inoremap {{ {}<Left><CR><CR><Up><Tab>

" standard normal key bindings "
nnoremap <Space> :w<CR>
nnoremap <C-j> :tabp<CR>
nnoremap <C-k> :tabn<CR>
nnoremap Q :NERDTreeToggle<CR>
nnoremap S :call ToggleWhiteCharacters()<CR>
nnoremap <C-w>- :sp<CR>
nnoremap <C-w>/ :vs<CR>
nnoremap <C-w>_ :ter<CR>
nnoremap <C-w>? :vert ter<CR>
nnoremap ZQ :q!<CR>
nnoremap ZZ :wq<CR>

" autocommands "
autocmd BufWritePost .Xresources call system("xrdb ~/.Xresources")
autocmd BufWritePost .xbindkeysrc call system("pkill xbindkeys; xbindkeys")
