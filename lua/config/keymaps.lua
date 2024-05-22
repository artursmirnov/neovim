-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Easier commands
vim.keymap.set("n", ";", ":", { desc = "Enter command mode", nowait = true })

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"*y', { desc = "Copy to system clipboard" })

-- Copy to system clipboard
vim.keymap.set("v", "<leader>y", '"*y', { desc = "Copy to system clipboard" })

-- Buffers
vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close current buffer" })
vim.keymap.set("n", "<C-x>", "<cmd>bd<cr>", { desc = "Close current buffer" })
vim.keymap.set("n", "<C-c>", "<cmd>close<cr>", { desc = "Close split" })
