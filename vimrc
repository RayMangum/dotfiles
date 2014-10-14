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

" Set 256 color mode in the hopes that it allows Powerline to show the right
" colors in Vim outside of tmux (where it works)

set t_Co=256
" Set colorscheme to Solarized
" From http://ethanschoonover.com/solarized/vim-colors-solarized
" syntax enable " Commented out because already included with Pathogen stuff

" http://www.drbunsen.org/the-text-triumvirate/
let g:solarized_termtrans=1 
let g:solarized_termcolors=16
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

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2

" Search highlighting
set hlsearch
" Get rid of highlighting for last search
" From http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" http://www.moolenaar.net/habits.html
set incsearch

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

"From https://powerline.readthedocs.org/en/latest/tipstricks.html
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" https://github.com/junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Set Pastetoggle to <F2>
set pastetoggle=<F2>

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

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

" Snippets
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" matchit - added for https://github.com/nelstrom/vim-textobj-rubyblock
runtime macros/matchit.vim
