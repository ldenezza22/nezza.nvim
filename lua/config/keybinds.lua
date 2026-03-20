vim.g.mapleader = " "

-- Basic commands
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Window management
vim.keymap.set("n", "<leader>ww", "<C-w>w", { noremap = true, silent = true, desc = "Cycle windows" })
vim.keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true, desc = "Go to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true, desc = "Go to below window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true, desc = "Go to above window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true, desc = "Go to right window" })
vim.keymap.set("n", "<leader>wH", "<C-w>H", { noremap = true, silent = true, desc = "Move window left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { noremap = true, silent = true, desc = "Move window down" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { noremap = true, silent = true, desc = "Move window up" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { noremap = true, silent = true, desc = "Move window right" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { noremap = true, silent = true, desc = "Split window vertically" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { noremap = true, silent = true, desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>w>", "<C-w>>", { noremap = true, silent = true, desc = "Increase window size" })
vim.keymap.set("n", "<leader>w<", "<C-w><", { noremap = true, silent = true, desc = "Decreate window size" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { noremap = true, silent = true, desc = "Equal all window sizes" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true, desc = "Close terminal" })

-- Fugitive
vim.keymap.set("n", "<leader>gs", ":Git<CR>", { silent = true })
vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { silent = true })
vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { silent = true })
vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { silent = true })
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", { silent = true })

-- LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>lf", function()
			vim.lsp.buf.format()
		end, { desc = "Format file" })
	end,
})
