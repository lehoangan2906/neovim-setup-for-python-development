return require('packer').startup(
    function()
    -- Packer can manage itself, this plug-in should be always kept.
    use 'wbthomason/packer.nvim'
    
    -- Github Copilot plugin
    use {
        'zbirenbaum/copilot.lua',
        config = function()
            require('copilot').setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,    -- suggestion appear as you type
                    keymap = {
                        accept = '<S-Tab>',   -- Accept suggestion with Shift + Tab
                        next = '<M-]>',     -- Next suggestion (Alt + ])
                        prev = '<M-[>',     -- Previous suggestion (Alt + [)
                        dismiss = '<C-]>',  -- Dismiss suggestion (Ctrl + ])
                    },
                },
                filetypes = {
                    python = true,  -- Enable for python
                    ['*'] = true,   -- Enable for all filetypes (adjust as needed)
                },
            })
        end,
    }


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
