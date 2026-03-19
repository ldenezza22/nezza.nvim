return {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = function()
	require("mason").setup()

	local registry = require("mason-registry")
	local ensure_installed = {
	    -- LSPs
	    "basedpyright",
	    "lua-language-server",
	    "rust-analyzer",
	    -- DAPs
	    "debugpy",
	    "codelldb",
	}

	registry.refresh(
	    function()
		for _, name in ipairs(ensure_installed) do
		    local pkg = registry.get_package(name)
		    if not pkg:is_installed() then
			pkg:install()
		    end
		end
	    end
	)
    end,
}
