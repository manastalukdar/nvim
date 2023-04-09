--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ","
vim.g.localleader = "\\"

require("settings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
 vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "--single-branch",
  "https://github.com/folke/lazy.nvim.git",
  lazypath,
 })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
 defaults = { lazy = true },
 install = { colorscheme = { "tokyonight" } },
 checker = { enabled = true },
 performance = {
  rtp = {
   disabled_plugins = {
    "gzip",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
   },
  },
 },
 -- debug = true,
})

vim.api.nvim_create_autocmd("User", {
 pattern = "VeryLazy",
 callback = function()
  require("keymaps")
  require("commands")
 end,
})