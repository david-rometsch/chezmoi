return {
  "ray-x/web-tools.nvim",
  config = function()
    require("web-tools").setup({
      keymaps = {
        rename = nil,
        repeat_rename = ".",
      },
      hurl = {  -- REST client config
        show_headers = false,
        floating = false,
      },
      browser = {
        focus = false,  -- ← Das brauchst du!
      },
    })
  end
}
