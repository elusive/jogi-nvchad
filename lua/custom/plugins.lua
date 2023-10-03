
local overrides = require("custom.configs.overrides")

local plugins = {

  {
    "christoomey/vim-tmux-navigator",
		lazy = false,
	},

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  ["rcarriga/nvim-dap-ui"] = {
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  ["mfussenegger/nvim-dap"] = {
    config = function()
      require "custom.configs.dap"
      require("core.utils").load_mappings("dap")
    end
  },

  ["theHamsta/nvim-dap-virtual-text"] = {
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },

  ["mhartington/formatter.nvim"] = {
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.formatter"
    end
  },

  ["mfussenegger/nvim-lint"] = {
    event = "VeryLazy",
    config = function()
      require "custom.configs.lint"
    end
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  ["olexsmir/gopher.nvim"] = {
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  ["kylechui/nvim-surround"] = {
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
}

return plugins
