return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        {
          name = "Gruvbox Dark",
          colorscheme = "gruvbox",
          before = [[
            vim.opt.background = "dark"
          ]],
        },

        {
          name = "Gruvbox Light",
          colorscheme = "gruvbox",
          before = [[
            vim.opt.background = "light"
          ]],
        },

        {
          name = "Catppuccin Mocha",
          colorscheme = "catppuccin",
          after = [[
            vim.cmd("Catppuccin mocha")
          ]],
        },

        {
          name = "Catppuccin Macchiato",
          colorscheme = "catppuccin",
          after = [[
            vim.cmd("Catppuccin macchiato")
          ]],
        },

        {
          name = "Catppuccin Frappe",
          colorscheme = "catppuccin",
          after = [[
            vim.cmd("Catppuccin frappe")
          ]],
        },

        {
          name = "Catppuccin Latte",
          colorscheme = "catppuccin",
          after = [[
            vim.cmd("Catppuccin latte")
          ]],
        },
      },

      livePreview = true,
    })
  end
}
