-- Mason and LSP-Zero configuration
require('mason').setup()
require('mason-lspconfig').setup()

local lsp = require('lsp-zero')

lsp.preset('recommended')

-- Ensure LSP servers are installed
lsp.ensure_installed({
    'lua_ls',         -- Lua (was 'sumneko_lua' before)
    'rust_analyzer',  -- rust
    'gopls',          -- Golang
    'golangci_lint_ls', -- Golang
    'tsserver',       -- Javascript
    'markdown_oxide', -- Markdown
    'jsonls',         -- JSON
    'bashls',         -- Bash
    'yamlls',         --YAML
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()
