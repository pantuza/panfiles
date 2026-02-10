return {
  "folke/sidekick.nvim",
  dependencies = { "github/copilot.vim" },
  lazy = false,
  opts = {
    cli = {
      mux = {
        backend = "tmux",
        enabled = true,
      },
    },
  },
  keys = {
    {
      "<tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>"
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    -- Claude CLI keybindings
    { "<leader>aa", function() require("sidekick.cli").toggle() end, desc = "Toggle AI CLI" },
    { "<leader>ac", function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end, desc = "Toggle Claude" },
    { "<leader>as", function() require("sidekick.cli").select() end, desc = "Select AI Tool" },
    { "<leader>at", function() require("sidekick.cli").send({ msg = "{file}" }) end, desc = "Send File to AI" },
    { "<leader>av", function() require("sidekick.cli").send({ msg = "{selection}" }) end, mode = "v", desc = "Send Selection to AI" },
    { "<leader>ap", function() require("sidekick.cli").prompt() end, desc = "Insert AI Prompt" },
  },
}
