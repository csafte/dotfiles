---@diagnostic disable: undefined-global
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<C-h>", "<C-w>h", { desc = "left" })
map("n", "<C-j>", "<C-w>j", { desc = "under" })
map("n", "<C-k>", "<C-w>k", { desc = "up" })
map("n", "<C-l>", "<C-w>l", { desc = "right" })

map("n", "<leader>ff", "<cmd> Telescope find_files <cr>", { desc = "Telescope find files" })
map("n", "<leader>fg", "<cmd> Telescope live_grep<cr>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd> Telescope buffers<cr>", { desc = "Telescope buffers" })
map("n", "<leader>fh", "<cmd> Telescope help_tags<cr>", { desc = "Telescope help tags" })

map("i", "<F9>", function()
	require("korean_ime").convert_hanja()
end, { noremap = true, silent = true, desc = "한자" })
map({ "i", "n", "v", "x", "s" }, "<F12>", function()
	require("korean_ime").change_mode()
end, { desc = "한/영 전환" })

map("n", "K", vim.lsp.buf.hover, { desc = "함수/변수 설명 보기" })
map("n", "gd", vim.lsp.buf.definition, { desc = "정의로 이동" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "이름 한 번에 바꾸기" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "코드 제안 보기" })

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range" })
