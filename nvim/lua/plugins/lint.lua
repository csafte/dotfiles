return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" }, -- 파일을 읽거나 새 파일을 열 때 로드
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			python = { "pylint" },
			cpp = { "cpplint" },
			c = { "cpplint" },
			cmake = { "cmakelang" },
			sql = { "sql-formatter" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
