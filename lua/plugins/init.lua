return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- LSP + Mason wired together in the correct load order:
  -- mason.nvim → mason-lspconfig.nvim → nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {},
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "pyright" },
        },
      },
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Auto-installs non-LSP tools (formatters, linters) via Mason
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "ruff" },
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
