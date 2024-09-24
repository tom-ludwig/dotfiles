-- Marks TODO Comments and Enables Project wide todo search/navigation
return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local todo_comments = require("todo-comments")
        local keymap = vim.keymap

        -- Jump to the next TODO comment
        keymap.set("n", "]t", function()
            todo_comments.jump_next()
        end)

        keymap.set("n", "[t", function()
            todo_comments.jump_prev()
        end)

        todo_comments.setup()
    end,
}
