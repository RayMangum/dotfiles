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
Plugin 'gabebw/vim-spec-runner'
Plugin 'christoomey/vim-tmux-runner'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line
" --END-- REQUIRED FOR VUNDLE

" BASICS
" ---------------------------------------------------------------------- 

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on


set hidden
set wildmenu
set lazyredraw
set showmode
set vb
set cpoptions+=$
set laststatus=2

set autoread

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set incsearch
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set splitright
set splitbelow

set textwidth=80
set colorcolumn=+1

set relativenumber
set numberwidth=5

:nnoremap <leader>v :e ~/.vimrc<CR>

" PROGRAMMING (see also plugins)
" ---------------------------------------------------------------------- 

" Automatically wrap git commit message lines greater than 72 characters
" https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72

" APPEARANCE
" ---------------------------------------------------------------------- 

" From http://ethanschoonover.com/solarized/vim-colors-solarized
" http://www.drbunsen.org/the-text-triumvirate/
let g:solarized_termtrans=1 
let g:solarized_termcolors=16
set background=dark
colorscheme solarized

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

" GUI
set guioptions=ac
if has('gui_running')
  set guifont=Ubuntu\ Mono:h21
endif

" Plugins
" ---------------------------------------------------------------------- 

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" EasyAlign
" https://github.com/junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" vim-spec-runner
" https://github.com/gabebw/vim-spec-runner#configuration
" Using vim-tmux-runner:
let g:spec_runner_dispatcher = "VtrSendCommand! {command}"
let g:VtrPercentage = 35
let g:VtrOrientation = "h"

" https://github.com/gabebw/vim-spec-runner/issues/25
command! RunAllSpecs VtrSendCommandToRunner! rspec spec
nnoremap <leader>R :RunAllSpecs<CR>

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

" CtrlP
" when using ctrl-y from CtrlP to open a new file, reuse the current window
let g:ctrlp_open_new_file = 'r'
"https://robots.thoughtbot.com/faster-grepping-in-vim

" Use Ag for grep and integgrate with CtrlP
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" KEYBOARD SHORTCUTS
" ---------------------------------------------------------------------- 

" Set Pastetoggle to <F2>
set pastetoggle=<F2>

" FUNCTIONS
" ---------------------------------------------------------------------- 

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




