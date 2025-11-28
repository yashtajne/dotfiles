
return {
-- -- Kanagawa colorscheme
-- {
--   "rebelot/kanagawa.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--
--   --      local is_windows = vim.fn.has("win32") == 1
--   --      if is_windows then
--   --          vim.cmd("colorscheme kanagawa-lotus")
--   --      else
--   --          vim.cmd("colorscheme kanagawa-dragon")
--   --        end
--
--       vim.cmd("colorscheme kanagawa-lotus")
--   end,
-- },


    -- Rose Pine colorscheme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        config = function()
          -- Other options if you want:
          -- vim.cmd("colorscheme rose-pine-main")
          -- vim.cmd("colorscheme rose-pine-moon")
            vim.cmd("colorscheme rose-pine-dawn")
        end,
    },
}
