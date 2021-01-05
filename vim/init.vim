" Disable SQLComplete.vim hotkeys - see :h sql.txt
let g:omni_sql_no_default_maps = 1
" Make coc use global node instead of nvm's
let g:coc_node_path = '/home/nicolas/.nvm/versions/node/v14.15.3/bin/node'
let g:node_host_prog = '/home/nicolas/.nvm/versions/node/v14.15.3/bin/neovim-node-host'

" Store and restore decisions only if the answer was given in upper case (Y/N/A).
let g:localvimrc_persistent = 1

 " disable highlighting variables
highlight link JavaIdentifier NONE

" Disable polyglot autoindent, as it messes up with formatters...
" See https://github.com/neoclide/coc-prettier/issues/1#issuecomment-721696534 
let g:polyglot_disabled = ['autoindent']

" Open NERDTree automatically if no files were specified.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree automatically when started on a directory.
" Focus on NERDTree window with "wincmd h"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd h | endif

" Close vim NERDTree when it is the last window (except on startup).
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

inoremap <C-c> <Esc>
set nu
set relativenumber
let mapleader = " "
set termguicolors
set nohlsearch
set noerrorbells
set tabstop=4 softtabstop=4 " softabstop will potentially remove spaces for tabs
set shiftwidth=4 " by default, 0 means that it will be the same as tabstop
set noexpandtab smarttab
set smartindent
set wrap
set linebreak
set breakindent 
set showbreak=ͱ
set ignorecase
set smartcase
set noswapfile
set incsearch
set scrolloff=8
set history=1000
set list 
set listchars=tab:▸\ ,space:·,eol:¬

" https://vi.stackexchange.com/a/17338/27487
vmap > >gv
vmap < <gv

nnoremap <F1> :tabnew<CR> 
nnoremap <F2> :tabprevious<CR> 
nnoremap <F3> :tabnext<CR> 

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
Plug 'psliwka/vim-smoothie'
Plug 'uiiaoo/java-syntax.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kevinoid/vim-jsonc'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test' 
Plug 'ryanoasis/vim-devicons'
Plug 'embear/vim-localvimrc'
Plug 'tpope/vim-eunuch'
Plug 'whonore/Coqtail'
Plug 'lervag/vimtex'
Plug 'nicwest/vim-http'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
call plug#end()

" No automatic mapping for Coq
let g:coqtail_nomap = 1

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


" Use C-j for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <C-j>' to make sure C-j is not mapped by
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
xmap <silent>ga  <Plug>(coc-codeaction-selected)<CR>
nmap <silent>ga  <Plug>(coc-codeaction-selected)<CR>

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

nnoremap <Leader>od :CocFzfList diagnostics<CR> 
nnoremap <Leader>oo :CocFzfList<CR> 

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
" nmap <leader>gh :diffget //3<CR>
" nmap <leader>gu :diffget //2<CR>
" nmap <leader>gs :G<CR>
nmap <leader>gd :Gdiff<CR>
nmap <Leader>gb :Git blame<CR>

" Sweet gitgutter
" I don't like when plugins set mappings for me outside plugin-specific
" buffers, so I disable them:
let g:gitgutter_map_keys = 0
nmap <leader>gn <Plug>(GitGutterNextHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
" Update sign column every quarter second
set updatetime=250
" git add (chunk)
nmap <Leader>ga <Plug>(GitGutterStageHunk)  
" git undo (chunk)
nmap <Leader>gu <Plug>(GitGutterUndoHunk)   

" let g:project_wide_make_command = ""
" let g:project_wide_make_command="clean install && java -jar foo.jar"
" Make do then put custom commands 
nmap <leader>mr :Make 
" Make run project-wide command
" execute "nmap <leader>mp :Make " . g:project_wide_make_command . "<CR>"

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
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>  
nnoremap <leader>prf :CocSearch 
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :e ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
nnoremap <Leader><Right> :vertical resize +5<CR>
nnoremap <Leader><Left> :vertical resize -5<CR>
nnoremap <Leader><Up> :resize +5<CR>
nnoremap <Leader><Down> :resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader><Tab> <C-^>
nnoremap <Leader>w <C-w>
nnoremap <Leader>fh :History<CR> 

" Set font (devicons)
" https://github.com/ryanoasis/vim-devicons/wiki/Installation
let g:airline_powerline_fonts = 1
" Requires to have installed the nerd font first:
" set guifont=JetBrainsMono_Nerd_font:h14

"""""""""" NERDTree
" Check if NERDTree is open or active, mix of both, and use built-in
" NERDTree.IsOpen() function instead
" https://www.reddit.com/r/vim/comments/g47z4f/synchronizing_nerdtree_with_the_currently_opened/?utm_source=share&utm_medium=web2x&context=3
" https://github.com/unkiwii/vim-nerdtree-sync
" function! IsNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff && bufname('%') !~# 'NERD_tree'
"       try
"         NERDTreeFind
"         if bufname('%') =~# 'NERD_tree'
"           setlocal cursorline
"           wincmd p
"         endif
"       endtry
"   endif
" endfunction
" Highlight currently open buffer in NERDTree
" autocmd BufEnter * silent! call SyncTree()
" Open the file tree: https://stackoverflow.com/a/54110608
" nnoremap <silent> <expr> <leader>pv g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTreeToggle<CR>"
nnoremap <silent> <leader>pv :NERDTreeToggle<CR>
" nnoremap <silent> <expr> <leader>pv IsNERDTreeOpen() ? "\:NERDTreeClose<CR>" : ":NERDTreeToggle<cr><c-w>l:call SyncTree()<cr><c-w>h"
nnoremap <silent> <leader>ft :NERDTreeFind<CR>
"

""""""" vim-test
" Having vim-dispatch is a dependecy of vim-test, see https://github.com/vim-test/vim-test#quickfix-strategies.
" Make test commands execute using neomake:
let test#strategy = "dispatch"

nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>
"""""""

" vim-airline
" disable check for white/tab mixed-indent trailing error in vim-airline
let g:airline#extensions#whitespace#enabled = 0

" latex
let g:tex_flavor = 'latex'

" scala https://github.com/scalameta/coc-metals/issues/361
au BufRead,BufNewFile *.sbt set filetype=scala

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark
