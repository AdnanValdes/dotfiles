" Create new buffers, window tiling
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

" Telescope config
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>cd <cmd>lua require('telescope.builtin').file_browser()<cr>

" Telekasten config
nnoremap <leader>tf :lua require('telekasten').find_notes()<CR>
nnoremap <leader>td :lua require('telekasten').find_daily_notes()<CR>
nnoremap <leader>tg :lua require('telekasten').search_notes()<CR>
nnoremap <leader>tz :lua require('telekasten').follow_link()<CR>
nnoremap <leader>tT :lua require('telekasten').goto_today()<CR>
nnoremap <leader>tW :lua require('telekasten').goto_thisweek()<CR>
nnoremap <leader>tw :lua require('telekasten').find_weekly_notes()<CR>
nnoremap <leader>tn :lua require('telekasten').new_note()<CR>
nnoremap <leader>tN :lua require('telekasten').new_templated_note()<CR>
nnoremap <leader>ty :lua require('telekasten').yank_notelink()<CR>
nnoremap <leader>tc :lua require('telekasten').show_calendar()<CR>
nnoremap <leader>tC :CalendarT<CR>
nnoremap <leader>ti :lua require('telekasten').paste_img_and_link()<CR>
nnoremap <leader>tt :lua require('telekasten').toggle_todo()<CR>
nnoremap <leader>tb :lua require('telekasten').show_backlinks()<CR>
nnoremap <leader>tF :lua require('telekasten').find_friends()<CR>
nnoremap <leader>tI :lua require('telekasten').insert_img_link({ i=true })<CR>
nnoremap <leader>tp :lua require('telekasten').preview_img()<CR>
nnoremap <leader>tm :lua require('telekasten').browse_media()<CR>
nnoremap <leader>ta :lua require('telekasten').show_tags()<CR>

" on hesitation, bring up the panel
nnoremap <leader>t :lua require('telekasten').panel()<CR>

" we could define [[ in **insert mode** to call insert link
" inoremap [[ <cmd>:lua require('telekasten').insert_link()<CR>
" alternatively: leader [
inoremap <leader>[ <cmd>:lua require('telekasten').insert_link({ i=true })<CR>
inoremap <leader>tt <cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>

" Find and replace highlighted text
 
