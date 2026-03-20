return {
	'nvim-telescope/telescope.nvim',
	version = '*',
	dependencies = {
		'nvim-lua/plenary.nvim',
		-- optional but recommended
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	config = function()
		local builtin = require('telescope.builtin')
		-- Files
		vim.keymap.set("n", "<leader>ff", builtin.find_files) -- find files by name
		vim.keymap.set("n", "<leader>fg", builtin.live_grep) -- search text across project
		vim.keymap.set("n", "<leader>fb", builtin.buffers) -- switch between open buffers
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles) -- recently opened files

		-- LSP (these become very powerful with basedpyright)
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols) -- symbols in current file
		vim.keymap.set("n", "<leader>fw", builtin.lsp_workspace_symbols) -- symbols across project
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics)     -- all LSP diagnostics

		-- Git
		vim.keymap.set("n", "<leader>fc", builtin.git_commits) -- browse commit history
		vim.keymap.set("n", "<leader>fb", builtin.git_branches) -- switch branches

		-- Meta
		vim.keymap.set("n", "<leader>fh", builtin.help_tags) -- search Neovim's help docs
		vim.keymap.set("n", "<leader>fk", builtin.keymaps)   -- search all keymaps
		vim.keymap.set("n", "<leader>f:", builtin.command_history) -- recent commands
	end,
	mappings = {
		i = {
			["<C-j>"] = require("telescope.actions").move_selection_next,
			["<C-k>"] = require("telescope.actions").move_selection_previous,
			["<C-u>"] = require("telescope.actions").preview_scrolling_up,
			["<C-d>"] = require("telescope.actions").preview_scrolling_down,
			["<Esc>"] = require("telescope.actions").close,
		},
	},

}
