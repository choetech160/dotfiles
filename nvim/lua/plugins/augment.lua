return {
  "augmentcode/augment.vim",
  event = "VeryLazy",

  keys = {

    { "<leader>ac", "<cmd>Augment chat<cr>", desc = "Send a chat to augment " },
    { "<leader>an", "<cmd>Augment chat-new<cr>", desc = "Start a new conversation" },
    { "<leader>at", "<cmd>Augment chat-toggle<cr>", desc = "Toggle conversation" },
    { "<leader>as", "<cmd>Augment status<cr>", desc = "Get augment status" },
  },
}
