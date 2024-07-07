return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "kmarius/jsregexp",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          fields = { "abbr", "menu", "kind" },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = "NLSP",
              nvim_lua = "NLUA",
              luasnip = "LSNP",
              buffer = "BUFF",
              path = "PATH",
            }
            item.menu = menu_icon[entry.source.name]

            fixed_width = 30

            local content = item.abbr

            if fixed_width then
              vim.o.pumwidth = fixed_width
            end

            local win_width = vim.api.nvim_win_get_width(0)
            local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

            if #content > max_content_width then
              item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
            else
              item.abbr = content .. (" "):rep(max_content_width - #content)
            end
            return item
          end,
        },
      })
    end,
  },
}
