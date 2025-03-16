return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      styple = "night",
      transparent = true,
      dim_inactive = false,
      on_colors = function(colors)
        colors.bg = colors.bg_dark1
      end,
    })
  end,
}
