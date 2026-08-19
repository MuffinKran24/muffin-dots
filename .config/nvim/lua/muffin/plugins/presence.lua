return {
  'andweeb/presence.nvim',
  config = function()
    require("presence").setup({
      main_image          = "neovim",
      show_time           = true,
    })
  end
}
