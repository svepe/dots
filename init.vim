set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins

syntax on
colorscheme monokai

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

let g:promptline_preset = {
	\'a' : [],
	\'b' : [ '\u', '\h[$(echo $ROS_MASTER_URI | cut -d: -f2 | cut -c 3-)]', promptline#slices#vcs_branch() ],
	\'c' : [ '\w' ],
	\'x' : [ '\$' ],
	\'y' : [],
	\'z' : []}

let g:tmuxline_preset = {
      \'a'    : [ '#S' ],
      \'b'    : [ '#F' ],
      \'c'    : [ '#W' ],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'x'    : ['#{prefix_highlight}'],
      \'z'    : ['#(/home/svetlin/.tmux/plugins/tmux-continuum/scripts/continuum_save.sh)','#H']}
