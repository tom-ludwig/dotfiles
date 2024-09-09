-- Keybind => gcc for one line or gc[count]{motion}
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
}
