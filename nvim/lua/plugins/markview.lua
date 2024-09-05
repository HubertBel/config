return {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local markview = require("markview")
        local presets = require("markview.presets")

        markview.setup({
            headings = presets.headings.glow_labels,
        })

        vim.keymap.set("n", "<leader>ev", "<CMD>Markview enableAll<CR>")
        vim.keymap.set("n", "<leader>dv", "<CMD>Markview disableAll<CR>")
    end,
}
