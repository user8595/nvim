return {
  { "catppuccin/nvim",             name = "catppuccin", priority = 1000 },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "stevearc/dressing.nvim",      event = "VeryLazy" },
  { "folke/noice.nvim",            lazy = true },
  { "lewis6991/gitsigns.nvim",     lazy = true },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = {
      options = {
        globalstatus = true
      }
    }
  },
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  { "nvim-tree/nvim-tree.lua", config = true },
  { "akinsho/bufferline.nvim", version = "*", config = true, dependencies = "nvim-tree/nvim-web-devicons" },
  {
    "rcarriga/nvim-notify",
    config = {
      render = "wrapped-compact"
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      open_mapping = "<C-`>",
      direction = 'float',
      autochdir = false,
      -- start_in_insert = true,
      shell = vim.o.shell,
    }
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = true,
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
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "folke/trouble.nvim",
    config = true,
    cmd = "Trouble",
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {},
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
}
