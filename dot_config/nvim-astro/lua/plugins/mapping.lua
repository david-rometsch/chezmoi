return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          -- tables with just a `desc` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { desc = "Buffers" },

          -- quick save
          ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
          ["<Leader>i"] = { ":BrowserPreview<cr>", desc = "BrowserPreview" }, -- change description but the same command
          ["<Leader>p"] = { ":PeekOpen<cr>", desc = "PeekOpen" }, -- change description but the same command
          ["<Leader>P"] = { ":Plantuml<cr>", desc = "PlantumlOpen" }, -- change description but the same command
          ["<Leader>Y"] = { ":%+y<cr>", desc = "systemyank all" }, -- change description but the same command
          ["<Leader>y"] = { '"+yy', desc = "Copy line to clipboard" },

          -- Obsidian
          ["<leader>on"] = { ":Obsidian today<CR>", desc = "Obsidian Today / New Daily" },
          ["<leader>oN"] = { ":Obsidian dailies<CR>", desc = "Obsidian Dailies Picker" },
          ["<leader>op"] = { ":Obsidian paste_img<CR>", desc = "Paste Image" },

          --typst
          ["<leader>to"] = { ":TypstPreview<CR>", desc = "Typst Preview" },

          --luasnip
          ["<leader>fs"] = { "<cmd>lua require('telescope').extensions.luasnip.luasnip()<CR>", desc = "Find snippets" },

          --todo comments
          ["]t"] = { function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
          ["[t"] = { function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
          ["<leader>st"] = { "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },

          --yazi
          ["<leader>j"] = { "<cmd>Yazi<cr>", desc = "Open Yazi" },

          --lua snip reload (for custom snippets)
          ["<Leader>sr"] = {
            function()
              require("luasnip.loaders.from_vscode").load {
                paths = { vim.fn.stdpath "config" .. "/snippets" },
              }
              vim.notify("Custom snippets neu geladen!", vim.log.levels.INFO)
            end,
            desc = "Reload custom LuaSnip snippets",
          },
        },
        v = {},
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}
