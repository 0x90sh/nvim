-- Ensure packer is loaded
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Load plugins using packer
require('packer').startup(function(use)
    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Tree-sitter for syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Telescope for fuzzy finding
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' }
    }


    use 'nvim-tree/nvim-web-devicons'

    use 'nvim-lualine/lualine.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'lukas-reineke/indent-blankline.nvim'

    use 'glepnir/dashboard-nvim'
    use 'morhetz/gruvbox'
    use 'folke/tokyonight.nvim'
    use 'joshdick/onedark.vim'
    use 'phaazon/hop.nvim'

    use { "catppuccin/nvim", as = "catppuccin" }
    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('nvim-tree').setup {
    view = {
        width = 40,
    },
    renderer = {
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
    },
    filters = {
        dotfiles = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
}

require('hop').setup()

require("ibl").setup {
    indent = {
        char = "┆",
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = false,
    },
}

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = require('telescope.actions').move_selection_next,
                ["<C-p>"] = require('telescope.actions').move_selection_previous,
            },
        },
    },
}

require('lualine').setup {
    options = { theme = 'gruvbox' }
}

vim.g.mapleader = " "
vim.opt.termguicolors = true
vim.cmd 'colorscheme gruvbox'
vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Keybindings for Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })

-- Keybinding for toggling Tree-sitter highlighting
vim.api.nvim_set_keymap('n', '<leader>th', ":TSBufToggle highlight<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cd', ":lua NvimTreeChangeDir()<CR>", { noremap = true, silent = true })

function NvimTreeChangeDir()
    -- Prompt for directory input
    local input = vim.fn.input("📂 Path: ")
    local path

    if input == "" then
        path = vim.fn.expand("%:p:h")
    else
        if not input:match("^/") then
            path = vim.fn.getcwd() .. "/" .. input
        else
            path = input
        end
    end

    if vim.fn.isdirectory(path) == 0 then
        print(" ❌ Invalid directory: " .. path)
        return
    end

    vim.cmd("cd " .. vim.fn.fnameescape(path))
    print(" 📂 Moved to -> " .. path)

    local api = require('nvim-tree.api')
    if api.tree.is_visible() then
        api.tree.change_root(path)
        api.tree.reload()
    else
        api.tree.open()
    end
end



vim.api.nvim_set_keymap('n', '<leader>ln', ':set number! relativenumber!<CR>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('n', '<leader>h', ":HopWord<CR>", { noremap = true, silent = true })