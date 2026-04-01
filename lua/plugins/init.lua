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
  -- enable copilot
  {
    "github/copilot.vim",
    lazy = false,
    init = function()
      -- Disable the default <Tab> mapping
      vim.g.copilot_no_tab_map = true
      -- Start disabled by default
      vim.g.copilot_enabled = false
    end,
    config = function()
      -- Accept All: <C-y>
      -- We use a Vim expression to call the plugin's internal accept function
      vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      -- Accept next word: <M-j> (Option+j)
      vim.keymap.set('i', '<M-j>', 'copilot#AcceptWord()', {
        expr = true,
        replace_keycodes = false,
      })
    end,
  },
}
