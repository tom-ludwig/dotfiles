return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        routes = {
            {
                filter = {
                    event = "msg_show",
                    any = {
                        { find = "%d+L, %d+B" },
                        { find = "; after #%d+" },
                        { find = "; before #%d+" },
                        { find = "fewer lines" },
                    },
                },
                view = "mini",
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = false, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        views = {
            -- Clean cmdline_popup + palette
            cmdline_popup = {
                position = {
                    row = 1,
                    col = "50%",
                },
                size = {
                    min_width = 60,
                    width = "auto",
                    height = "auto",
                },
                win_options = {
                    winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "FloatBorder" },
                },
            },
            cmdline_popupmenu = {
                relative = "editor",
                position = {
                    row = 13,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                    max_height = 15,
                },
                border = {
                    style = "none",
                    padding = { 0, 3 },
                },
                win_options = {
                    winhighlight = { NormalFloat = "NormalFloat", FloatBorder = "NoiceCmdlinePopupBorder" },
                },
            },
            confirm = {
                border = {
                    style = "single",
                },
            },
            popup = {
                border = {
                    style = "single",
                },
            },
            mini = {
                border = {
                    style = "rounded",
                },
                win_options = {
                    winblend = 0,
                },
            },
        },
    },
  -- stylua: ignore
  keys = {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
   { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
  },
}
