return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add          = { text = "▎" },
				change       = { text = "▎" },
				delete       = { text = "" },
				topdelete    = { text = "" },
				changedelete = { text = "▎" },
				untracked    = { text = "▎" },
			},
			current_line_blame = false,
			current_line_blame_opts = {
				delay = 500,
				virt_text_pos = "eol",
			},
			on_attach = function(bufnr)
				local gs = require("gitsigns")
				local opts = { buffer = bufnr }

				-- Navigation
				vim.keymap.set("n", "]h", gs.next_hunk, opts)
				vim.keymap.set("n", "[h", gs.prev_hunk, opts)

				-- Staging
				vim.keymap.set("n", "<leader>hs", gs.stage_hunk, opts)
				vim.keymap.set("n", "<leader>hr", gs.reset_hunk, opts)
				vim.keymap.set("n", "<leader>hS", gs.stage_buffer, opts)
				vim.keymap.set("n", "<leader>hR", gs.reset_buffer, opts)
				vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts)

				-- Preview
				vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)
				vim.keymap.set("n", "<leader>hi", gs.preview_hunk_inline, opts)
				vim.keymap.set("n", "<leader>hw", gs.toggle_word_diff, opts)
				vim.keymap.set("n", "<leader>hd", gs.diffthis, opts)
				vim.keymap.set("n", "<leader>hD", function()
					gs.diffthis('~')
				end, opts)


				-- Blame
				vim.keymap.set("n", "<leader>hb", gs.toggle_current_line_blame, opts)
			end,
		})
	end,
}
