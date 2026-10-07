return {
  url = "https://codeberg.org/andyg/leap.nvim.git",
  keys = {
    { "s", "<Plug>(leap)", mode = { "n", "x", "o" }, desc = "Leap" },
    { "S", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from window" },
  },
  config = function(_, opts)
    local leap = require("leap")
    for k, v in pairs(opts or {}) do
      leap.opts[k] = v
    end
  end,
}
