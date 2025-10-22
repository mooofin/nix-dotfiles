return {
  {
    "akinsho/toggleterm.nvim",
    opts = {
      -- You can tweak defaults here
      direction = "float", -- always use floating terminal
      float_opts = {
        border = "curved", -- rounded borders for that glassy vibe
      },
    },
    keys = {
      {
        "<leader>r",
        function()
          require("toggleterm").toggle(1, nil, vim.fn.getcwd())
        end,
        desc = "Floating terminal (cwd)",
      },
    },
  },
}
