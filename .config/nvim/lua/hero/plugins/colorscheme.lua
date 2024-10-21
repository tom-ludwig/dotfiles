return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {},
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            kitty = true,
            term_colors = true,
        })
        vim.cmd("colorscheme catppuccin")
    end,
}
