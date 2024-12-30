-- Better Statusline
return {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "catppuccin/nvim",
    },
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
            },
            sections = {
                lualine_a = { "mode" },
                -- lualine_b = { "branch" },
                lualine_b = { "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "", "", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
