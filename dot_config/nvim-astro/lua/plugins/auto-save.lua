-- In ~/.config/nvim/lua/user/init.lua oder plugins/user.lua
return {
  -- Auto-save Plugin
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        enabled = true,
        execution_message = { message = "" }, -- Keine nervigen Messages
        trigger_events = {"InsertLeave", "TextChanged"},
        debounce_delay = 1000, -- 1 Sekunde nach letzter Änderung
      })
    end,
  },
}
