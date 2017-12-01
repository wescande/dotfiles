
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim

" call vundle#begin()
call plug#begin('~/.vim/plugged')

" syntax helper
Plug 'vim-syntastic/syntastic'
" quick (un)comment
Plug 'tpope/vim-commentary'
" more text object to use
Plug 'wellle/targets.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'

Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'pbondoer/vim-42header'
Plug 'myusuf3/numbers.vim'

Plug 'scrooloose/nerdtree'
" Completion
Plug 'maralla/completor.vim'
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'


" Plugin 'gmarik/Vundle.vim'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'vim-syntastic/syntastic'

" Plugin 'chriskempson/base16-vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" Plugin 'edkolev/tmuxline.vim'
" Plugin 'myusuf3/numbers.vim'
" Plugin 'scrooloose/nerdtree'
" Plugin 'valloric/youcompleteme'
" Plugin 'pbondoer/vim-42header'

call plug#end()
" call vundle#end()

filetype plugin indent on

let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

" let g:ctrlp_custom_ignore = '\.[oda]$'
" let g:ctrlp_map = '<C-f>'
" let g:ctrlp_cmd = 'CtrlP'

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

" let g:ycm_confirm_extra_conf = 0


" Completion with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Fzf settings
nmap ; :Buffers<CR>
nmap <C-f> :Files<CR>
nmap <C-t> :Tags<CR>

nmap <f2> <esc>:Stdheader<CR> 

let g:fzf_layout = { 'down': '~20%' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
