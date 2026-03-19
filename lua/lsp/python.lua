vim.lsp.config("pyright", {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})


vim.lsp.enable('pyright')

vim.lsp.config("ruff", {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { 'pyproject.toml', 'ruff.toml', 'setup.py', 'setup.cfg', '.git' },

	init_options = {
		settings = {
			configurationPreference = "filesystemFirst",
			lineLength = 88,
			lint = {
				select = { "I" , "F", "D", "E", "UP", "B"},
				ignore = { "E501" },
			},
			format = { preview = false, },
		},
	},
})

vim.lsp.enable("ruff")
