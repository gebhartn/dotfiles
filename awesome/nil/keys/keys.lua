local awful = require 'awful'

local M = {}

function M.with_actions(actions)
    awful.keyboard.append_global_keybindings {
        awful.key({ C.mod }, 'Return', actions.open_terminal),
        awful.key({ C.mod }, 'd', actions.open_launcher),
        awful.key({}, 'Print', actions.screenshot),

        awful.key({ C.mod, 'Shift' }, 'l', awesome.quit),
        awful.key({ C.mod, 'Shift' }, 'r', awesome.restart),

        awful.key {
            modifiers = { C.mod },
            keygroup = 'numrow',
            on_press = actions.jump_tag,
        },
        awful.key {
            modifiers = { C.mod, 'Shift' },
            keygroup = 'numrow',
            on_press = actions.move_window,
        },
        awful.key {
            modifiers = { C.alt, 'Shift' },
            keygroup = 'numrow',
            on_press = actions.move_screen,
        },
        awful.key({ C.mod }, 'Tab', actions.focus_window),
        awful.key({ C.mod }, 'Right', actions.grow_right),
        awful.key({ C.mod }, 'Left', actions.grow_left),
        awful.key({ C.mod }, 'Up', actions.grow_up),
        awful.key({ C.mod }, 'Down', actions.grow_down),
        awful.key({ C.mod }, 'j', actions.set_primary),
        awful.key({ C.mod }, 'k', actions.set_secondary),
        awful.key({ C.alt }, 'Return', actions.cycle_layout),

        client.connect_signal('request::default_keybindings', function()
            awful.keyboard.append_client_keybindings {
                awful.key({ C.mod, 'Shift' }, 'q', actions.close_window),
                awful.key({ C.mod, 'Shift' }, 'Return', actions.toggle_fullscreen),
                awful.key({ C.mod, 'Shift' }, 'space', actions.toggle_float),
            }
        end),
    }
end

return M
