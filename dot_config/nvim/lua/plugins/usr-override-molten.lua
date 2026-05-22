return {
  "benlubas/molten-nvim",
  dependencies = { "3rd/image.nvim" },
  config = function()
    vim.g.molten_image_provider = "image.nvim"
  end,
}
