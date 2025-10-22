-- Compile & run C inside a terminal buffer
vim.keymap.set("n", "<F5>", function()
  vim.cmd("w") -- save current file
  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r") -- file without extension
  -- open a terminal and run compile + execute
  vim.cmd("terminal gcc " .. file .. " -o " .. output .. " && ./" .. output)
  -- go to insert mode in terminal automatically
  vim.cmd("startinsert")
end, { noremap = true, silent = true, desc = "Compile & Run C file" })
