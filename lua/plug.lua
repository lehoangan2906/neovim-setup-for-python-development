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
