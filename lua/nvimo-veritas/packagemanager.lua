local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "rust", "perl" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    {"neovim/nvim-lspconfig"},
    {"github/copilot.vim"},
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
        -- here goes my colorscheme
    "nyoom-engineering/oxocarbon.nvim",
    'bignimbus/pop-punk.vim',
    'fcpg/vim-farout',
    'talha-akram/noctis.nvim',
    'projekt0n/github-nvim-theme',
    -- colorschemes end
    {'chentoast/marks.nvim'},
    -- {
    --     'mrcjkb/haskell-tools.nvim',
    --     dependencies = {
    --         'nvim-lua/plenary.nvim',
    --     },
    --     version = '^3', -- Recommended
    --     ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    -- },
    {
        'ThePrimeagen/harpoon'
    },
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',

        -- For vsnip users.
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',

        -- For luasnip users.
        -- Plug 'L3MON4D3/LuaSnip'
        -- Plug 'saadparwaiz1/cmp_luasnip'

        -- For ultisnips users.
        -- Plug 'SirVer/ultisnips'
        -- Plug 'quangnguyen30192/cmp-nvim-ultisnips'

        -- For snippy users.
        -- Plug 'dcampos/nvim-snippy'
        -- Plug 'dcampos/cmp-snippy'

    'mbbill/undotree',
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    'f-person/git-blame.nvim',
    'ziglang/zig.vim', -- https://github.com/ziglang/zig.vim
    'jbyuki/instant.nvim',
    'xiyaowong/transparent.nvim',
    -- DELETE EVERYTHING AFTER THIS
    'ThePrimeagen/vim-be-good'
})
