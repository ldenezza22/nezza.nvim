return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "ruff_format" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				sql = { "sqlfmt" },
				markdown = { "prettier", injected = true },
			},

			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		})
	end,
}
