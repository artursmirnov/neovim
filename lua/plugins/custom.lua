return {
  {
    "DreamMaoMao/yazi.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ty", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
    },
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    init = function()
      local fb_actions = require("telescope._extensions.file_browser.actions")

      require("telescope").setup({
        extensions = {
          file_browser = {
            grouped = true,
            select_buffer = true,
            hidden = { file_browser = true, folder_browser = true },
            git_status = false,
            theme = "ivy",
            quiet = true,
            mappings = {
              ["i"] = {
                ["<A-c>"] = false,
                ["<C-CR>"] = fb_actions.create_from_prompt,
                ["<A-r>"] = false,
                ["<A-m>"] = false,
                ["<A-y>"] = false,
                ["<A-d>"] = false,
                ["<C-o>"] = false,
                ["<C-g>"] = false,
                ["<C-e>"] = false,
                ["<C-w>"] = false,
                ["<C-t>"] = false,
                ["<C-f>"] = fb_actions.toggle_browser,
                ["<C-h>"] = false,
                ["<C-s>"] = false,
                ["<bs>"] = fb_actions.backspace,
              },
              ["n"] = {
                ["c"] = fb_actions.create,
                ["r"] = fb_actions.rename,
                ["m"] = fb_actions.move,
                ["y"] = fb_actions.copy,
                ["d"] = fb_actions.remove,
                ["o"] = fb_actions.open,
                ["g"] = false,
                ["~"] = fb_actions.goto_home_dir,
                ["e"] = false,
                ["w"] = fb_actions.goto_cwd,
                ["f"] = fb_actions.toggle_browser,
                ["."] = fb_actions.toggle_hidden,
                ["h"] = false,
                ["s"] = false,
                ["<bs>"] = fb_actions.goto_parent_dir,
              },
            },
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      {
        "<leader>fb",
        "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
        desc = "File browser",
      },
    },
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = { "akinsho/bufferline.nvim" },
    config = function()
      require("auto-session").setup({
        auto_session_enable_last_session = false,
        auto_session_enabled = true,
        auto_save_enabled = true,
        auto_restore_enabled = true,
        auto_session_use_git_branch = true,
      })
    end,
  },

  {
    "artursmirnov/openingh.nvim",
    lazy = false,
    config = function()
      vim.g.openingh_remote = "upstream"
      require("openingh").setup()
    end,
    keys = {
      { "<leader>go", "<cmd>:OpenInGHFile master<cr>", desc = "Open file on GitHub with master branch" },
    },
  },

  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
}
