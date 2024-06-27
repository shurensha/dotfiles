return {
	-- {
	-- 	"namrabtw/rusty.nvim",
	-- 	version = false,
	-- 	lazy = false,
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		vim.cmd([[colorscheme rusty]])
	-- 	end,
	-- },
	{
		"HoNamDuong/hybrid.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- Default options:
			require("hybrid").setup({
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = false,
					emphasis = true,
					comments = true,
					folds = true,
				},
				strikethrough = true,
				inverse = true,
				transparent = false,
				overrides = function(hl, c)
					local background = "#000000"
					c.bg = background
					hl.TelescopeNormal = {
						fg = c.fg,
						bg = background,
					}
					hl.TelescopeBorder = {
						fg = c.fg_hard,
						bg = c.bg,
					}
					hl.TelescopeTitle = {
						fg = c.fg_hard,
						bg = c.bg,
						bold = true,
					}
				end,
			})
			vim.cmd.colorscheme("hybrid")
			vim.api.nvim_set_hl(0, "Normal", { bg = "black" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "black" })
			vim.api.nvim_set_hl(0, "@markup.heading", { bold = true })
			vim.api.nvim_set_hl(0, "@markup.raw.block", { fg = nil })
		end,
	},
}
