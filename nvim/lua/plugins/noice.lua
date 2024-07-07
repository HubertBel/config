return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	vim.keymap.set("n", "<leader>nd", "<CMD>NoiceDismiss<CR>", { desc = "Dismiss Noice Message" }),
}
