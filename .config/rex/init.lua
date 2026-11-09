-- ── tmux bindings (prefix ctrl+b and prefix2 ctrl+s) ────────────────────────

-- pass-through so programs that use either prefix still receive it
rex.bind("ctrl+b>ctrl+b", "pane.send_key", { key = "ctrl+b" })
rex.bind("ctrl+s>ctrl+s", "pane.send_key", { key = "ctrl+s" })

-- reload config  (~/.tmux.conf:3)
rex.bind("ctrl+b>r", "client.config.reload")
rex.bind("ctrl+s>r", "client.config.reload")

-- pane focus  (~/.tmux.conf:30-33)
rex.bind("ctrl+b>h", "pane.focus", { direction = "left" })
rex.bind("ctrl+b>j", "pane.focus", { direction = "down" })
rex.bind("ctrl+b>k", "pane.focus", { direction = "up" })
rex.bind("ctrl+b>l", "pane.focus", { direction = "right" })
rex.bind("ctrl+s>h", "pane.focus", { direction = "left" })
rex.bind("ctrl+s>j", "pane.focus", { direction = "down" })
rex.bind("ctrl+s>k", "pane.focus", { direction = "up" })
rex.bind("ctrl+s>l", "pane.focus", { direction = "right" })

-- split pane  (~/.tmux.conf:38-39)
rex.bind("ctrl+b>shift+'", "pane.split", { direction = "down" })
rex.bind("ctrl+b>shift+5", "pane.split", { direction = "right" })
rex.bind("ctrl+s>shift+'", "pane.split", { direction = "down" })
rex.bind("ctrl+s>shift+5", "pane.split", { direction = "right" })

-- rename tab  (tmux: prefix + ,)
rex.bind("ctrl+b>,", "client.tab.rename")
rex.bind("ctrl+s>,", "client.tab.rename")

-- new tab  (~/.tmux.conf:40)
rex.bind("ctrl+b>c", "client.tab.new")
rex.bind("ctrl+s>c", "client.tab.new")

-- go to tab by number
for i = 1, 9 do
  rex.bind("ctrl+b>" .. i, "client.tab.goto", { index = i })
  rex.bind("ctrl+s>" .. i, "client.tab.goto", { index = i })
end

-- repeat mode (for -r bindings — none of the -r bindings migrated, but mode preserved)
rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+b>ctrl+r", "client.mode.enter", { name = "repeat" })
rex.bind("ctrl+s>ctrl+r", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/enter",  "client.mode.exit")
rex.bind("repeat/escape", "client.mode.exit")
