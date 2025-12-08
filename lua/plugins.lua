return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{ "folke/noice.nvim", lazy = true },
	{ "lewis6991/gitsigns.nvim", lazy = true },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = true,
	},
	{ "nvim-tree/nvim-tree.lua", config = true },
	{ "akinsho/bufferline.nvim", version = "*", config = true, dependencies = "nvim-tree/nvim-web-devicons" },
	{ "rcarriga/nvim-notify" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = true,
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"LintaoAmons/cd-project.nvim",
	},
}
