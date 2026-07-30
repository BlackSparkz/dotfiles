hl.config({
  general = {
    gaps_in  = 5,
    gaps_out = 10,
    border_size = 4,

    col = {
      active_border   = "rgba(ffffffff)",
      -- active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
      inactive_border = "rgba(00000000)",
    },

    resize_on_border = true,
    allow_tearing = false,
    layout = "master",

    snap = {
      enabled = true,
      respect_gaps = false
    }
  },
})
