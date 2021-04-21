function! bushels#column_from_right() abort
  let cur_pos = getpos('.')
  normal! $
  let last_col = col('.')
  call setpos('.', cur_pos)
  return last_col + 1 - cur_pos[2]
endfunction

function! bushels#change_marker() abort
  if bushels#column_from_right() == 4
    normal "_dgn
    execute 'startinsert!'
  else
    normal "_dgn
    execute 'startinsert'
  endif
endfunction

function! bushels#backward_marker(n)
  if a:n > 0
    execute 'normal! ?<++> '  . a:n . 'n"'
  else
    execute 'normal! ?<++>"'
  endif
  call bushels#change_marker()
endfunction

function! bushels#forward_marker(n)
  if a:n > 1
    execute 'normal! /<++> '  . (a:n - 1) . 'n"'
  else
    execute 'normal! /<++>"'
  endif
  call bushels#change_marker()
endfunction

function! bushels#delete_all_markers()
  let save_pos = getpos('.')
  execute '%s/<++>//g'
  call setpos('.', save_pos)
endfunction

function! bushels#delete_marker(n)
  if a:n > 1
    execute 'normal! /<++> '  . (a:n - 1) . 'n'
  else
    execute 'normal! /<++>'
  endif
  normal "_dgn
endfunction

function! bushels#delete_marker_row(n)
  if a:n > 1
    execute 'normal! /<++> '  . (a:n - 1) . 'n"_dd'
  else
    execute 'normal! /<++>"_dd'
  endif
endfunction
