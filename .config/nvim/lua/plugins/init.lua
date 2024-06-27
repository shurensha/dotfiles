return {
	-- File Navigation
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- Editor
	"tpope/vim-surround",
	"windwp/nvim-ts-autotag",
	--  "github/copilot.vim"
	--  'm4xshen/autoclose.nvim'

	-- LSP and Parsing
	{ "folke/neodev.nvim", opts = {} },

	-- Appearance
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	"nvim-tree/nvim-web-devicons",

	-- Git

	-- Misc
	"weirongxu/plantuml-previewer.vim",
	"tyru/open-browser.vim",
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	},

	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {
						config = {
							icon_preset = "basic",
							icons = {
								delimiter = {
									horizontal_line = {
										highlight = "@neorg.delimiters.horizontal_line",
									},
								},
								code_block = {
									-- If true will only dim the content of the code block (without the
									-- `@code` and `@end` lines), not the entirety of the code block itself.
									content_only = false,

									-- The width to use for code block backgrounds.
									--
									-- When set to `fullwidth` (the default), will create a background
									-- that spans the width of the buffer.
									--
									-- When set to `content`, will only span as far as the longest line
									-- within the code block.
									width = "content",

									-- Additional padding to apply to either the left or the right. Making
									-- these values negative is considered undefined behaviour (it is
									-- likely to work, but it's not officially supported).
									padding = {
										right = 2,
									},

									-- If `true` will conceal (hide) the `@code` and `@end` portion of the code
									-- block.
									conceal = false,

									nodes = { "ranged_verbatim_tag" },
									highlight = "CursorLine",
									insert_enabled = true,
								},
							},
						},
					},
					-- ["core.latex.renderer"] = { disabling as nvim 0.10.0 is still not stable
					--     config = {
					--         render_on_enter = true,
					--     }
					-- }, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/Documents/notes",
							},
							default_workspace = "notes",
						},
					},
				},
			})
		end,
	},

	-- Debugger
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/cmp-dap" },
	{ "mxsdev/nvim-dap-vscode-js", dependencies = { "mfussenegger/nvim-dap" } },
	{
		"microsoft/vscode-js-debug",
		lazy = true,
		build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	},

	{
        "melbaldove/llm.nvim",
		dependencies = { "nvim-neotest/nvim-nio" },
		config = function()
			require("llm").setup({
				system_prompt = [[
You are an AI programming assistant integrated into a code editor. Your purpose is to help the user with programming tasks as they write code.
Conversation style:
- Don't worry about formalities.

- Please be as terse as possible while still conveying substantially all information relevant to any question.

- If content policy prevents you from generating an image or otherwise responding, be explicit about what policy was violated and why.

- If your neutrality policy prevents you from having an opinion, pretend for the sake of your response to be responding as if you shared opinions that might be typical of a twitter user

- write all responses in lowercase letters ONLY, except where you mean to emphasize, in which case the emphasized word should be all caps. Initial Letter Capitalization can and should be used to express sarcasm, or disrespect for a given capitalized noun.

- you are encouraged to occasionally use obscure words or make subtle puns. don't point them out, I'll know. drop lots of abbreviations like "rn" and "bc." use "afaict" and "idk" regularly, wherever they might be appropriate given your level of understanding and your interest in actually answering the question. be critical of the quality of your information

- if you find any request irritating respond dismisively like "be real" or "that's crazy man" or "lol no"

- take however smart you're acting right now and write in the same style but as if you were +2sd smarter

- use late millenial slang not boomer slang. mix in zoomer slang in tonally-inappropriate circumstances occasionally
Key capabilities:
- Thoroughly analyze the user's code and provide insightful suggestions for improvements related to best practices, performance, readability, and maintainability. Explain your reasoning.
- Answer coding questions in detail, using examples from the user's own code when relevant. Break down complex topics step- Spot potential bugs and logical errors. Alert the user and suggest fixes.
- Upon request, add helpful comments explaining complex or unclear code.
- Suggest relevant documentation, StackOverflow answers, and other resources related to the user's code and questions.
- Engage in back-and-forth conversations to understand the user's intent and provide the most helpful information.
- Keep concise and use markdown.
- When asked to create code, only generate the code. No bugs.
- When presented with a math problem, logic problem, or other problem benefiting from systematic thinking, think through it step by step before giving your final answer
]],
			})
			vim.keymap.set("n", "<leader>m", function()
				require("llm").create_llm_md()
			end)
			vim.keymap.set("n", "<leader>,", function()
				require("llm").prompt({ replace = false, service = "groq" })
			end)
			vim.keymap.set("n", "<leader>g,", function()
				require("llm").prompt({ replace = false, service = "anthropic" })
			end)
			vim.keymap.set("v", "<leader>,", function()
				require("llm").prompt({ replace = false, service = "groq" })
			end)
			vim.keymap.set("v", "<leader>g,", function()
				require("llm").prompt({ replace = false, service = "anthropic" })
			end)

			vim.keymap.set("v", "<leader>.", function()
				require("llm").prompt({ replace = true, service = "groq" })
			end)

			vim.keymap.set("v", "<leader>g.", function()
				require("llm").prompt({ replace = true, service = "anthropic" })
			end)
			vim.keymap.set("n", "g,", function()
				require("llm").prompt_operatorfunc({ replace = false, service = "groq" })
			end)
			vim.keymap.set("n", "g.", function()
				require("llm").prompt_operatorfunc({ replace = true, service = "groq" })
			end)
		end,
	},
	{
		dir = "~/tweet.nvim",
		name = "tweet.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			vim.keymap.set("n", "<leader>m", function()
				require("llm").create_llm_md()
			end)
			vim.keymap.set("n", "<leader>,", function()
				require("llm").prompt({ replace = false, service = "groq" })
			end)
			vim.keymap.set("n", "<leader>g,", function()
				require("llm").prompt({ replace = false, service = "anthropic" })
			end)
			vim.keymap.set("v", "<leader>tw", function()
				require("tweet").send_tweet()
			end)
		end,
	},
}
