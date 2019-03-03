call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
imap jj <Esc>
nmap <Space> i

set t_Co=256
set background=light
colorscheme PaperColor

" Use F6 and F7 to split/vsplit the current file
nmap <F6> :split .<CR>
nmap <F7> :vsplit .<CR>

" Use F4 and F5 to switch between vim tabs
noremap <F4> gT 
noremap <F5> gt 

" Switch between splits is now ctrl+j...etc
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
