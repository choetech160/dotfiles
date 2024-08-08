return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    -- ---@class CatppuccinOptions
    -- opts = {
    -- 	transparent_background = true,
    -- },
  },
  {

    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      transparent_background = true,
    },
  },
}
-- return {
--   {"cocopon/iceberg.vim"},
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "iceberg",
--     },
-- }
-- }
