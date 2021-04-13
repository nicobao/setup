" coc.nvim custom source for .editorconfig (put in ~/.vim/autoload/coc/source/)
" credits to https://gist.github.com/tmatz/827f9ac94bb5f6de2cb0e56aff1a82e6

function! coc#source#editorconfig#init() abort
  return {
  \ filetypes: [ 'editorconfig' ] 
  \}
endfunction

function! coc#source#editorconfig#complete(opt, cb) abort
  let items = [
  \ 'charset',
  \ 'end_of_line',
  \ 'indent_size',
  \ 'insert_final_newline',
  \ 'insert_style',
  \ 'max_line_length',
  \ 'root',
  \ 'tab_width',
  \ 'trim_trailing_whitespace',
  \ 'utf-8',
  \ 'lf',
  \ 'cr',
  \ 'crlf',
  \ 'true',
  \ 'false',
  \ 'off',
  \ ]
  call a:cb(items)
endfunction
