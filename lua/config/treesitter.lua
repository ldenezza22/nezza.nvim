require'nvim-treesitter'.setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require'nvim-treesitter'.install { 'lua', 'rust', 'javascript', 'zig', 'python', 'go' , 'c', 'jsx', 'typescript', 'tsx'}
