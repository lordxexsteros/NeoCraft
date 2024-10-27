-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("notify").setup({
  stages = "slide",
  timeout = 3000,
  background_colour = "#000000",
  debug = true,  -- Enables debug mode
})

