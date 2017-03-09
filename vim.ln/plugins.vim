
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'

Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'myusuf3/numbers.vim'

call vundle#end()

filetype plugin indent on

let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

let g:ctrlp_custom_ignore = '\.[oda]$'
let g:ctrlp_map = '<C-f>'
let g:ctrlp_cmd = 'CtrlP'

set laststatus=2
set noshowmode

let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall -Werror -Wextra'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_include_dirs = ['../../../includes', '../../includes','../includes','./includes', '../../../include', '../../include', '../include', './include', './libft/includes', '../libft/includes', '../../libft/includes']
