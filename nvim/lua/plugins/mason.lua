return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				-- lsp
				"lua_ls", -- for Lua
				"clangd", -- for C & C++
				"pyright", -- for Python
				"ts_ls", -- for JS & TS
				"html", -- for Html
				"cssls", -- for Css
				"neocmake", -- for Cmake
				"autohotkey_lsp", -- for AHK
				"tinymist", -- for Typst
				"powershell_es", -- for Powershell
				"yamlls", -- for Yaml
				"sqlls", -- for Sql
			},
			automatic_enable = true,
		},
	},
	{
		"owallb/mason-auto-install.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			packages = {
				--formatter
				"black", -- for Python
				"isort", -- for Python
				"stylua", -- for Lua
				"clang-format", -- for C & C++
				"prettierd", -- for JS & TS / Yaml
				"prettier", -- for JS & TS / Yaml
				"typstyle", -- for Typst
				"sqruff", -- for Sql
				-- linter
				"eslint_d", -- for JS & TS
				"pylint", -- for Python
				"cpplint", -- for C & C++
				"sql-formatter", -- for Sql
				-- Formatter, linter
				"cmakelang", -- for Cmake
			},
		},
	},
}
