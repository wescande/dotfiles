let mapleader = " "

nnoremap <leader>h       :wincmd h<CR>
nnoremap <leader>j       :wincmd j<CR>
nnoremap <leader>k       :wincmd k<CR>
nnoremap <leader>l       :wincmd l<CR>
nnoremap <leader><left>  :wincmd h<CR>
nnoremap <leader><down>  :wincmd j<CR>
nnoremap <leader><up>    :wincmd k<CR>
nnoremap <leader><right> :wincmd l<CR>
nnoremap <leader><space> :let @/ = ""<cr>:AirlineRefresh<cr>

" Centre le curseur lors de la recherche
nnoremap n nzz
nnoremap N Nzz

" Ne saute pas la ligne quand wrap
nnoremap j      gj
nnoremap k      gk
nnoremap <down> gj
nnoremap <up>   gk

inoremap jk <esc>

noremap <S-Tab> :tabprevious<CR>
noremap <Tab>   :tabnext<CR>
noremap <C-u>   <C-r>
inoremap <C-u>  <Esc><C-r>i

noremap + :vertical resize +1<CR>
noremap - :vertical resize -1<CR>
