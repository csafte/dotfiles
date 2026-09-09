return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			--cmake = { "cmake-format" },
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			cmake = { "cmakelang" },
			typst = { "typstyle" },
			sql = { "sqruff" },
			markdown = { "prettierd", "prettier", stop_after_first = true },
		},
		formatters = {
			isort = {
				args = { "--stdout", "--filename", "$FILENAME", "-" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
