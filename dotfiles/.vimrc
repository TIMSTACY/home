set nocompatible
filetype off
" set ttyfast
" set lazyredraw


""""""""""""""""""""""""""""""""""""""""""
"         Vundle start plugins
""""""""""""""""""""""""""""""""""""""""""
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

" tab complete
Plugin 'SuperTab'

" see where you are jumping to
Plugin 'EasyMotion'

" Every color scheme eva
Plugin 'flazz/vim-colorschemes'

" File viewer
" Plugin 'scrooloose/nerdtree'

" Buffer Explorer
Plugin 'jlanzarotta/bufexplorer'

" json highlighting
Plugin 'elzr/vim-json'

" ruby highlighting
Plugin 'vim-ruby/vim-ruby'

" line up blocks of text
Plugin 'godlygeek/tabular'

" Super Searching
Plugin 'ctrlp.vim'

Plugin 'tabman.vim'

Plugin 'bling/vim-airline'

" Plugin 'airblade-vim-gitgutter'

Plugin 'chriskempson/base16-vim'



" All of your plugins must be added before the following line
call vundle#end()    " required
filetype plugin indent on    " required
filetype plugin on

" Turn off indenting for specific filetypes
autocmd FileType erb setlocal indentexpr=

set history=50
set incsearch                           " Start searching as soon as you type
syntax on                               " Turn on syntax color
set hlsearch                            " Highlight the word you are searching
set mouse=a                             " Enable the use of the mouse in all modes
set visualbell                          " Flash the screen instead of making a sound
" set number                              " Show line numbers
set tabstop=4 shiftwidth=4 expandtab    " All tabs are spaces
" set autoindent                          " Keeps the indent when you hit return
set laststatus=2                        " Show airline all the time
let mapleader = ","                     " Change leader key to ,
set backspace=indent,eol,start          " Make sure backspace goes over lines
set encoding=utf-8
set clipboard=unnamed                  " Allow copy between terminals
set pastetoggle=<F2>
set listchars=tab:>\ ,trail:*,extends:#,nbsp:.  " Highlight problematic whitespaces
" set nocursorline

" ----------------- Ctrl-P Config/AG Search -------------------
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'


" ----------------- Arrow Key Remapping -------------------
" ----------------- Forces me to not use -------------------
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

" ----------- I use Ctrl-o for TMUX, and I always hit o -----
" ------ in VIM and it shortcuts to the blank line.  I ------
" ------ want to turn it off in VIM as a shortcut. ----------
nmap o <NOP>

" ----------------- Leader Key Remapping -------------------
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


" ----------------- UI CHANGES -------------------
" colorscheme Tomorrow-Night-Eighties     " Sets the colorscheme
" colorscheme ingretu 
" colorscheme elflord 
if filereadable(expand("~/.vimrc_background"))
    " let base16colorspace=256
    source ~/.vimrc_background
endif

" set t_Co=256                            " Turns on xterm colors so you set the color of the cursor line
" set cursorline                         " Highlight the line the cursor is on
" hi CursorLine cterm=NONE ctermbg=235    " Cursor line specifics


" ---------------- Airline Config -----------------
let g:airline_theme="badwolf"
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_section_b='%{getcwd()}'
let g:airline_section_c='%t'
let g:airline_section_y=0


" ---------------- Syntastic Config -----------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1
let g:syntastic_quiet_messages = { "level": "warnings" }

augroup filetype
  autocmd! BufRead,BufNewFile *.py.erb set filetype=python
augroup END

" --------------- Remove trailing whitespace -------------
:autocmd BufWritePre *.py %s/\s\+$//e
:autocmd BufWritePre *.rb %s/\s\+$//e


" if filereadable("/opt/chef/embedded/bin/ruby")
"     let g:syntastic_ruby_exec="/opt/chef/embedded/bin/ruby"
" endif


" ---------------- NerdTree Config -----------------
" " NerdTree {
"     if isdirectory(expand("~/.vim/bundle/nerdtree"))
"         map <C-e> <plug>NERDTreeTabsToggle<CR>
"         map <leader>e :NERDTreeFind<CR>
"         nmap <leader>nt :NERDTreeFind<CR>
" 
"         let NERDTreeShowBookmarks=1
"         let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
"         let NERDTreeChDirMode=0
"         let NERDTreeQuitOnOpen=1
"         let NERDTreeMouseMode=2
"         let NERDTreeShowHidden=1
"         let NERDTreeKeepTreeInNewTab=1
"         let g:nerdtree_tabs_open_on_gui_startup=0
"     endif
"     " }

" Automatically Open NERDTree by default
" autocmd VimEnter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree remapping of Ctrl-n to toggle NERDTree on/off
" map <silent> <C-n> :NERDTreeToggle<CR>
" map <silent> <C-n> :NERDTreeFocus<CR>

" Auto Close NERDTree if its the only window open when closing VIM
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" ---------------- Tabularize Config -----------------
" Tabularize {
    if isdirectory(expand("~/.vim/bundle/tabular"))
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a,, :Tabularize /,\zs<CR>
        vmap <Leader>a,, :Tabularize /,\zs<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    endif
"}


" ---------------- XTerm Stuff -----------------
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction



