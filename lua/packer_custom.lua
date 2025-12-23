local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') ..
                             '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git', 'clone', '--depth', '1',
            'https://github.com/wbthomason/packer.nvim', install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    use 'christoomey/vim-tmux-navigator'
    use 'flazz/vim-colorschemes'
    use 'SirVer/Ultisnips'
    use 'honza/vim-snippets'
    use 'quangnguyen30192/cmp-nvim-ultisnips'
    use 'EvanQuan/vim-executioner'

    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- Mason for LSP server management
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'}
        }
    }

    use {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim'
        }
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }

    if packer_bootstrap then require('packer').sync() end
end)
