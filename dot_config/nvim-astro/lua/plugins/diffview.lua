return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: File History" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
    },
    opts = {
      -- hier kannst du Layouts etc. anpassen, default ist schon gut
      use_icons = true, -- wenn du nvim-web-devicons hast
      enhanced_diff_hl = true, -- schöneres Highlighting
    },
  },
}
