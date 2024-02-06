return {
	{'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	},
	{"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")
			configs.setup({
					ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },  
					})
		end
	},
	{"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
    		}
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			end,
		opts = {
		}
	},	
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
    		'nvim-telescope/telescope.nvim', tag = '0.1.5',
      		dependencies = { 'nvim-lua/plenary.nvim' }
    	},

	"tiagovla/scope.nvim",
	"nvim-tree/nvim-web-devicons",
	"lewis6991/gitsigns.nvim",
	"romgrk/barbar.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"folke/tokyonight.nvim",
	"sainnhe/edge",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	"neovim/nvim-lspconfig",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-path",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/vim-vsnip",
	"ellisonleao/gruvbox.nvim",
	"fneu/breezy",
	"Shatur/neovim-ayu",
	"saadparwaiz1/cmp_luasnip",
 	"rafamadriz/friendly-snippets",
	"tomasiser/vim-code-dark",
	{"petertriho/cmp-git", 
	 dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	"TamaMcGlinn/quickfixdd"
}
