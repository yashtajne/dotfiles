-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Add plugins
	-- { import = "plugins" },
    {
      "catppuccin/nvim",
      name = "catppuccin", 
      priority = 1000,
      config = function()
        vim.cmd("colorscheme  catppuccin-mocha")
      end
    },
    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function()
        require'nvim-treesitter.configs'.setup {
          ensure_installed = { 
			"lua", 
			"javascript", 
			"typescript", 
			"python", 
			"c", 
			"cpp"
		  },
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
          indent = {
            enable = true,
          },
        }
      end,
    },
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
  },
  
  -- Install settings (this was placed outside setup, now moved inside)
  install = { colorscheme = { "habamax" } },

  -- Automatically check for plugin updates
  checker = { enabled = true },
})
