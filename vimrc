" Much of this file is based on the sample .vimrc files at
" http://www.derekwyatt.org/vim/the-vimrc-file/

" Enable Pathogen
call pathogen#infect()

" Don't try to be compatible with vi
set nocompatible

" Turn on file type handling
filetype on
filetype plugin on
filetype indent on

" Turn on that syntax highlighting
syntax on

" Set colorscheme to Solarized
" From http://ethanschoonover.com/solarized/vim-colors-solarized
" syntax enable " Commented out because already included with Pathogen stuff

" http://www.drbunsen.org/the-text-triumvirate/
let g:solarized_termtrans = 1 
set background=dark
colorscheme solarized

" By setting ‘hidden’ you’re telling vim that it’s ok to have an unwritten
" buffer that’s no longer visible
set hidden

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Don't update the display while executing macros
set lazyredraw

" Display the current mode
set showmode

" set visual bell -- i.e., do not beep
set vb

" See :help 'cpoptions' for these ones.  'cpoptions' has a huge
" set of possible options
set cpoptions+=$

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" The GUI (i.e. the 'g' in 'gvim') is fantastic, but let's not be
" silly about it :)  The GUI is fantastic, but it's fantastic for
" its fonts and its colours, not for its toolbar and its menus -
" those just steal screen real estate
set guioptions=ac
if has('gui_running')
  set guifont=Ubuntu\ Mono:h21
endif

" Tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Search highlighting
set hlsearch
" Get rid of highlighting for last search
" From http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Insert the time; from http://vim.wikia.com/wiki/Insert_current_date_or_time
" Works in both normal and insert mode

:nnoremap <F5> "=strftime("%c")<CR>P
:inoremap <F5> <C-R>=strftime("%c")<CR>

" Q. How can I map a specific key or shortcut to open NERDTree?
"
" A. Stick this in your vimrc to open NERDTree with Ctrl+n (you can set
" whatever key you want): map <C-n> :NERDTreeToggle<CR>
" https://github.com/scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>

"From https://powerline.readthedocs.org/en/latest/overview.html#installation
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" http://www.drbunsen.org/writing-in-vim/
func! WordProcessorMode() 
    setlocal formatoptions=1 
    setlocal noexpandtab 
    map j gj 
    map k gk
    setlocal spell spelllang=en_us 
    set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
    set complete+=s
    set formatprg=par
    setlocal wrap 
    setlocal linebreak 
endfu 
com! WP call WordProcessorMode()
