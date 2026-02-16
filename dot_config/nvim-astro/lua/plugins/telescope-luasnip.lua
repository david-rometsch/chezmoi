-- ~/.config/nvim/lua/plugins/telescope-luasnip.lua
return {
  "benfowler/telescope-luasnip.nvim",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "nvim-telescope/telescope.nvim",
  },
  config = function() require("telescope").load_extension "luasnip" end,
}
