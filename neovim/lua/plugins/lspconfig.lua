return {
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      servers = {
        copilot = {},
      },
      setup = {
        solargraph = {
          capabilities = {
            diagnostics = false,
            -- formatting = true,
          },
        },
        copilot = function(_, opts)
          require("lspconfig").copilot.setup(opts)
        end,
      },
    },
  },
}
