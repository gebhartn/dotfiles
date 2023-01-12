local awful = require 'awful'
local naughty = require 'naughty'

-- sloppy focus
client.connect_signal('mouse::enter', function(c)
    c:activate { context = 'mouse_enter', raise = false }
end)

-- add new windows to the stack
client.connect_signal('manage', function(c)
    if not awesome.startup then
        awful.client.setslave(c)
    end
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

-- layouts and tags
screen.connect_signal('request::desktop_decoration', function(s)
    tag.connect_signal('request::default_layouts', function()
        awful.layout.append_default_layouts {
            awful.layout.suit.tile,
            awful.layout.suit.floating,
        }
    end)

    awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' }, s, awful.layout.layouts[1])
end)

-- err
naughty.connect_signal('request::display_error', function(message, startup)
    naughty.notification {
        urgency = 'critical',
        title = 'Oops, an error happened' .. (startup and ' during startup!' or '!'),
        message = message,
    }
end)

-- disable notifications
naughty.connect_signal('request::display', function() end)
