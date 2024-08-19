vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })

-- setup keybindings for telescope, i.e. quick open
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- vim.diagnostic.show()
--[[ Toggle Inline Warning and Error Messages
local diag_status = 1 -- 1 is show; 0 is hide

vim.api.nvim_set_keymap('n', '<leader>td', '', {
    noremap = true,
    callback = function()
        if diag_status == 1 then
            diag_status = 0
            vim.diagnostic.hide()
        else
            diag_status = 1
            vim.diagnostic.show()
        end
    end
})
]] --
