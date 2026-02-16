-- ~/.config/nvim/lua/plugins/yazi.lua
return { ---@type LazySpec
  "mikavilpas/yazi.nvim",
  version = "*", -- latest stable
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim", -- meist schon da, aber sicher ist sicher
  },
  keys = {
    { "<leader>-", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open yazi at the current file" },
    { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open the file manager in nvim's working directory" },
    { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session" },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1 -- nur wenn du open_for_directories=true nutzen willst
  end,
}
