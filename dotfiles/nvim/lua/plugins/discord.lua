return {
  "andweeb/presence.nvim",
  event = "VeryLazy",
  config = function()
    require("presence").setup({
      auto_update = true,
      neovim_image_text = "Editing with Neovim 💻",
      main_image = "file", -- "neovim" or "file"
      client_id = "793271441293967371", -- official Discord application ID for Neovim
      log_level = nil,
      debounce_timeout = 10,
      enable_line_number = false,
      buttons = true,
      show_time = true,
    })
  end,
}
