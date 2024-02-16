vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.tabstop = 4               -- TAB character looks like 4 spaces
vim.o.expandtab = true          -- Insert spaces instead of TAB characters
vim.o.softtabstop = 4           -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4            -- Number of spaces inserted when indenting

vim.o.splitbelow = true         -- Put new horizontal split window below
vim.o.splitright = true         -- Put new vertical split window below

vim.wo.number = true            -- Show current line number
vim.wo.rnu = true               -- Show relative line numbers

vim.o.termguicolors = true      -- Use 24bit colors
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim.

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
