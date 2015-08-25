set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Check for syntax problems
Plugin 'scrooloose/syntastic'

" line up blocks of text
Plugin 'Tabular'

" json highlighting
Plugin 'elzr/vim-json'

" ruby highlighting
Plugin 'vim-ruby/vim-ruby'

" tab complete
Plugin 'SuperTab'

" see where you are jumping to
Plugin 'EasyMotion'

Plugin 'flazz/vim-colorschemes'

Plugin 'The-NERD-Tree'

Plugin 'ctrlp.vim'

Plugin 'tabman.vim'

Plugin 'bling/vim-airline'

Plugin 'airblade/vim-gitgutter'



" All of your plugins must be added before the following line
call vundle#end()    " required
filetype plugin indent on    " required
filetype plugin on

set history=50
set incsearch                           " Start searching as soon as you type
syntax on                               " Turn on syntax color
" colorscheme Tomorrow-Night-Eighties     " Monokai colorscheme
" colorscheme ingretu 
colorscheme elflord
set hlsearch                            " Highlight the word you are searching
set mouse=a                             " Enable the use of the mouse in all modes
set visualbell                          " Flash the screen instead of making a sound
set number                              " Show line numbers
set tabstop=4 shiftwidth=4 expandtab    " All tabs are spaces
" set autoindent                          " Keeps the indent when you hit return
set laststatus=2                        " Show airline all the time
let mapleader = ","                     " Change leader key to ,
set backspace=indent,eol,start          " Make sure backspace goes over lines
set encoding=utf-8
set clipboard=unnamedplus

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


" Remapping Arrow keys so I stop using them for so much movement
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>







" Leader Key Mappings
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%



" Function to set ESC+T to open NERDTree
function OpenNERDTree()
    execute ":NERDTree"
endfunction
command -nargs=0 OpenNERDTree :call OpenNERDTree()
nmap <ESC>p :OpenNERDTree<CR>

" Function to set ESC+0 to close NERDTree
function CloseNERDTree()
    execute ":NERDTreeClose"
endfunction
command -nargs=0 CloseNERDTree :call CloseNERDTree()
nmap <ESC>0 :CloseNERDTree<CR>





