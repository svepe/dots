vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.tabstop = 4       -- TAB character looks like 4 spaces
vim.o.expandtab = true  -- Insert spaces instead of TAB characters
vim.o.softtabstop = 4   -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4    -- Number of spaces inserted when indenting

-- Make sure new window is focused (i.e. put new window in the split location)
vim.o.splitbelow = true
vim.o.splitright = true

vim.wo.number = true    -- Show current line number
vim.wo.rnu = true       -- Show relative line numbers

vim.o.termguicolors = true -- Use 24bit colors
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.

-- vim.o.hlsearch = false  -- Set highlight on search
-- <CR> :noh<CR><CR>
vim.keymap.set("n", "<CR>", vim.cmd("noh"), { desc="Remove search highlight" })
