local M = {}

M.general = {
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
	},
}

M.treesitter = {
	ensure_installed = {
		"bash",
		"css",
		"go",
		"gomod",
		"gosum",
		"html",
		"javascript",
		"json",
		"jsonc",
		"lua",
		"markdown_inline",
		"markdown",
		"python",
		"typescript",
		"vim",
		"vimdoc",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		-- disable = {
		--   "python"
		-- },
	},
}

M.mason = {
	ensure_installed = {
		-- lua
		"lua-language-server",
		"stylua",

    -- web
		"css-lsp",
		"html-lsp",
		"eslint-lsp",
		"typescript-language-server",
		"js-debug-adapter",
		"deno",
		"prettier",
		"prettierd",
    "tailwindcss",

    -- go
		"gopls",
		"golangci-lint",
		"golangci-lint-langserver",
		"goimports",
		"goimports-reviser",

    -- azure
		"azure-pipelines-language-server",

    -- bash
		"shellcheck",
		"bash-language-server",

		-- python
		"pyright",
		"flake8",
		"black",
		"debugpy",
		"mypy",
		"python-lsp-server",
		"pylint",
		"pyre",
		"autoflake",
		"python-lsp-server",

    -- c/cpp stuff
    "clangd",
    "clang-format",
	},
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.nvimcmp = {
	sources = {
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "luasnip", group_index = 2 },
		{ name = "buffer", group_index = 2 },
		{ name = "nvim_lua", group_index = 2 },
		{ name = "path", group_index = 2 },
	},
}

return M
