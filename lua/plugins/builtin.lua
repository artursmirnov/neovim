local projects = require("utils.projects")

return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  {
    "SmiteshP/nvim-navic",
    enabled = false,
  },

  {
    "akinsho/bufferline.nvim",
    enabled = false,
    opts = function()
      local bufferline = require("bufferline")

      return {
        options = {
          style_preset = {
            bufferline.style_preset.minimal,
            bufferline.style_preset.no_italic,
          },
          show_buffer_close_icons = false,
          separator_style = { "", "" },
          indicator = {
            style = "none",
          },
          groups = {
            items = {
              require("bufferline.groups").builtin.pinned:with({ icon = "" }),
            },
          },
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Up>"] = cmp.mapping.scroll_docs(-4),
        ["<S-Down>"] = cmp.mapping.scroll_docs(4),
      })

      opts.sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "path" },
        {
          name = "buffer",
          option = {
            keyword_length = 3,
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
      })

      opts.window = {
        completion = {
          side_padding = 1,
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
          winblend = 0,
          scrollbar = false,
          border = {
            { "╭", "CmpBorder" },
            { "─", "CmpBorder" },
            { "╮", "CmpBorder" },
            { "│", "CmpBorder" },
            { "╯", "CmpBorder" },
            { "─", "CmpBorder" },
            { "╰", "CmpBorder" },
            { "│", "CmpBorder" },
          },
        },
        documentation = {
          border = {
            { "╭", "CmpDocBorder" },
            { "─", "CmpDocBorder" },
            { "╮", "CmpDocBorder" },
            { "│", "CmpDocBorder" },
            { "╯", "CmpDocBorder" },
            { "─", "CmpDocBorder" },
            { "╰", "CmpDocBorder" },
            { "│", "CmpDocBorder" },
          },
          winhighlight = "Normal:CmpDoc",
          winblend = 0,
        },
      }

      opts.experimental = {}
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local icons = LazyVim.config.icons

      opts.sections.lualine_b = {
        { "branch", icon = "" },
      }
      opts.sections.lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", filestatus = false, path = 1 },
      }
      opts.sections.lualine_z = opts.sections.lualine_y
      -- opts.sections.lualine_z = {
      --   { "progress" },
      -- }
      opts.sections.lualine_y = opts.sections.lualine_x
      opts.sections.lualine_x = {}

      local function window()
        return vim.api.nvim_win_get_number(0)
      end
      opts.winbar = {
        lualine_y = { window },
        lualine_c = {
          LazyVim.lualine.root_dir(),
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
      }
      opts.inactive_winbar = {
        lualine_y = { window },
        lualine_c = {
          LazyVim.lualine.root_dir(),
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
      }
    end,
  },

  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "single",
      },
    },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
  },

  {
    "echasnovski/mini.indentscope",
    enabled = false,
    opts = {
      draw = {
        animation = function()
          return 0
        end,
      },
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
  },

  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
      },
      cmdline = {
        view = "cmdline",
      },
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },

      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
          },
          opts = { skip = true },
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "catppuccin",
      options = {
        component_separators = " ",
        section_separators = { left = "", right = "" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "json",
        "jsonc",
        "python",
        "ruby",
        "vue",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "bash",
        "dockerfile",
        "yaml",
        "toml",
        "glimmer",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 1,
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- web dev stuff
        "css-lsp",
        "tailwindcss-language-server",
        "html-lsp",
        "json-lsp",
        "typescript-language-server",
        "ember-language-server",
        "vetur-vls",
        "glint",
        "yaml-language-server",
        "python-lsp-server",
        "deno",
        "eslint_d",
        "prettier",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fb", false },
      {
        "<leader><space>",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal<cr>",
        desc = "Buffers",
      },
      {
        "<leader>fr",
        function()
          require("telescope.builtin").find_files({ default_text = vim.split(vim.fn.expand("%:t:r"), ".", true)[1] })
        end,
        desc = "Find related files",
      },
      -- Replaced by telescope-frecency
      -- { "<leader>ff", LazyVim.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      -- { "<leader>fF", LazyVim.telescope("files"), desc = "Find Files (Root Dir)" },
      { "<leader>sG", LazyVim.telescope("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>sg", LazyVim.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
      { "<leader>sW", LazyVim.telescope("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
      { "<leader>sw", LazyVim.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sW", LazyVim.telescope("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
      { "<leader>sw", LazyVim.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")

      local function franciumPathCleanup(path)
        path = path:gsub("packages/", "")
        path = path:gsub("francium%-", "f-")
        return path
      end

      local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)

        if projects.isFrancium then
          parent = franciumPathCleanup(parent)
        end

        if parent == "." then
          return tail
        end

        return string.format("%s\t\t%s", tail, parent)
      end

      return vim.tbl_deep_extend("force", opts, {
        defaults = {
          theme = "ivy",
          mappings = {
            i = {
              ["<C-h>"] = actions.preview_scrolling_left,
              ["<C-j>"] = actions.preview_scrolling_down,
              ["<C-k>"] = actions.preview_scrolling_up,
              ["<C-l>"] = actions.preview_scrolling_right,
              ["<C-left>"] = actions.preview_scrolling_left,
              ["<C-down>"] = actions.preview_scrolling_down,
              ["<C-up>"] = actions.preview_scrolling_up,
              ["<C-right>"] = actions.preview_scrolling_right,
              ["<C-s>"] = actions.select_vertical,
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["<C-h>"] = actions.preview_scrolling_left,
              ["<C-j>"] = actions.preview_scrolling_down,
              ["<C-k>"] = actions.preview_scrolling_up,
              ["<C-l>"] = actions.preview_scrolling_right,
              ["<C-left>"] = actions.preview_scrolling_left,
              ["<C-down>"] = actions.preview_scrolling_down,
              ["<C-up>"] = actions.preview_scrolling_up,
              ["<C-right>"] = actions.preview_scrolling_right,
              ["<s>"] = actions.select_vertical,
              ["<d>"] = actions.delete_buffer,
            },
          },
          path_display = filenameFirst,
        },
        pickers = {
          find_files = {
            theme = "ivy",
          },
          buffers = {
            theme = "ivy",
          },
          git_files = {
            theme = "ivy",
          },
        },
      })
    end,
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopeResults",
        callback = function(ctx)
          vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopeParent", "\t\t.*$")
            vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
          end)
        end,
      })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      context = "buffers",
    },
  },
}
