# Neovim Setup for Python Development

## Introduction
This guide walks you through setting up Neovim for Python development, including LSP configuration, auto-completion, and additional settings like tab width and comment behavior.

---

## 1. Install Neovim and Dependencies
Ensure you have Neovim installed. If not, install it using:

```bash
brew install neovim     # macOS
sudo apt install neovim # Ubuntu/Debian
```
### Plugin Management with Packer 
Install `Packer` by cloning its repository:

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Install Python Language Server
Neovim requires an LSP (Language Server Protocol) for Python. Install `pyright` using npm:

```bash
npm install -g pyright
```
Alternatively, install `python-lsp-server` using pip:
```bash
pip3 install python-lsp-server
```

---

## 2. Configure Neovim
### Folder Structure
Ensure your Neovim configuration directory (`~/.config/nvim/`) has the following structure:

```text
~/.config/nvim/
├── init.lua
└── lua/
    ├── keys.lua
    ├── opts.lua
    ├── plug.lua
    ├── vars.lua 
```

### `init.lua` configuration
Modify your `~/.config/nvim/init.lua` file:

```lua
-- load other sub-modules next time when you open nvim
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps
require('plug') -- Plugins

-- Setup LSP and auto-completion
local lspconfig = require('lspconfig')
local cmp = require('cmp')

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


-- Setup Auto-completion
cmp.setup({
    snippet = {
	expand = function(args)
            require('luasnip').lsp_expand(args.body) -- Use LuaSnip for snippets
	end,
    },

    mapping = {
	['<C-b>'] = cmp.mapping.scroll_docs(-4),
	['<C-f>'] = cmp.mapping.scroll_docs(4),
	['<C-Space>'] = cmp.mapping.complete(),
	['<C-e>'] = cmp.mapping.abort(),
	['<CR>'] = cmp.mapping.confirm({select = true}),
    },

    sources = cmp.config.sources({
	{name = 'nvim_lsp'},
	{name = 'luasnip'},
	}, {
	{name = 'buffer'},
    })
})
```

---
## 3. Install Plugins
Modify `~/.config/nvim/lua/plug.lua:
```lua
return require('packer').startup(
    function()
    -- Packer can manage itself, this plug-in should be always kept.
    use 'wbthomason/packer.nvim'
    
    -- LSP Configurations
    use 'neovim/nvim-lspconfig'           -- Collection of configurations for built-inLSP client

    -- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'                -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'              -- Buffer completions

    -- Snippet engine and snippet collection
    use 'L3MON4D3/LuaSnip'                -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip'        -- Snippets source for nvim-cmp
    use 'rafamadriz/friendly-snippets'    -- Abunch of snippets to use
    end)
```

Reload Neovim and install Plugins
    - Open Neovim: `nvim`
    - Install plugins `:PackerInstall`

---
## 4. Fix Indentation and Comment behavior
Modify `~/.config/nvim/lua/opts.lua`:
```lua
-- Set tab width to 4 spaces
vim.opt.tabstop = 4       -- Number of spaces a tab represents
vim.opt.softtabstop = 4   -- Number of spaces a tab keypress inserts
vim.opt.shiftwidth = 4    -- Number of spaces for indentation
vim.opt.expandtab = true  -- Convert tabs to spaces

-- Prevent automatic comment continuation
vim.opt.formatoptions:remove {'r', 'o'}
```

--
## 5. Enable code folding (collapse)
This feature alows you to collapse (fold) and expand functions or blocks of code, similar to the toggle list feature in VSCode.

Modify `~/.config/nvim/init.lua` to include the following:

```lua
vim.opt.foldmethod = "syntax"   -- or "indent"
vim.opt.foldlevelstart = 99     -- start with all folds open
```

- Notes:
    - `syntax` works well for languages like C, JavaScript, or Rust with clear block delimiters (`{}`).
    - `indent` is better for Python, where indentation defines blocks.
    - `:set foldmethod=syntax` or `:set foldmethod=indent` in an open file to test it immediately.

Once folding is enabled, you can toggle folds with these commands:
    - `zc`: Collapse (close) the fold at the cursor (e.g., a function).
    - `zo`: Open the fold at the cursor.
    - `za`: Toggle the fold (open if closed, close if open).
    - `zM`: Close all folds in the file.
    - `zR`: Open all folds in the file.
