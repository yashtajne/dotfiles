return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,          -- Show all files, even hidden ones
          hide_dotfiles = false,   -- Show dotfiles like .git, .env
          hide_gitignored = false, -- Show files ignored by .gitignore
        },
      },
      window = {
        mappings = {
          ["<cr>"] = "open",
          ["o"]    = "open_vsplit"
        },
      },
    },
  }
}
