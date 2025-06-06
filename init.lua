-- load other sub-modules next time when you open nvim
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps
require('plug') -- Plugins

-- Setup code function folding 
vim.opt.foldmethod = "indent"   -- or "syntax" for languages like C, C++, Java, etc,.
vim.opt.foldlevelstart = 99     -- start with all folds open

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.foldmethod = "indent"
    vim.opt_local.foldlevel = 99
  end,
})

-- Setup LSP and auto-completion
local lspconfig = require('lspconfig')

-- Enable pyright for Python LSP
lspconfig.pyright.setup {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local opts = { noremap=true, silent=true }

	-- LSP keybindings
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
   	buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    	buf_set_keymap('n', '<leader>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
   	buf_set_keymap('n', '<leader>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  	end
}


