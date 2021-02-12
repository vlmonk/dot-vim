nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
nnoremap <silent><buffer><expr><nowait> d denite#do_map('do_action', 'delete')
nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
nnoremap <silent><buffer><expr> t denite#do_map('do_action', 'tabopen')
nnoremap <silent><buffer><expr> <Esc> denite#do_map('quit')
nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
nnoremap <silent><buffer><expr><nowait> <Space> denite#do_map('toggle_select').'j'
