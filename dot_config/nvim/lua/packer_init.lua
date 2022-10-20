-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
	vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end
packer.init({
	compile_on_sync = true,
	display = {
		open_fn = require('packer.util').float
	}
})


local use = packer.use
-- Add you plugins here:
use 'wbthomason/packer.nvim' -- packer can manage itself



-- Speed up Nvim startup
use 'lewis6991/impatient.nvim'

-- Indent line
use {
	'lukas-reineke/indent-blankline.nvim',
	after = 'nvim-treesitter'
}

-- Comments
use {
	'numToStr/Comment.nvim',
	config = function()
		require('Comment').setup()
	end,
	event = 'BufWinEnter'
}

-- Autopair
use {
	'windwp/nvim-autopairs',
	config = function()
		require('nvim-autopairs').setup()
	end
}

use {
	'RRethy/nvim-treesitter-endwise'
}

-- Icons
use {
	'kyazdani42/nvim-web-devicons'
}

-- Tag viewer
use {
	'preservim/tagbar',
	module = 'tagbar'
}

-- Treesitter interface
use {
	'nvim-treesitter/nvim-treesitter',
	run = ":TSUpdate"
	-- opt = true
}

-- Color schemes
use "luisiacc/gruvbox-baby"

-- Additional syntax highlighting
use "slim-template/vim-slim"
-- LSP
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use "jose-elias-alvarez/null-ls.nvim"
use "jayp0521/mason-null-ls.nvim"
use {
	'neovim/nvim-lspconfig',
	after = { "impatient.nvim" }
	-- opt = true
}

use {
	'hrsh7th/cmp-nvim-lsp',
	after = { "nvim-lspconfig" }
}

-- Autocomplete
use {
	'hrsh7th/nvim-cmp',
	requires = {
		'L3MON4D3/LuaSnip',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-buffer',
		'saadparwaiz1/cmp_luasnip',
	},
	event = 'InsertEnter',
	module = 'cmp'
}

use 'onsails/lspkind.nvim'


-- Statusline
use {
	'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	-- opt = true
}

-- going to files, reusing existing splits
use 'ELLIOTTCABLE/vim-gfriend'

-- buffer management
use 'kazhala/close-buffers.nvim'

-- git labels
use {
	'lewis6991/gitsigns.nvim',
	requires = { 'nvim-lua/plenary.nvim' },
	event = 'BufWinEnter',
	config = function()
		require('gitsigns').setup()
	end,
	-- opt = true
}

-- magit
use 'tpope/vim-fugitive'
-- Code Style
use 'tpope/vim-sleuth'
use 'tpope/vim-rails'
use 'tpope/vim-rake'
use 'tpope/vim-bundler'
use 'tpope/vim-projectionist'
use 'tpope/vim-endwise'


-- tree
use {
	'kyazdani42/nvim-tree.lua',
	requires = {
		'kyazdani42/nvim-web-devicons'
	},
	tag = 'nightly'
}

-- prettier keymaps
use 'folke/which-key.nvim'

-- fuzzy find all the things
use {
	'nvim-telescope/telescope-fzf-native.nvim',
	run = 'make'
}

use { 'nvim-telescope/telescope-file-browser.nvim' }

use {
	'nvim-telescope/telescope.nvim',
	requires = { { 'nvim-lua/plenary.nvim' } },
	-- opt = true
}

use 'kylechui/nvim-surround'
use 'vim-test/vim-test'


-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if Packer_bootstrap then
	require('packer').sync()
end
