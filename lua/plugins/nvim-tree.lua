return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,  -- collapse single-child folders
      },
      filters = {
        dotfiles = false,  -- set to true to hide dotfiles
      },
    })

    -- Toggle with <leader>e
    vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>", { silent = true })
  end,
}
