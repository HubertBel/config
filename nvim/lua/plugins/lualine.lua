return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "nord",
				disabled_filetypes = { "lazy", "neo-tree" },
				section_separators = { left = "", right = "" },
				component_separators = "|",
			},
		})
	end,
}
