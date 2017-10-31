
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
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-commentary'
Plugin 'pbondoer/vim-42header'

call vundle#end()

filetype plugin indent on

let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

let g:ctrlp_custom_ignore = '\.[oda]$'
let g:ctrlp_map = '<C-f>'
let g:ctrlp_cmd = 'CtrlP'

noremap <C-g>				:NERDTreeToggle<CR>
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction

set laststatus=2
set noshowmode

let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-Wall -Werror -Wextra'
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_c_check_header = 1
let g:syntastic_c_remove_include_errors = 0
let g:syntastic_c_include_dirs = ['../../../includes', '../../includes','../includes','./includes', '../../../include', '../../include', '../include', './include', './libft/includes', '../libft/includes', '../../libft/includes']

let g:ycm_confirm_extra_conf = 0
