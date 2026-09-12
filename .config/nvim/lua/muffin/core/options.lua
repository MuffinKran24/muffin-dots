vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = false

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.clipboard:append("unnamedplus") -- use system clipboard

vim.opt.swapfile = false
vim.opt.backspace = "indent,eol,start"

vim.g.rust_recommended_style = false -- prevent rust from fucking up the rest of the config

vim.filetype.add({
  extension = {
    ino = 'cpp',
  },
})
