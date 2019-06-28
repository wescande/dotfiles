filetype off

call plug#begin('~/.vim/plugged')

	" syntax helper
	Plug 'w0rp/ale'
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

	Plug 'pbondoer/vim-42header'
	Plug 'myusuf3/numbers.vim'

	Plug 'scrooloose/nerdtree'
	" Completion
	Plug 'maralla/completor.vim'

	Plug 'rust-lang/rust.vim'

call plug#end()

filetype plugin indent on

let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

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

let g:ale_c_gcc_options = '-pedantic -Wall -Werror -Wextra -I. -I.. -I../.. -I../../.. -Iincludes -I../includes -I../../includes -I../../../includes -Iinclude -I../include -I../../include -I../../../include -Ilibft/includes -I../libft/includes -I../../libft/includes -I../../../libft/includes -Ilibft/include -I../libft/include -I../../libft/include -I../../../libft/include'
let g:ale_c_clang_options = g:ale_c_gcc_options
let g:ale_cpp_gcc_options = g:ale_c_gcc_options
let g:ale_cpp_clang_options = g:ale_c_gcc_options

" Completion with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

let g:rustfmt_autosave = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" fzf to use ripgrep
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
