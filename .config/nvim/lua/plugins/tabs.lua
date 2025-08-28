
return {
    {
      "akinsho/bufferline.nvim",
      version = "*",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
        options = {
          mode = "buffers",
          always_show_bufferline = true,
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          offsets = {
            {
              filetype = "neo-tree",
              highlight = "Directory",
              separator = true,
            }
          }
        }
      }
    }
}
