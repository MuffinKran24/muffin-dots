local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- NvimTree
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle File Tree' })
vim.keymap.set('n', '<leader>r', '<cmd>NvimTreeFocus<CR>', { desc = 'Focus File Tree' })

-- Tabs
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<CR>', { desc = 'New Tab' })
vim.keymap.set('n', '<C-d>', '<cmd>tabnext<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', '<C-a>', '<cmd>tabprevious<CR>', { desc = 'Previous Tab' })
vim.keymap.set('n', '<C-w>', '<cmd>tabclose<CR>', { desc = 'Close Tab' })

-- Plugins
vim.keymap.set('n', '<A-t>', '<cmd>Themery<CR>', { desc = 'Open Theme selector' })
vim.keymap.set('n', '<A-l>', '<cmd>URLOpenUnderCursor<CR>', { desc = 'Open link under cursor' })
