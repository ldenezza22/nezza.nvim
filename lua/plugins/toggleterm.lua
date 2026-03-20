return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<C-\>]], -- toggle with Ctrl+\
			direction = "horizontal", -- "horizontal", "vertical", "float"
			shade_terminals = true,
			persist_mode = true, -- remembers insert/normal mode on reopen

		})
	end,
}
