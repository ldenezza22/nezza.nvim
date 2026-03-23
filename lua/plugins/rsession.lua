return {
	"stevearc/resession.nvim",
	config = function()
		local resession = require("resession")

		resession.setup({
			autosave = {
				enabled = true,
				interval = 60, -- autosave every 60 seconds
				notify = false,
			},
			-- These filetypes won't be saved in sessions
			buf_filter = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				if ft == "NvimTree" then
					return false
				end
				return resession.default_buf_filter(bufnr)
			end,
		})

		-- Save with a custom name
		vim.api.nvim_create_user_command("SessionSave", function()
			require("nvim-tree.api").tree.close()
			resession.save(nil, { notify = true }) -- prompts for a name
			require("nvim-tree.api").tree.open()
		end, {})

		-- Restore a named session
		vim.api.nvim_create_user_command("SessionRestore", function()
			resession.load(nil, { silence_errors = true })
			vim.defer_fn(function()
				require("nvim-tree.api").tree.open()
			end, 100)
		end, {})

		-- List and select from all sessions
		vim.api.nvim_create_user_command("SessionList", function()
			require("nvim-tree.api").tree.close()
			resession.load(nil, { silence_errors = true })
			vim.defer_fn(function()
				require("nvim-tree.api").tree.open()
			end, 100)
		end, {})

		-- Delete a session
		vim.api.nvim_create_user_command("SessionDelete", function()
			resession.delete()
		end, {})

		vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save Session" })
		vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" })
		vim.keymap.set("n", "<leader>sl", "<cmd>SessionList<CR>", { desc = "List Sessions" })
		vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Delete Session" })
	end,
}
