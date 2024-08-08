-- return {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--   opts = {
--     -- add any options here
--   },
--   dependencies = {
--     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--     "MunifTanjim/nui.nvim",
--     -- OPTIONAL:
--     --   `nvim-notify` is only needed, if you want to use the notification view.
--     --   If not available, we use `mini` as the fallback
--     "rcarriga/nvim-notify",
--   },
-- }

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    presets = {
      command_palette = {
        views = {
          cmdline_popup = {
            position = {
              row = "50%",
              col = "50%",
            },
            size = {
              min_width = 60,
              width = "auto",
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = "50%",
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
              max_height = 15,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "NoiceCmdlinePopupBorder",
              },
            },
          },
        },
      },
    },
    lsp = {
      signature = {
        opts = {
          size = {
            max_height = 15,
          },
        },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}
-- return {
--   "folke/noice.nvim",
--   event = "VeryLazy",
--   opts = {
--     presets = {
--       command_palette = {
--         views = {
--           cmdline_popup = {
--             position = {
--               row = "50%",
--               col = "50%",
--             },
--             size = {
--               min_width = 60,
--               width = "auto",
--               height = "auto",
--             },
--           },
--           popupmenu = {
--             relative = "editor",
--             position = {
--               row = "50%",
--               col = "50%",
--             },
--             size = {
--               width = 60,
--               height = "auto",
--               max_height = 15,
--             },
--             border = {
--               style = "rounded",
--               padding = { 0, 1 },
--             },
--             win_options = {
--               winhighlight = {
--                 Normal = "Normal",
--                 FloatBorder = "NoiceCmdlinePopupBorder",
--               },
--             },
--           },
--         },
--       },
--     },
--     lsp = {
--       signature = {
--         opts = {
--           size = {
--             max_height = 15,
--           },
--         },
--       },
--     },
--   },
--   dependencies = {
--     "MunifTanjim/nui.nvim",
--     "rcarriga/nvim-notify",
--   },
-- }
