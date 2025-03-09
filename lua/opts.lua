-- Set tab width to 4 spaces
vim.opt.tabstop = 4       -- Number of spaces a tab represents
vim.opt.softtabstop = 4   -- Number of spaces a tab keypress inserts
vim.opt.shiftwidth = 4    -- Number of spaces for indentation
vim.opt.expandtab = true  -- Convert tabs to spaces

-- Prevent automatic comment continuation
vim.opt.formatoptions:remove {'r', 'o'}

