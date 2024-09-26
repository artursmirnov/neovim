-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Delete default keymaps

local noop = function() end

-- bufferline.nvim
vim.keymap.set("n", "<S-h>", noop)
vim.keymap.set("n", "<S-l>", noop)

-- Add any additional keymaps here

-- Easier commands
vim.keymap.set("n", ";", ":", { desc = "Enter command mode", nowait = true })

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"*y', { desc = "Copy to system clipboard" })

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"*y', { desc = "Copy to system clipboard" })

-- Buffers
vim.keymap.set("n", "<C-c>", "<cmd>close<cr>", { desc = "Close split" })
