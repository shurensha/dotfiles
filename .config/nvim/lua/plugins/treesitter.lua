return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter.install").compilers = { "gcc-13" }
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = { "javascript", "typescript", "python", "go", "html", "php", "kotlin", "sql", "c", "vim", "vimdoc", "query", "yaml", "json", "tsx", "css"},

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                autotag = {
                    enable = true,
                    enable_close_on_slash = false,
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "false", -- set to `false` to disable one of the mappings
                        node_incremental = "<TAB>",
                        scope_incremental = "<CR>",
                        node_decremental = "<S-TAB>",
                    },
                },

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                indent = { enable = true },

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.jack = {
                install_info = {
                    url = "~/.config/nvim/parsers/tree-sitter-jack", -- local path or git repo
                    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
                    -- optional entries:
                    branch = "main", -- default branch in case of git repo if different from master
                    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
                    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
                },
                filetype = "jack", -- if filetype does not match the parser name
            }
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require'treesitter-context'.setup{
                enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 8, -- Maximum number of lines to show for a single context
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = '-',
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            }
        end,
    },
    'nvim-treesitter/playground',
}
