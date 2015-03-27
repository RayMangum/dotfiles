" Much of this file is based on the sample .vimrc files at
" http://www.derekwyatt.org/vim/the-vimrc-file/

" --BEGIN-- REQUIRED FOR VUNDLE
" From: https://github.com/gmarik/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/vim-easy-align'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thoughtbot/vim-rspec'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
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
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" --END-- REQUIRED FOR VUNDLE

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

" Tabstops are 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
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

" ruby minitest
" from https://github.com/sunaku/vim-ruby-minitest
set completefunc=syntaxcomplete#Complete

" when using ctrl-y from ctrlp to open a new file, reuse the current window
let g:ctrlp_open_new_file = 'r'

" Automatically read a file that has changed on disk
set autoread

" Automatically wrap git commit message lines greater than 72 characters
" https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Line numbering
set number
set numberwidth=5
