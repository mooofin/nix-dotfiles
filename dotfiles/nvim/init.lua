-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.keymap.set("n", "<F5>", ":!gcc % -o %< && ./%<<CR>", { noremap = true, silent = true })
