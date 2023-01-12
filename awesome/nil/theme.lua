local beautiful = require 'beautiful'
local dpi = beautiful.xresources.apply_dpi

beautiful.init {
    useless_gap = dpi(10),
    border_width = dpi(0),
    tooltip_opacity = 0,
    icon_theme = nil,
}
