-- Mapeando F5 para compilar códigos C ou C++ {{{
vim.cmd([[
  augroup c_cpp_compile
    autocmd!
    autocmd FileType c,cpp nnoremap <F5> :lua if vim.fn.expand("%:e") == "c" then vim.cmd("!gcc -o %:r %") elseif vim.fn.expand("%:e") == "cpp" then vim.cmd("!g++ -o %:r %") end<CR>
  augroup END
]])

--}}}

-- MakeFile compile {{{
-- vim.cmd([[
-- " Configure o Makefile como o seu construtor padrão
-- set makeprg=make\ -s

-- function! CompileWithMake()
--   " Execute o comando make usando o AsyncRun sem exibir saída no console
--   silent AsyncRun -mode=2 -project -raw make > /dev/null 2>&1

-- endfunction

-- " Chame a função ao salvar um arquivo .cpp
-- autocmd BufWritePost *.cpp call CompileWithMake()
-- ]])

--}}}

-- Emmet {{{
local emmet_options = {
  capabilities = capabilities,
  filetypes = {
    "html",
    "typescript",
    -- "javascript",
    "javascriptreact",
    "xml",
  },
  root_dir = function()
    return vim.loop.cwd()
  end
}
require("lvim.lsp.manager").setup("emmet_ls", emmet_options)
-- }}}

-- Plugins {{{
lvim.plugins = {
  {
    "iamcco/markdown-preview.nvim",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    cmd = {
      "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle"
    },
    event = "BufRead",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  --  {
  --    "lunarvim/Onedarker.nvim"
  --  },
  --
  --  {
  --    "catppuccin/nvim",
  --    as = "catppuccin",
  --    config = function()
  --      require("catppuccin").setup({
  --        flavour = "macchiato", -- latte, frappe, macchiato, mocha
  --        background = {         -- :h background
  --          light = "latte",
  --          dark = "mocha",
  --        },
  --        transparent_background = false, -- disables setting the background color.
  --        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
  --        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  --        dim_inactive = {
  --          enabled = false,              -- dims the background color of inactive window
  --          shade = "dark",
  --          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
  --        },
  --        no_italic = false,              -- Force no italic
  --        no_bold = false,                -- Force no bold
  --        no_underline = false,           -- Force no underline
  --        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
  --          comments = { "italic" },      -- Change the style of comments
  --          conditionals = { "italic" },
  --          loops = {},
  --          functions = {},
  --          keywords = {},
  --          strings = {},
  --          variables = {},
  --          numbers = {},
  --          booleans = {},
  --          properties = {},
  --          types = {},
  --          operators = {},
  --        },
  --        highlight_overrides = {
  --          mocha = function(mocha)
  --            return {
  --              NvimTreeNormal = { bg = mocha.none },
  --            }
  --          end,
  --        },
  --        custom_highlights = {},
  --        integrations = {
  --          cmp = true,
  --          gitsigns = true,
  --          nvimtree = true,
  --          treesitter = true,
  --          notify = false,
  --          mini = false,
  --          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  --        },
  --      })
  --    end,
  --  },
  --
  --  {
  --    "rebelot/kanagawa.nvim",
  --    -- Default options:
  --    config = function()
  --      require('kanagawa').setup({
  --        compile = false,  -- enable compiling the colorscheme
  --        undercurl = true, -- enable undercurls
  --        commentStyle = { italic = true },
  --        functionStyle = {},
  --        keywordStyle = { italic = true },
  --        statementStyle = { bold = true },
  --        typeStyle = {},
  --        transparent = false,    -- do not set background color
  --        dimInactive = false,    -- dim inactive window `:h hl-NormalNC`
  --        terminalColors = false, -- define vim.g.terminal_color_{0,17}
  --        colors = {              -- add/modify theme and palette colors
  --          palette = {},
  --          theme = {
  --            wave = {},
  --            lotus = {},
  --            dragon = {},
  --            all = {
  --              ui = {
  --                bg_gutter = "none"
  --              }
  --            }
  --          },
  --        },
  --        overrides = function(colors) -- add/modify highlights
  --          return {}
  --        end,
  --        theme = "dragon",  -- Load "wave" theme when 'background' option is not set
  --        background = {     -- map the value of 'background' option to a theme
  --          dark = "dragon", -- try "dragon" !
  --          light = "lotus"
  --        },
  --      })
  --    end,
  --  },
  --
  --  {
  --    "nyoom-engineering/oxocarbon.nvim"
  --  },
  --
  --  {
  --    { 'kristijanhusak/orgmode.nvim' }
  --  },
  --
  --  {
  --    'akinsho/org-bullets.nvim',
  --    config = function()
  --      require('org-bullets').setup()
  --    end,
  --  },
  {
    "ziontee113/color-picker.nvim",
    config = function()
      require("color-picker")
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup({ "css", "html", "javascript", "*" },
        {
          RGB      = true,         -- #RGB hex codes
          RRGGBB   = true,         -- #RRGGBB hex codes
          names    = false,        -- "Name" codes like Blue
          RRGGBBAA = false,        -- #RRGGBBAA hex codes
          rgb_fn   = false,        -- CSS rgb() and rgba() functions
          hsl_fn   = false,        -- CSS hsl() and hsla() functions
          css      = false,        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn   = false,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes: foreground, background
          mode     = 'background', -- Set the display mode.
        })
    end,
  },

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      {
        signs = true,      -- show icons in the signs column
        sign_priority = 8, -- sign priority
        -- keywords recognized as todo comments
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
        gui_style = {
          fg = "NONE",         -- The gui style to use for the fg highlight group.
          bg = "BOLD",         -- The gui style to use for the bg highlight group.
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        -- highlighting of the line containing the todo comment
        -- * before: highlights before the keyword (typically comment characters)
        -- * keyword: highlights of the keyword
        -- * after: highlights after the keyword (todo text)
        highlight = {
          multiline = true,                -- enable multine todo comments
          multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
          multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
          before = "",                     -- "fg" or "bg" or empty
          keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
          after = "fg",                    -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
          comments_only = true,            -- uses treesitter to match keywords in comments only
          max_line_len = 400,              -- ignore lines longer than this
          exclude = {},                    -- list of file types to exclude highlighting
        },
        -- list of named colors where we try to extract the guifg from the
        -- list of highlight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
          info = { "DiagnosticInfo", "#2563EB" },
          hint = { "DiagnosticHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
          test = { "Identifier", "#FF00FF" }
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          -- regex that will be used to match keywords.
          -- don't replace the (KEYWORDS) placeholder
          pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        }
      }
    }
  },

  --  {
  --    'rcarriga/nvim-notify'
  --  },
  --
  --  -- {
  --  --   'mg979/vim-visual-multi' // Multiline Don't need. :D
  --  -- },
  --  -- {
  --  --   "stefanlogue/hydrate.nvim",
  --  --   -- This installs the latest stable release.
  --  --   -- Set to false or omit to install the latest development version
  --  --   version = "*",
  --  --   opts = {
  --  --     -- See below for config options
  --  --     -- The interval between notifications in minutes
  --  --     minute_interval = 25,
  --
  --  --     -- The render style for notifications
  --  --     -- Accepted values are "default", "minimal", "simple" or "compact"
  --  --     render_style = "compact",
  --
  --  --     -- Loads time of last drink on startup
  --  --     -- Useful if you don't have long-running neovim instances
  --  --     -- or if you tend to have multiple instances running at a time
  --  --     persist_timer = false
  --  --   }
  --  -- },
  --  -- UFO folding
  --
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
          { text = { "%s" },                  click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      })
    end,
  },

  --  -- {
  --  --   "kevinhwang91/nvim-ufo",
  --  --   dependencies = {
  --  --     "kevinhwang91/promise-async",
  --  --     {
  --  --       "luukvbaal/statuscol.nvim",
  --  --       config = function()
  --  --         local builtin = require("statuscol.builtin")
  --  --         require("statuscol").setup({
  --  --           relculright = true,
  --  --           segments = {
  --  --             { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
  --  --             { text = { "%s" },                  click = "v:lua.ScSa" },
  --  --             { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
  --  --           },
  --  --         })
  --  --       end,
  --  --     },
  --  --   },
  --  --   event = "BufReadPost",
  --  --   opts = {
  --  --     -- provider_selector = function()
  --  --     --   return { "treesitter", "indent" }
  --  --     -- end,
  --  --   },
  --
  --  --   init = function()
  --  --     vim.keymap.set("n", "zR", function()
  --  --       require("ufo").openAllFolds()
  --  --     end)
  --  --     vim.keymap.set("n", "zM", function()
  --  --       require("ufo").closeAllFolds()
  --  --     end)
  --  --   end,
  --  -- },
  --  -- Folding preview, by default h and l keys are used.
  --  -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
  --  -- On second press the preview will be closed and fold will be opened.
  --  -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
  --  -- { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              folds = false,
              -- icon_preset = "varied",
              icons = {
                delimiter = {
                  horizontal_line = {
                    -- highlight = "@neorg.delimiters.horizontal_line",
                  },
                },
                code_block = {
                  -- -- If true will only dim the content of the code block (without the
                  -- -- `@code` and `@end` lines), not the entirety of the code block itself.
                  -- content_only = true,

                  -- -- If `true` will conceal (hide) the `@code` and `@end` portion of the code
                  -- -- block.
                  -- conceal = true,

                  -- -- nodes = { "ranged_verbatim_tag" },
                  -- -- highlight = "CursorLine",
                  -- -- render = module.public.icon_renderers.render_code_block,
                  -- -- insert_enabled = true,
                },
              },
            },
          },                  -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },

  {
    'skywind3000/asyncrun.vim'
  },

}
-- }}}

-- Vim Fold {{{
-- Alterar o tema do folding:
-- /home/yank/.local/share/lunarvim/site/pack/lazy/opt/lunar.nvim/lua/lunar/theme.lua
--
-- Lembrar dos Folds

-- vim.cmd(
--   [[
-- augroup remember_folds
--   autocmd!
--   autocmd BufWinLeave *.* mkview
--   autocmd BufWinEnter *.* silent! loadview
-- augroup END
-- ]]
-- )

-- Ocultar os --
-- vim.cmd(
--   [[
-- set fillchars=fold:\
-- ]]
-- )

-- vim.cmd('set foldmethod=manual')

-- Defina um foldtext personalizado para ocultar '--, #, //' nas linhas dobradas
vim.cmd([[
  " function! FoldFilter(text)
  "   " Remova '#', '//' e '--' com espaços em branco no início das linhas dobradas
  "   return substitute(a:text, '^\s*\(#\|\/\/\|--\)\s*', '', '')
  " endfunction

  " function! FoldText()
  "   let folded_text = getline(v:foldstart)
  "   return FoldFilter(folded_text)
  " endfunction

  " set foldtext=FoldText()

function! FoldFilter(text)
  "   " Remova '#', '//' e '--' com espaços em branco no início das linhas dobradas
    let filtered_text = substitute(a:text, '^\s*\(#\|\/\/\|--\)\s*', '', '')
    " Remova os marcadores de folding visíveis
    return substitute(filtered_text, '{{{', '', 'g')
  " " }}}

" Remova '#', '//' e '--' com espaços em branco no início das linhas dobradas
  "   let filtered_text = substitute(a:text, '^\(\s*\)\(#\|\/\/\|--\)\s*', '\1', '')
  "   " Remova os marcadores de folding visíveis
  "   return substitute(filtered_text, '{{{', '', 'g')
  " " }}}
endfunction

function! FoldText()
    let folded_text = getline(v:foldstart)
    return FoldFilter(folded_text)
endfunction

set foldtext=FoldText()

]]
)

-- UFO folding
-- vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
-- vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "1"

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  eob = " ",
}

vim.opt.foldmethod = "marker"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- }}}

-- Org mode {{{
lvim.builtin.orgmode = { active = true }
-- Ative o plugin org-bullets
lvim.builtin.orgmode.org_bullets = true

-- color picker
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)

-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandRGB<cr>", opts)
-- vim.keymap.set("n", "your_keymap", "<cmd>ConvertHEXandHSL<cr>", opts)

-- require("color-picker").setup({ -- for changing icons & mappings
--   -- ["icons"] = { "ﱢ", "" },
--   -- ["icons"] = { "ﮊ", "" },
--   -- ["icons"] = { "", "ﰕ" },
--   -- ["icons"] = { "", "" },
--   -- ["icons"] = { "", "" },
--   ["icons"] = { "ﰕ", "ﰕ" },
--   ["border"] = "none", -- none | single | double | rounded | solid | shadow
--   ["keymap"] = {       -- mapping example:
--     ["U"] = "<Plug>ColorPickerSlider5Decrease",
--     ["O"] = "<Plug>ColorPickerSlider5Increase",
--   },
--   ["background_highlight_group"] = "Normal",  -- default
--   ["border_highlight_group"] = "FloatBorder", -- default
--   ["text_highlight_group"] = "Normal",        --default
-- })

-- vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.}}}

-- Formatters {{{
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettierd",
    filetype = { "typescript", "typescriptreact", "jsonc" }
  },

  {
    command = "rustfmt",
    filetype = { "rust" }
  }
}
-- }}}

-- Linters {{{
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "markuplint",
    filetype = { "html" }
  },

  {
    command = "eslint_d",
    filetype = { "javascript" }
  },
} -- }}}

-- Live-Server Keybind {{{
-- vim.cmd(
--   [[
-- " Iniciar o Live Server no diretório atual
-- nnoremap <F5> :!live-server.sh start &<CR><CR>

-- " Parar o Live Server
-- nnoremap <F6> :!live-server.sh stop<CR>
-- ]]
-- )
-- }}}

-- Options {{{
vim.opt.relativenumber = true
-- lvim.transparent_window = false

-- Não cria comentários automaticamente
vim.cmd([[autocmd FileType * set formatoptions-=ro]])

lvim.use_icons = true

-- }}}

-- Colorscheme {{{
lvim.builtin.time_based_themes = false
-- lvim.transparent_window = true}}}

-- Dashboard Pessoal {{{
lvim.builtin.alpha.dashboard.section.header.val = {
  [[ __                                       __  __                     ]],
  [[/\ \                                     /\ \/\ \  __                ]],
  [[\ \ \      __  __    ___      __     _ __\ \ \ \ \/\_\    ___ ___    ]],
  [[ \ \ \  __/\ \/\ \ /' _ `\  /'__`\  /\`'__\ \ \ \ \/\ \ /' __` __`\  ]],
  [[  \ \ \L\ \ \ \_\ \/\ \/\ \/\ \L\.\_\ \ \/ \ \ \_/ \ \ \/\ \/\ \/\ \ ]],
  [[   \ \____/\ \____/\ \_\ \_\ \__/.\_\\ \_\  \ `\___/\ \_\ \_\ \_\ \_\]],
  [[    \/___/  \/___/  \/_/\/_/\/__/\/_/ \/_/   `\/__/  \/_/\/_/\/_/\/_/]],
  [[                                                                     ]],
  [[                                                                     ]],
} -- }}}
