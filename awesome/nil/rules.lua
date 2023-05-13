local awful = require 'awful'
local gears = require 'gears'
local ruled = require 'ruled'

ruled.client.connect_signal('request::rules', function()
    ruled.client.append_rule {
        id = 'global',
        rule = {},
        properties = {
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_offscreen + awful.placement.centered,
            buttons = gears.table.join(
                awful.button({}, 1, function(c)
                    client.focus = c
                end),
                awful.button({ C.mod }, 1, function()
                    awful.mouse.client.move()
                end),
                awful.button({ C.mod }, 3, function()
                    awful.mouse.client.resize()
                end)
            ),
        },
    }
end)
