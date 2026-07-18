return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = {
      preset = false, -- disable preset so it can't rebind Tab
      ["<Tab>"] = false,
      ["<S-Tab>"] = false,
    }
    return opts
  end,
}
