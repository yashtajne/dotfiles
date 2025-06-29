

vim.opt.expandtab = true       
vim.opt.shiftwidth = 2         
vim.opt.tabstop = 2            
vim.opt.softtabstop = 2        

vim.opt.number = true;
vim.opt.numberwidth = 4

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"


vim.keymap.set('n', '<leader>f', ':lua require("telescope.builtin").find_files({ cwd = vim.fn.getcwd() })<CR>', { desc = 'Telescope find files', silent = true })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

require("config.lazy")
