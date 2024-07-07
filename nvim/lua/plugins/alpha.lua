return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                                                            ]],
			[[    ___       ___       ___       ___       ___       ___   ]],
			[[   /\__\     /\  \     /\  \     /\__\     /\  \     /\__\  ]],
			[[  /:| _|_   /::\  \   /::\  \   /:/ _/_   _\:\  \   /::L_L_ ]],
			[[ /::|/\__\ /::\:\__\ /:/\:\__\ |::L/\__\ /\/::\__\ /:/L:\__\]],
			[[ \/|::/  / \:\:\/  / \:\/:/  / |::::/  / \::/\/__/ \/_/:/  /]],
			[[   |:/  /   \:\/  /   \::/  /   L;;/__/   \:\__\     /:/  / ]],
			[[   \/__/     \/__/     \/__/               \/__/     \/__/  ]],
			[[                                                            ]],
		}
		alpha.setup(dashboard.opts)
	end,
}
