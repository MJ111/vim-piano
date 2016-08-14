" piano effect
function! PlaySound()
  py import random, vim; vim.command("let number = " + str(random.randint(1, 9)))
  let play = join(["!afplay ~/.vim/support/cmj/", ".aiff &"], number)
  silent! exec play
endfunction

let g:togglePiano = 0
function! TogglePiano()
  let g:togglePiano = 1 - g:togglePiano
  if g:togglePiano == 1 && has("gui_macvim")
    augroup Piano
      autocmd!
      autocmd CursorMovedI * call PlaySound()
    augroup END
  else
    au! Piano
  endif
endfunction

if !exists('g:togglePianoKey')
  let g:togglePianoKey = "<F8>"
endif
execute "nnoremap" g:togglePianoKey ":call TogglePiano()<CR>"


