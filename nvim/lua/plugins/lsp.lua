return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		-- LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})

		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

		local default_setup = function(server)
			require("lspconfig")[server].setup({
				capabilities = lsp_capabilities,
			})
		end

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "gopls", "html", "htmx", "templ" },
			handlers = {
				default_setup,

				html = function()
					local html_capabilities = vim.lsp.protocol.make_client_capabilities()
					html_capabilities.textDocument.completion.completionItem.snippetSupport = true

					require("lspconfig").html.setup({
						capabilities = html_capabilities,
					})
				end,
			},
		})

		-- Completion
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
				["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
	end,
}
