return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 24,
      shade_terminals = true,
      start_in_insert = true,
      direction = 'horizontal', -- or 'vertical' | 'float' | 'tab'
      persist_size = true,
    })
  end
}
