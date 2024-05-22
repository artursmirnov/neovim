-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Enable auto write
opt.autowrite = false

-- Sync with system clipboard
-- opt.clipboard = "unnamedplus"
opt.clipboard = ""

-- Enable highlighting of the current line
opt.cursorline = true

-- Disable code folding
opt.foldenable = false

-- Command abbreviations
vim.cmd("ca qq qall")
vim.cmd("ca ww bd")
