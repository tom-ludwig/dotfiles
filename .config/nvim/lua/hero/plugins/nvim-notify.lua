return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    -- Set the default notification system to use notify
    vim.notify = notify
  end,
}
