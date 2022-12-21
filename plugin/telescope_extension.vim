" example

" fu! TTtttt(value)
"   echomsg 'a:value: ' .a:value
" endfu
"
" nnoremap ZZ :call telescope_extension#sel(
"         \ 'prompt_title',
"         \ [
"         \ '111+++++++++++++++1111111111111',
"         \ '111+++++++++++++++1111111111111',
"         \ '999+++++++++++++++9999999999999',
"         \ '111+++++++++++++++1111111111111',
"         \ ],
"         \ 'TTtttt'
"         \ )<CR>
