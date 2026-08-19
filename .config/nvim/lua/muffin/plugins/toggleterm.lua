return { 
  'akinsho/toggleterm.nvim',
  config = function()
    require("toggleterm").setup{
      size = 16,
      open_mapping = [[<leader>tt]],
      direction = 'float'
    }
  end
}
