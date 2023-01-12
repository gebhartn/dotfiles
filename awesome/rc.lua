require 'awful.autofocus'

C = {
    mod = 'Mod4',
    alt = 'Mod1',
    terminal = 'alacritty',
    launcher = 'menu launcher',
    screenshot = 'ss selection',
}

require 'nil'

require('awful').spawn.with_shell '~/.config/awesome/autostart'
