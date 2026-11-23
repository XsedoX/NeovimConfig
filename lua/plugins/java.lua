return {
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
      java = {
        -- Fetch *-sources.jar for dependencies
        maven = { downloadSources = true },
        eclipse = { downloadSources = true }, -- also used for Gradle projects
        -- Fallback when no sources exist: decompile bytecode
        contentProvider = { preferred = "fernflower" },
        -- Constructor/method parameter hints while typing
        signatureHelp = { enabled = true, description = { enabled = true } },
        -- Show source snippets in hover (K)
        referencesCodeLens = { enabled = true },
      },
    })
    return opts
  end,
}
