return {
    {
	"folke/tokyonight.nvim",
	config = function()
	    require("tokyonight").setup({
		style = "night",
		styles = {
		    comments = { italic = true },
		    keywords = { italic = true },
		    functions = {},
		    variables = {},
		}
	    ,
	    --[[on_highlights = function(highlights, colors)
		highlights["@function"] = { fg = colors.blue }
		highlights["@function.call"] = { fg = colors.blue }
		highlights["@variable"] = { fg = colors.fg }
		highlights["@variable.parameter"] = { fg = colors.yellow }
		highlights["@variable.member"] = { fg = colors.green }
		highlights["@variable.builtin"] = { fg = colors.red, italic = true }
		highlights["@constant"] = { fg = colors.orange }
	    end,]]--
	})
	    vim.cmd.colorscheme("tokyonight-night")
	end
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {
	    theme = "tokyonight",
	}
    }
}

