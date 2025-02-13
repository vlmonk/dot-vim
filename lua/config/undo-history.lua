-- Undo History (Persistent Undo)
local vimDir = os.getenv("HOME") .. "/.vim"
if not string.find(vim.o.runtimepath, vimDir, 1, true) then
  vim.opt.runtimepath:append(vimDir)
end

if vim.fn.has("persistent_undo") == 1 then
  local myUndoDir = vimDir .. "/undodir-v5"
  os.execute("mkdir -p " .. vimDir)
  os.execute("mkdir -p " .. myUndoDir)
  vim.opt.undodir  = myUndoDir
  vim.opt.undofile = true
end

