" Disable SQLComplete.vim hotkeys - see :h sql.txt
let g:omni_sql_no_default_maps = 1
" Make coc use global node instead of nvm's
let g:coc_node_path = '/usr/bin/node'

 " disable highlighting variables
highlight link JavaIdentifier NONE

inoremap <C-c> <Esc>
set nu
set relativenumber
let mapleader = " "
set termguicolors
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set ignorecase
set smartcase
set noswapfile
set incsearch
set scrolloff=8
set history=1000

" https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" Copy vim yanked text to system clipboard as well
" Requires vim-gnome on Ubuntu/Debian or vim-X11 package on RedHat/CentOS/Fedora
" Requires using vimx instead of vim - 
" You can edit .bashrc to run vimx automatically instead of vim
" Also work with nvim
set clipboard^=unnamed,unnamedplus

call plug#begin(stdpath('data') . '/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kevinoid/vim-jsonc'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'uiiaoo/java-syntax.vim'
call plug#end()

""""""""""""""""" coc
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ coc#refresh()
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif


" Navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g9 <Plug>(coc-diagnostic-prev)
nmap <silent> g0 <Plug>(coc-diagnostic-next)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation in preview window.
nnoremap <silent> <C-H> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Jump to floating window (documentation)
nmap <silent> <leader>j <Plug>(coc-float-jump)	

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
nmap <leader>or :OR<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

""""""""""""""""""""""""""""""""""""""""""""""

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gd :Gdiff<CR>

" Sweet gitgutter
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
" Update sign column every quarter second
set updatetime=250
" git add (chunk)
nmap <Leader>ga <Plug>(GitGutterStageHunk)  
" git undo (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   

" Coc dispatch
nmap <leader>m :Make<CR>

" Undo tree plugin
nnoremap <leader>u :UndotreeShow<CR>

" https://github.com/junegunn/fzf.vim/issues/419#issuecomment-479687537
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always ' 
  \  . (len(<q-args>) > 0 ? <q-args> : '""'), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ps :Rg<SPACE>
" Open the file tree:
nnoremap <leader>pv :NERDTree<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :e ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>w <C-w>
nnoremap <Leader>fh :History<CR> 

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark
