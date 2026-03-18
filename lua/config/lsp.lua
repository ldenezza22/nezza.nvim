vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
	vim.lsp.handlers.hover,
	{
		border = "rounded",
		max_width = 80,
		max_height = 20,
	}
)
vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = "●",
	},
	float = {
		border = "rounded",
	},
	severity_sort = true,
})
