local function lspSetup()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
            path ~= vim.fn.stdpath('config')
            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        -- Make the server aware of Neovim runtime files
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          },
        },
      })
    end,
    settings = {
      Lua = {},
    },
  })
  vim.lsp.enable("lua_ls")
end

return {
  "hrsh7th/nvim-cmp",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
    local cmp = require 'cmp'
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          local col = vim.fn.col(".") - 1
          if cmp.visible() then
            cmp.select_next_item({ behavior = "select" })
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
            fallback()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          local luasnip = require("luasnip")
          if cmp.visible() then
            cmp.select_prev_item({ behavior = "select" })
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = "path" },
      })
    })
    lspSetup()
  end,
  event = "VeryLazy",
  lazy = true,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "neovim/nvim-lspconfig",
    "onsails/lspkind.nvim",
  },
}
