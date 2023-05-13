local awful = require 'awful'

return {
    open_terminal = function()
        awful.spawn(C.terminal)
    end,
    open_launcher = function()
        awful.spawn(C.launcher)
    end,
    screenshot = function()
        awful.spawn(C.screenshot)
    end,
    close_window = function(c)
        c:kill()
    end,
    jump_tag = function(index)
        local i = index == 0 and 10 or index
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
            tag:view_only()
        end
    end,
    move_window = function(index)
        if client.focus then
            local i = index == 0 and 10 or index
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:move_to_tag(tag)
            end
        end
    end,
    move_screen = function(index)
        if client.focus then
            client.focus:move_to_screen(index)
        end
    end,
    set_primary = function()
        if client.focus then
            client.focus:to_primary_section()
        end
    end,
    set_secondary = function()
        if client.focus then
            client.focus:to_secondary_section()
        end
    end,
    focus_window = function()
        awful.client.focus.byidx(1)
    end,
    toggle_fullscreen = function(w)
        w.fullscreen = not w.fullscreen
        w:raise()
    end,
    toggle_float = function(w)
        w.floating = not w.floating
        w:raise()
    end,
    grow_left = function()
        awful.tag.incmwfact(-0.025)
    end,
    grow_right = function()
        awful.tag.incmwfact(0.025)
    end,
    grow_up = function()
        awful.client.incwfact(0.05)
    end,
    grow_down = function()
        awful.client.incwfact(-0.05)
    end,
    cycle_layout = function()
        awful.layout.inc(1)
    end,
}
