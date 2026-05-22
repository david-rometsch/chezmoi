return {
  -- Syntax Highlighting
  {
    "aklt/plantuml-syntax",
    ft = "plantuml",
  },

  -- Previewer (deine alte, unkomplizierte Lösung)
  {
    "weirongxu/plantuml-previewer.vim",
    dependencies = { "tyru/open-browser.vim" },
    ft = "plantuml",
  },
}
-- ev in zukunft
-- return {
--   {
--     "aklt/plantuml-syntax",
--     ft = "plantuml",
--   },
--   {
--     "charlesnicholson/plantuml.nvim",
--     ft = "plantuml",
--     opts = {
--       auto_start = true,
--       auto_update = true,
--       use_docker = true,
--       docker_image = "plantuml/plantuml-server:jetty",
--       docker_port = 8080, -- wichtig!
--       docker_remove_on_stop = true, -- sauberer
--       http_port = 8764,
--       auto_launch_browser = "once",
--     },
--   },
-- }
