" Set beginning options
set nocompatible
set rtp +=~/.vim/bundle/Vundle.vim
filetype indent plugin on
syntax on

"----------------Custom behavior / Configs ------------------------------
"Maps jj to 'Esc'
    inoremap jj <Esc>
"Shows line numbers
    set number
"Show gutter
    set signcolumn="yes"
"Set space to leader
    nnoremap <SPACE> <Nop>
    let mapleader=" "
"------------------------------------------------------------------------

"----------------Indentation Rules---------------------------------------
"Default :
    "Width of tab is set to 4
        set tabstop=4
    "Indents have width of 4
        set shiftwidth=4
    "Sets number of columns for a tab
        set softtabstop=4
    "Expands tabs to spaces
        set expandtab
"------------------------------------------------------------------------

"----------------Plugin Install------------------------------------------
"Open vundle
    call vundle#begin() 
"Required for vundle
    Plugin 'VundleVim/Vundle.vim'
"My Plugins
    "File explorer
        Plugin 'scrooloose/nerdtree'
"Close vundle
    call vundle#end()
"------------------------------------------------------------------------

"----------------Plugin Behavior-----------------------------------------
"NerdTree
    "Toggle NerdTree with Space-n
        nmap <leader>n :NERDTreeToggle<cr>
"------------------------------------------------------------------------
