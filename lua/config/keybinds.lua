vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "<leader>fc", function()
	vim.lsp.buf.format()
end, { desc = "Format file" })

--[[ vim.api.nvim_create_autocmd("InsertCharPre", {
	callback = function()
		vim.lsp.buf.signature_help()
	end,
}) ]] --

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

		--[[ vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
		vim.keymap.set("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>")
		vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
		vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>")
		vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
		vim.keymap.set("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>") ]] --
	end,
})
