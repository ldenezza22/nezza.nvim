vim.lsp.config("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
			},
		},
	},
})


vim.lsp.enable('pyright')

vim.lsp.config("ruff", {
	init_options = {
		settings = {
			args = {},
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.code_action({
			context = { only = { "source.fixAll.ruff" } },
			apply = true,
		})
		vim.lsp.buf.format({ async = false })
	end,
})

vim.lsp.enable("ruff")
