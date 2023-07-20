-- many thansk to ChatGTP

function prettify_json()
  -- Get the start and end line of the visual selection
  local start_line, end_line = unpack(vim.fn.getpos("'<"), 2, 3), unpack(vim.fn.getpos("'>"), 2, 3)

  -- Save the current unnamed register and clipboard register before overwriting
  local unnamed_register = vim.fn.getreg('"')
  local unnamed_register_type = vim.fn.getregtype('"')
  local clipboard_register = vim.fn.getreg('+')
  local clipboard_register_type = vim.fn.getregtype('+')

  -- Yank the selected lines to unnamed register
  vim.api.nvim_command(start_line .. "," .. end_line .. "y")

  -- Open a new temporary scratch buffer in a split window
  vim.api.nvim_command('new')
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'wipe'
  vim.bo.swapfile = false

  -- Put the yanked lines in the new buffer and send to the shell command
  vim.api.nvim_command('normal! "0P')
  vim.api.nvim_command('1,$!prettier --parser json')

  -- Check for errors in the command
  if vim.v.shell_error ~= 0 then
    -- Close the temporary split window
    vim.api.nvim_command('q')
    -- Show error message
    vim.api.nvim_echo({{'Prettier failed to format the selected text', 'ErrorMsg'}}, true, {})
  else
    -- Yank the prettified lines and replace the original lines
    vim.api.nvim_command('normal! ggVGy')
    vim.api.nvim_command('q')
    vim.api.nvim_command(start_line .. "," .. end_line .. "'_d")
    vim.api.nvim_command('normal! "0P')
  end

  -- Restore the unnamed and clipboard registers
  vim.fn.setreg('"', unnamed_register, unnamed_register_type)
  vim.fn.setreg('+', clipboard_register, clipboard_register_type)
end

vim.api.nvim_set_keymap('v', '<leader>j', ':lua prettify_json()<CR>', {noremap = true, silent = true})
