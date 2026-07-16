return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "horizon",
		},
		sections = {
			-- ...
			lualine_z = {
				{
					function()
						if not package.loaded["korean_ime"] then
							return ""
						end
						local mode = require("korean_ime").get_mode()
						if mode == "en" then
							return "A "
						elseif mode == "ko" then
							return "한"
						end
					end,
				},
			},
		},
	},
}
