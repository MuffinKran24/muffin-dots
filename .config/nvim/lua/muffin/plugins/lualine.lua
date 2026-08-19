return {
  'nvim-lualine/lualine.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local gruvbox_dark = {
      blue = "#83a598",
      green = "#b8bb26",
      violet = "#d3869b",
      yellow = "#fabd2f",
      red = "#fb4934",
      fg = "#ebdbb2",
      bg = "#282828",
      inactive_bg = "#3c3836",
    }

    local gruvbox_light = {
      blue = "#076678",
      green = "#79740e",
      violet = "#8f3f71",
      yellow = "#b57614",
      red = "#9d0006",
      fg = "#3c3836",
      bg = "#fbf1c7",
      inactive_bg = "#ebdbb2",
    }

    local catppuccin_latte = {
      blue = "#1e66f5",
      green = "#40a02b",
      violet = "#8839ef",
      yellow = "#df8e1d",
      red = "#d20f39",
      fg = "#4c4f69",
      bg = "#eff1f5",
      inactive_bg = "#dce0e8",
    }

    local catppuccin_frappe = {
      blue = "#8caaee",
      green = "#a6d189",
      violet = "#ca9ee6",
      yellow = "#e5c890",
      red = "#e78284",
      fg = "#c6d0f5",
      bg = "#303446",
      inactive_bg = "#232634",
    }

    local catppuccin_macchiato = {
      blue = "#8aadf4",
      green = "#a6da95",
      violet = "#c6a0f6", --mauve
      yellow = "#eed49f",
      red = "#ed8796",
      fg = "#cad3f5",
      bg = "#24273a",
      inactive_bg = "#181926",
    }

    local catppuccin_mocha = {
      blue = "#89b4fa",
      green = "#a6e3a1",
      violet = "#cba6f7",
      yellow = "#f9e2af",
      red = "#f38ba8",
      fg = "#cdd6f4",
      bg = "#1e1e2e",
      inactive_bg = "#11111b",
    }

    local themery = require("themery")
	  local currentTheme = themery.getCurrentTheme()
    local colors = gruvbox_dark -- fallback because gruvbox is cool

    if currentTheme.name == "Gruvbox Dark" then
      colors = gruvbox_dark
    elseif currentTheme.name == "Gruvbox Light" then
      colors = gruvbox_light
    elseif currentTheme.name == "Catppuccin Latte" then
      colors = catppuccin_latte
    elseif currentTheme.name == "Catppuccin Frappe" then
      colors = catppuccin_frappe
    elseif currentTheme.name == "Catppuccin Macchiato" then
      colors = catppuccin_macchiato
    elseif currentTheme.name == "Catppuccin Mocha" then
      colors = catppuccin_mocha
    end

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.inactive_bg, fg = colors.fg },
        c = { bg = colors.inactive_bg, fg = colors.fg },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat", symbols = { unix = " " } },
          { "filetype" },
        },
      },
    })
  end,
}
