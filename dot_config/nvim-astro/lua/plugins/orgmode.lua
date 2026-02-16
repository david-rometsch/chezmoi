--https://github.com/nvim-orgmode/orgmode/blob/master/README.org
return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
    }

    -- Experimental LSP support
    vim.lsp.enable "org"
  end,
}
