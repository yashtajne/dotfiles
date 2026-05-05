local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.g.mapleader = " "
vim.opt.rtp:prepend(lazypath)

-- setup plugins
require("lazy").setup({
  -- example plugin
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  {
     "wnkz/monoglow.nvim",
     lazy = false,
     priority = 1000,
     opts = {},
  },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }
})


-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
})

-- LSP setup
vim.lsp.config("clangd", {})
vim.lsp.enable("clangd")

-- Telescope
require("telescope").load_extension("fzf")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- colorscheme
vim.cmd("colorscheme monoglow-lack")

vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

vim.opt.number = true
vim.opt.relativenumber = true
