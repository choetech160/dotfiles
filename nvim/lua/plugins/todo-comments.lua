-- return {
--   "folke/todo-comments.nvim",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   keys = {
--
--     { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search TODOs (Telescope)" },
--     { "<leader>xT", "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble Panel)" },
--   },
--   opts = {
--     keywords = {
--
--       NICE = {
--         icon = "🔆",
--         color = "#8BC34A", -- Darker green color
--         alt = { "FEATURE", "SUGGESTION" },
--       },
--       REPEAT = { icon = "🌀", color = "#C3B1E1", alt = { "REFACTOR", "DUPLICATE", "REDUNDANT" } },
--       IDEAS = {
--         icon = "💡",
--         color = "#FFD700",
--         alt = { "SOLUTION", "CONCEPT", "POSSIBLE_SOLUTION" },
--       },
--     },
--   },
-- }
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>st", "<cmd>TodoFzfLua<cr>", desc = "Search TODOs (Fzf)" },
    { "<leader>xT", "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble Panel)" },
  },
  opts = {
    -- ADD THIS SECTION:
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      -- This regex ensures your custom words are picked up
      pattern = [[\b(KEYWORDS):]],
    },
    keywords = {
      NICE = {
        icon = "🔆",
        color = "#8BC34A",
        alt = { "FEATURE", "SUGGESTION" },
      },
      REPEAT = { icon = "🌀", color = "#C3B1E1", alt = { "REFACTOR", "DUPLICATE", "REDUNDANT" } },
      IDEAS = {
        icon = "💡",
        color = "#FFD700",
        alt = { "SOLUTION", "CONCEPT", "POSSIBLE_SOLUTION" },
      },
    },
  },
}
-- return {
--   "folke/todo-comments.nvim",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   keys = {
--     -- Change this line from TodoTelescope to TodoFzfLua
--     { "<leader>st", "<cmd>TodoFzfLua<cr>", desc = "Search TODOs (Fzf)" },
--     { "<leader>xT", "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble Panel)" },
--   },
--   opts = {
--     keywords = {
--       NICE = {
--         icon = "🔆",
--         color = "#8BC34A",
--         alt = { "FEATURE", "SUGGESTION" },
--       },
--       REPEAT = { icon = "🌀", color = "#C3B1E1", alt = { "REFACTOR", "DUPLICATE", "REDUNDANT" } },
--       IDEAS = {
--         icon = "💡",
--         color = "#FFD700",
--         alt = { "SOLUTION", "CONCEPT", "POSSIBLE_SOLUTION" },
--       },
--     },
--   },
-- }
