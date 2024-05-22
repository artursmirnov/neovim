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
