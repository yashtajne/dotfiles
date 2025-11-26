

-- Show Diagnostics of current line in Floating
vim.keymap.set("n", "<leader>e", function()
  local opts = {
    focusable = true,
    border = "rounded",
    close_events = { "InsertEnter" }
  }

  -- Open diagnostic float
  vim.diagnostic.open_float(0, opts)

  -- Find the floating window
  local float_win
  for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(w).relative ~= "" then
      float_win = w
      break
    end
  end

  if float_win then
    -- Switch cursor into the float
    vim.api.nvim_set_current_win(float_win)

    -- Close the floating Diagnostics
    for _, k in ipairs({ "<CR>", "<Esc>", "q" }) do
        vim.keymap.set("n", k, function()
          if vim.api.nvim_win_is_valid(float_win) then
            vim.api.nvim_win_close(float_win, true)
          end
        end, { buffer = 0, nowait = true })
    end
  end
end, { desc = "Show diagnostic" })

return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- C/C++
            vim.lsp.config["clangd"] = {
                filetypes = { "c", "cpp", "objc", "objcpp" },
            }

            -- Lua
            vim.lsp.config["lua_ls"] = {
                filetypes = { "lua" },
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { checkThirdParty = false },
                    },
                },
            }

             -- C#
            vim.lsp.config["omnisharp"] = {
                filetypes = { "cs" },
                root_markers = { "*.sln", "*.csproj", ".git" },
            }

            -- TypeScript / JavaScript
            vim.lsp.config["ts_ls"] = {
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
                settings = {
                    javascript = {
                        suggest = { autoImports = true },
                    },
                    typescript = {
                        suggest = { autoImports = true },
                    },
                },
            }

            -- Rust
            vim.lsp.config["rust_analyzer"] = {
                filetypes = { "rust" },
                capabilities = capabilities,
                root_markers = { "Cargo.toml", ".git" },
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        checkOnSave = { command = "clippy" },
                    },
                },
            }

            -- enable
            vim.lsp.config["ts_ls"].capabilities = capabilities
            vim.lsp.config["clangd"].capabilities = capabilities
            vim.lsp.config["lua_ls"].capabilities = capabilities
            vim.lsp.config["omnisharp"].capabilities = capabilities
            vim.lsp.config["rust_analyzer"].capabilities = capabilities
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end
    },
}
