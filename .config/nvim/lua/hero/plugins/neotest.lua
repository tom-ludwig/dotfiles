return {
  "nvim-neotest/neotest",
  lazy = true,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "fredrikaverpil/neotest-golang", version = "*" }, -- Installation
    "sidlatau/neotest-dart",
    "rouge8/neotest-rust",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-golang"),
        require("neotest-rust"),
        require("neotest-dart")({
          command = "flutter",
          use_lsp = true,
        }),
      },
    })
  end,
}
