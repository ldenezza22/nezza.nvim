return {
	"nvimdev/lspsaga.nvim",
	event = "LSPAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require('lspsaga').setup({
			ui = {
				border = "rounded",
			},
		})
	end,
}
