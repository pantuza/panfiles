return {

  -- First disable Super Tab from LuaSnip to avoid conflicts
  -- with Github Copilot Tab completion
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  -- Then, enable Github Copilot
  {
    "github/copilot.vim",

    cmd = "Copilot enable",
    lazy = false,
  },
}
