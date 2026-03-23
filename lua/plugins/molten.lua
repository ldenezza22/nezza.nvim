return {
	"benlubas/molten-nvim",
	build = ":UpdateRemotePlugins",
	dependencies = { "3rd/image.nvim" },
	config = function()
		vim.g.molten_image_provider = "image.nvim"
		vim.g.molten_output_win_max_height = 20
		vim.g.molten_auto_open_output = true
		vim.g.molten_wrap_output = true
		vim.g.molten_virt_text_output = true
		vim.g.molten_virt_lines_off_by_1 = true

		vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize Molten kernel" })
		vim.keymap.set("n", "<leader>me", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line" })
		vim.keymap.set(
			"v",
			"<leader>me",
			":<C-u>MoltenEvaluateVisual<CR>",
			{ silent = true, desc = "Evaluate visual selection" }
		)
		vim.keymap.set("n", "<leader>mc", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell" })
		vim.keymap.set("n", "<leader>md", ":MoltenDelete<CR>", { silent = true, desc = "Delete cell" })
		vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "Hide output" })
		vim.keymap.set("n", "<leader>ms", ":MoltenShowOutput<CR>", { silent = true, desc = "Show output" })
		vim.keymap.set("n", "<leader>mx", ":MoltenInterrupt<CR>", { silent = true, desc = "Interrupt kernel" })
		vim.keymap.set("n", "<leader>mr", ":MoltenRestart<CR>", { silent = true, desc = "Restart kernel" })
	end,
}
