return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		"windwp/nvim-autopairs",
    	config = function() require("nvim-autopairs").setup {} end
	}
	use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
  	  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    	ts_update()
    end,
  }

	use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
	use({
		"L3MON4D3/LuaSnip",
		tag = "v1.2.1",
	 	run = "make install_jsregexp"
	})
	use({
  	"folke/which-key.nvim",
	  config = function()
    	vim.o.timeout = true
    	vim.o.timeoutlen = 300
    	require("which-key").setup{
      	-- your configuration comes here
      	-- or leave it empty to use the default settings
      	-- refer to the configuration section below
    	}
  	end,
	})
	use({
  	'nvim-lualine/lualine.nvim',
  	requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})
	use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.1',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {"tiagovla/scope.nvim"}
	use {"nvim-tree/nvim-web-devicons"}
	use {"lewis6991/gitsigns.nvim"}
	use {"romgrk/barbar.nvim"}
	use {"lukas-reineke/indent-blankline.nvim"}
	use {"folke/tokyonight.nvim"}
	use {"sainnhe/edge"}
	use {"williamboman/mason.nvim"}
	use {"williamboman/mason-lspconfig.nvim"}

	use {"neovim/nvim-lspconfig"}
	use {"hrsh7th/cmp-nvim-lsp"}
	use {"hrsh7th/cmp-buffer"}
	use {"hrsh7th/cmp-cmdline"}
	use {"hrsh7th/cmp-path"}
	use {"hrsh7th/nvim-cmp"}
	use {"hrsh7th/cmp-vsnip"}
	use {"hrsh7th/vim-vsnip"}
	use {"ellisonleao/gruvbox.nvim"}
	use {"fneu/breezy"}
	use {"Shatur/neovim-ayu"}
	use {"saadparwaiz1/cmp_luasnip"}
 	use {"rafamadriz/friendly-snippets"}
	use {"tomasiser/vim-code-dark"}
	use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  	require("toggleterm").setup()
		end
	}
	use {"TamaMcGlinn/quickfixdd"}
end)

