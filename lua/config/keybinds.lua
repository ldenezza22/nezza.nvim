vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover info" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>fc", function()
	vim.lsp.buf.format()
end, { desc = "Format file" })
vim.api.nvim_create_autocmd("InsertCharPre", {
	callback = function()
		vim.lsp.buf.signature_help()
	end,
})
