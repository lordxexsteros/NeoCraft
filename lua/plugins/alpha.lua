return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- Custom Logo
      local custom_logo = [[
███▄▄▄▄      ▄████████  ▄██████▄   ▄████████    ▄████████    ▄████████    ▄████████     ███
███▀▀▀██▄   ███    ███ ███    ███ ███    ███   ███    ███   ███    ███   ███    ███ ▀█████████▄
███   ███   ███    █▀  ███    ███ ███    █▀    ███    ███   ███    ███   ███    █▀     ▀███▀▀██
███   ███  ▄███▄▄▄     ███    ███ ███         ▄███▄▄▄▄██▀   ███    ███  ▄███▄▄▄         ███   ▀
███   ███ ▀▀███▀▀▀     ███    ███ ███        ▀▀███▀▀▀▀▀   ▀███████████ ▀▀███▀▀▀         ███
███   ███   ███    █▄  ███    ███ ███    █▄  ▀███████████   ███    ███   ███            ███
███   ███   ███    ███ ███    ███ ███    ███   ███    ███   ███    ███   ███            ███
 ▀█   █▀    ██████████  ▀██████▀  ████████▀    ███    ███   ███    █▀    ███           ▄████▀
                                               ███    ███
      ]]

      -- Set the custom logo
      dashboard.section.header.val = vim.split(custom_logo, "\n")
      dashboard.section.header.opts.hl = "Title"

      -- Standard buttons in a single row at the bottom
      dashboard.section.buttons.val = {
        dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
        dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
        dashboard.button("s", "  Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
        dashboard.button("e", "  Config", ":e $MYVIMRC<CR>"),
      }

      -- Footer
      dashboard.section.footer.val = "🚀 Ready for action!"
      dashboard.section.footer.opts.hl = "Function"

      -- Layout settings to center the logo and position buttons horizontally at the bottom
      dashboard.opts.layout = {
        { type = "padding", val = 10 },
        dashboard.section.header,
        { type = "padding", val = 5 },
        { type = "group", val = { dashboard.section.buttons }, opts = { position = "center" } },
        { type = "padding", val = 2 },
        dashboard.section.footer,
      }

      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)

    end,
  },
}

