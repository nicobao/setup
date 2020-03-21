call pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on
imap jk <Esc>
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

" Use F1 to split the current tab and open a terminal at the bottom
nnoremap <F3> :wincmd b \| bel terminal<CR>

" Switch between splits is now ctrl+j...etc
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Copy vim yanked text to system clipboard as well
" Requires vim-gnome on Ubuntu/Debian or vim-X11 package on RedHat/CentOS/Fedora
" Requires using vimx instead of vim - 
" You can edit .bashrc to run vimx automatically instead of vim
set clipboard^=unnamed,unnamedplus
