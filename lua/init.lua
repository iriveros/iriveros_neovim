-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd[[set number]]
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd[[colorscheme edge]]

require("config/tree_sitter")
require("config/keymap")
require("config/lualine")
require("config/lsp_config")
require("config/neo_tree")
require("config/nvim-cmp")
require("config/tree_sitter")
require("config.toggle_term")
require("config.telescope")
require("scope").setup()

require("bufferline").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer", "bashls", "clangd" }
})

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}
