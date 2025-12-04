
-- Focus Explorer
vim.keymap.set('n', '<leader>f', function()
    vim.cmd("Telescope find_files")
end, { noremap = true, silent = true, desc = "Open Telescope" })


return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
}
