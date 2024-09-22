-- Better Statusline
return {
  "nvim-lualine/lualine.nvim",
  -- enabled = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim",
  },
  config = function()
    require("lualine").setup({
      options = { theme = "catppuccin" },
    })
  end,
}
