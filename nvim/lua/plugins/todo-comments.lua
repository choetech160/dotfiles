return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {

      NICE = {
        icon = "🔆",
        color = "#8BC34A", -- Darker green color
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
