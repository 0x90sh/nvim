# My Neovim Configuration

This is my custom **Neovim** configuration, set up with `packer.nvim` as the plugin manager. The configuration includes UI enhancements, navigation tools, and essential plugins for a better development experience.

## 📦 Installation

To install this configuration, clone the repository and ensure `Neovim` is installed.

```sh
# Clone your Neovim configuration (replace with your actual repo if needed)
git clone https://github.com/your-username/nvim-config.git ~/.config/nvim

# Open Neovim and install plugins
nvim +PackerSync
```

## 🔧 Plugins Used

This setup utilizes **Packer** for managing plugins:

```lua
use 'wbthomason/packer.nvim' -- Plugin manager
use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting
use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
use 'nvim-lua/plenary.nvim' -- Dependency for Telescope
use 'nvim-tree/nvim-web-devicons' -- Icons
use 'nvim-lualine/lualine.nvim' -- Status line
use 'nvim-tree/nvim-tree.lua' -- File explorer
use 'lukas-reineke/indent-blankline.nvim' -- Indentation guides
use 'glepnir/dashboard-nvim' -- Startup dashboard
use 'morhetz/gruvbox' -- Gruvbox color scheme
use 'folke/tokyonight.nvim' -- Tokyonight color scheme
use 'joshdick/onedark.vim' -- One Dark color scheme
use 'phaazon/hop.nvim' -- Easy navigation
use { 'catppuccin/nvim', as = 'catppuccin' } -- Catppuccin color scheme
```

## 🎨 UI Customization

- **Status Line:** `lualine.nvim` with `gruvbox` theme
- **File Explorer:** `nvim-tree.lua` with icons enabled
- **Indentation Guides:** `indent-blankline.nvim`
- **Themes:**
  - Gruvbox (default)
  - Catppuccin
  - TokyoNight
  - One Dark

## 🔍 Keybindings

| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>fb` | List buffers (Telescope) |
| `<leader>th` | Toggle Treesitter highlighting |
| `<leader>e`  | Toggle NvimTree |
| `<leader>cd` | Change working directory |
| `<leader>ln` | Toggle line numbers |
| `<leader>h`  | Hop to word |

## 🛠 Features

- **Fast File Navigation:** `Telescope` for fuzzy finding
- **Better Code Navigation:** `Hop.nvim` for quick jumps
- **Modern UI Enhancements:** `lualine.nvim`, `nvim-tree.lua`, `dashboard-nvim`
- **Syntax Highlighting & Indentation:** `Treesitter` + `indent-blankline.nvim`
- **Multiple Color Themes:** Easy switching between themes

## 🚀 Usage

Once installed, launch Neovim:

```sh
nvim
```

Use `<leader>` as `Space` (default). Try out different keybindings to navigate efficiently.

## 📂 File Explorer Configuration

NvimTree is configured with:

- **Width:** 40
- **Icons Enabled:** Files, folders, Git status
- **Dotfiles Hidden** by default
- **Auto-close when opening a file**

Use `<leader>e` to toggle the file explorer.

## 🏗 Custom Functions

A custom function `NvimTreeChangeDir()` allows you to quickly change the working directory within Neovim.

```lua
vim.api.nvim_set_keymap('n', '<leader>cd', ":lua NvimTreeChangeDir()<CR>", { noremap = true, silent = true })
```

## 📜 License

This configuration is open-source. Feel free to modify and enhance it as needed!

---

Enjoy your **Neovim** experience! 🚀
