

-- Bufferline Tabs switch (Barbar)
for i = 1, 9 do
  vim.keymap.set("n", ("<leader>%s"):format(i), function()
    local ft = vim.bo.filetype
    if ft ~= "neo-tree" then
      vim.cmd("BufferGoto " .. i)
    end
  end, { desc = "Go to buffer " .. i })
end

return {
  {
    "romgrk/barbar.nvim",
    dependencies = {},
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = true,
      auto_hide = false,
      tabpages = false,
      clickable = true,
      icons = {
        buffer_index = false,
        buffer_number = false,
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
          [vim.diagnostic.severity.WARN]  = { enabled = true, icon = " " },
          [vim.diagnostic.severity.INFO]  = { enabled = true, icon = " " },
          [vim.diagnostic.severity.HINT]  = { enabled = true, icon = " " },
        },
        separator = { left = "", right = "" },
        separator_at_end = true,
      },
      insert_at_end = false,
      maximum_padding = 2,
      minimum_padding = 1,
      sidebar_filetypes = {
        ["neo-tree"] = { event = "BufWipeout" },
      },
    },
  },
}
