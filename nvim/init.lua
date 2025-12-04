
vim.opt.shortmess:append("I")

vim.opt.termguicolors = true

vim.opt.expandtab   = true
vim.opt.shiftwidth  = 4
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4

vim.opt.number      = true
vim.opt.numberwidth = 4

vim.opt.list = true
vim.opt.listchars = { space = " ", tab = ">-", trail = "◦", extends = ">", precedes = "<" }

vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"

vim.opt.showmode  = false
vim.opt.cmdheight = 0


-- Disableing arrow keys
local opts = { noremap = true, silent = true }
vim.keymap.set('', '<Up>',    '<Nop>', opts)
vim.keymap.set('', '<Down>',  '<Nop>', opts)
vim.keymap.set('', '<Left>',  '<Nop>', opts)
vim.keymap.set('', '<Right>', '<Nop>', opts)
vim.keymap.set('i', '<Up>',    '<Nop>', opts)
vim.keymap.set('i', '<Down>',  '<Nop>', opts)
vim.keymap.set('i', '<Left>',  '<Nop>', opts)
vim.keymap.set('i', '<Right>', '<Nop>', opts)
vim.keymap.set('v', '<Up>',    '<Nop>', opts)
vim.keymap.set('v', '<Down>',  '<Nop>', opts)
vim.keymap.set('v', '<Left>',  '<Nop>', opts)
vim.keymap.set('v', '<Right>', '<Nop>', opts)


-- Resizing panels
vim.keymap.set('n', '<C-h>', ':vertical resize -2<CR>', { noremap = true, silent = true })  -- shrink width
vim.keymap.set('n', '<C-l>', ':vertical resize +2<CR>', { noremap = true, silent = true })  -- increase width
vim.keymap.set('n', '<C-j>', ':resize +2<CR>', { noremap = true, silent = true })           -- increase height
vim.keymap.set('n', '<C-k>', ':resize -2<CR>', { noremap = true, silent = true })           -- decrease height


vim.keymap.set('n', '<leader>q', function()
  local current_buf = vim.api.nvim_get_current_buf()
  vim.cmd('b#')
  vim.cmd('bd ' .. current_buf)
end, { noremap = true, silent = true })


-- Super Scroll
vim.keymap.set('n', '<C-j>', '10j', { noremap = true })
vim.keymap.set('n', '<C-k>', '10k', { noremap = true })


-- Save file with CTRL+S
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, silent = true })


require("config.lazy")
