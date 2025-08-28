return {
--    {
--      "catppuccin/nvim",
--      name = "catppuccin", 
--      priority = 1000,
--      config = function()
--        vim.cmd("colorscheme  catppuccin-mocha")
--      end
--    },
--    {
--        "nyoom-engineering/oxocarbon.nvim",
--        config = function()
--            vim.opt.background = "dark"
--            vim.cmd.colorscheme "oxocarbon"
--        end
--    }
     
   {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
          vim.cmd("colorscheme kanagawa")
        end,
   },
}
