return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup({
      app = "webview",  -- ← hier genau das clean Preview ohne Browser-Chrome!
      -- theme = "dark",   -- oder "light"

      theme = "light",   -- oder "light"
      update_on_change = true,
      throttle_at = 200000,
      throttle_time = "auto",
    })
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
}
