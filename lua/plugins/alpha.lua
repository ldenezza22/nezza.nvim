return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header
		local header = {
			type = "text",
			val = {
				"                                                     ",
				"  ███╗   ██╗███████╗███████╗███████╗ █████╗         ",
				"  ████╗  ██║██╔════╝╚══███╔╝╚══███╔╝██╔══██╗        ",
				"  ██╔██╗ ██║█████╗    ███╔╝   ███╔╝ ███████║        ",
				"  ██║╚██╗██║██╔══╝   ███╔╝   ███╔╝  ██╔══██║        ",
				"  ██║ ╚████║███████╗███████╗███████╗██║  ██║        ",
				"  ╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝        ",
				"                                                     ",
			},
			opts = { hl = "AlphaHeader", position = "center" },
		}

		-- Static navigation buttons
		local buttons = {
			type = "group",
			val = {
				{ type = "text", val = "  Navigation", opts = { hl = "AlphaHeader", position = "center" } },
				{ type = "padding", val = 1 },
				dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
				dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
				dashboard.button("g", "  Find Word", ":Telescope live_grep<CR>"),
				dashboard.button("e", "  File Explorer", ":NvimTreeToggle<CR>"),
				dashboard.button("q", "  Quit", ":qa<CR>"),
			},
			opts = { spacing = 1 },
		}

		local function get_session_buttons()
			local ok, resession = pcall(require, "resession")
			local items = {
				{ type = "text", val = "  Sessions", opts = { hl = "AlphaHeader", position = "center" } },
				{ type = "padding", val = 1 },
			}

			if not ok then
				table.insert(items, {
					type = "text",
					val = "  No sessions found",
					opts = { hl = "Comment", position = "center" },
				})
				return items
			end

			local sessions = resession.list()
			if not sessions or #sessions == 0 then
				table.insert(items, {
					type = "text",
					val = "  No saved sessions yet",
					opts = { hl = "Comment", position = "center" },
				})
				return items
			end

			local keys = { "1", "2", "3", "4", "5" }
			local icon = ""

			for i, session in ipairs(sessions) do
				if i > 5 then
					break
				end
				local key = keys[i]
				table.insert(
					items,
					dashboard.button(
						key,
						icon .. " " .. session,
						"<cmd>lua require('nvim-tree.api').tree.close(); require('resession').load('"
							.. session
							.. "'); vim.defer_fn(function() require('nvim-tree.api').tree.open() end, 100)<CR>"
					)
				)
			end

			return items
		end

		local sessions_section = {
			type = "group",
			val = get_session_buttons(),
			opts = { spacing = 1 },
		}

		local footer = {
			type = "text",
			val = "  nezza.nvim",
			opts = { hl = "Comment", position = "center" },
		}

		alpha.setup({
			layout = {
				{ type = "padding", val = 2 },
				header,
				{ type = "padding", val = 2 },
				buttons,
				{ type = "padding", val = 2 },
				sessions_section,
				{ type = "padding", val = 2 },
				footer,
			},
			opts = { margin = 5 },
		})
	end,
}
