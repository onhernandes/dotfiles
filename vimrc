set clipboard=unnamed

function! ClipboardYank()
  call system('pbcopy', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('pbpaste')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

set tabstop=2
set softtabstop=0
set shiftwidth=2

set number
set numberwidth=5
set smartindent

set virtualedit=all

nnoremap ; :

let mapleader=" "

nmap <leader>so :so ~/.vimrc<cr> 
nmap <leader>rr :edit ~/.onhernandes/dotfiles/vimrc<cr>

noremap <Up> ""
 noremap! <Up> <Esc>
 noremap <Down> ""
 noremap! <Down> <Esc>
 noremap <Left> ""
 noremap! <Left> <Esc>
 noremap <Right> ""             
