---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

local primary_browser = "librewolf"
local secondary_browser = "helium-browser"
local terminal = "kitty"

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/auto_detect_terminal.sh"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(primary_browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/rofi_clipboard.sh"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("pkill thunar || thunar"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("footclient --app-id bluetui -e bluetui"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("footclient --app-id btop -e btop"))

hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("footclient --app-id yazi -e yazi"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("notify-send 'Hyprland doesnt have an overview feature'"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("pkill wlogout || wlogout"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { repeating = true })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pkill waybar || waybar -c $HOME/.config/waybar/Hyprland/config.jsonc -s $HOME/.config/waybar/style.css"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(secondary_browser))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/random_wall_on_home.sh"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("footclient --app-id cmus -e cmus"), { repeating = false })
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("footclient --app-id nmtui -e nmtui"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("pkill localsend || localsend"), { repeating = false })

hl.bind(mainMod .. " + Space",  hl.dsp.exec_cmd("pkill rofi || rofi -show drun -theme ~/.config/rofi/launchpad.rasi"))
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd("cliphist wipe"))
hl.bind(mainMod .. " + Grave",  hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/auto_detect_terminal.sh"))
hl.bind(mainMod .. " + Backslash", hl.dsp.exec_cmd("bash $HOME/.config/Scripts/smassh.sh"))
hl.bind(mainMod .. " + tab",    hl.dsp.window.cycle_next(), { repeating = true })

hl.bind(mainMod .. " + ALT + B",    hl.dsp.exec_cmd("helium-browser"))
hl.bind(mainMod .. " + ALT + N",    hl.dsp.exec_cmd("pkill thunar || thunar"))
hl.bind(mainMod .. " + CTRL + R",   hl.dsp.exec_cmd(" bash ~/.config/Scripts/partial_screenshot.sh"),     { locked = true, repeating = false })
hl.bind(mainMod .. " + CTRL + S",   hl.dsp.exec_cmd(" bash ~/.config/Scripts/full_screenshot.sh"),        { locked = true, repeating = false })
hl.bind(mainMod .. " + SHIFT + R",  hl.dsp.exec_cmd(" bash ~/.config/Scripts/screen_recorder.sh"),        { locked = true, repeating = false })
hl.bind(mainMod .. " + CTRL + E",   hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + Escape",     hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + CTRL + A",   hl.dsp.exec_cmd(" bash ~/.config/Scripts/animation_switcher.sh"),     { repeating = false })

hl.bind("ALT + Return",                hl.dsp.exec_cmd("bash $HOME/.config/Scripts/dashboard_toggle.sh"))
hl.bind("SHIFT + Return",              hl.dsp.exec_cmd("footclient --app-id aichat -e aichat"))
hl.bind("CTRL + Backslash",            hl.dsp.window.pseudo())
hl.bind("CTRL + SHIFT + Backslash",    hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind(mainMod .. " + left",          hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",         hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + H",             hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L",             hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",             hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",             hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J",     hl.dsp.window.move({ direction = "d" }))

hl.bind(mainMod .. " + I",             hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + U",             hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + Down",          hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + Up",            hl.dsp.focus({ workspace = "e-1" }))

for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
  hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + SHIFT + V", function()
  local active = hl.get_active_window()

  if active and active.floating then
    hl.dispatch(hl.dsp.focus({ window = "tiled" }))
  else
    hl.dispatch(hl.dsp.focus({ window = "floating" }))
  end
end
)

hl.bind("ALT + Space",          hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Space",  hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume",   hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 10%+ && pw-play /run/current-system/sw/share/sounds/freedesktop/stereo/audio-volume-change.oga"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",   hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%- && pw-play /run/current-system/sw/share/sounds/freedesktop/stereo/audio-volume-change.oga"),        { locked = true, repeating = true })
hl.bind("XF86AudioMute",          hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),        { locked = true, repeating = false })
hl.bind("XF86AudioMicMute",       hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),      { locked = true, repeating = false })
hl.bind("XF86MonBrightnessUp",    hl.dsp.exec_cmd("brightnessctl set 10%+"),                            { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",  hl.dsp.exec_cmd("brightnessctl set 10%-"),                            { locked = true, repeating = true })

hl.bind("ALT + BracketRight",     hl.dsp.exec_cmd("wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 10%+ && pw-play /run/current-system/sw/share/sounds/freedesktop/stereo/audio-volume-change.oga"), { locked = true, repeating = true })
hl.bind("ALT + BracketLeft",      hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%- && pw-play /run/current-system/sw/share/sounds/freedesktop/stereo/audio-volume-change.oga"),        { locked = true, repeating = true })
hl.bind("ALT + slash",            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),        { locked = true, repeating = false })
hl.bind("ALT + backslash",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),      { locked = true, repeating = false })
hl.bind("ALT + apostrophe",       hl.dsp.exec_cmd("brightnessctl set 10%+"),                            { locked = true, repeating = true })
hl.bind("ALT + semicolon",        hl.dsp.exec_cmd("brightnessctl set 10%-"),                            { locked = true, repeating = true })

hl.bind("ALT + Period",   hl.dsp.exec_cmd(" bash ~/.config/Scripts/full_screenshot.sh"),                { locked = true, repeating = false })
hl.bind("ALT + Comma",    hl.dsp.exec_cmd(" bash ~/.config/Scripts/partial_screenshot.sh"),             { locked = true, repeating = false })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),          { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),    { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),    { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),      { locked = true })

hl.bind("ALT + V",        hl.dsp.exec_cmd("playerctl next"),          { locked = true })
hl.bind("ALT + C",        hl.dsp.exec_cmd("playerctl play-pause"),    { locked = true })
hl.bind("ALT + x",        hl.dsp.exec_cmd("playerctl previous"),      { locked = true })
hl.bind("ALT + B",        hl.dsp.exec_cmd("playerctl position 1+"),   { locked = true, repeating = true })
hl.bind("ALT + Z",        hl.dsp.exec_cmd("playerctl position 1-"),   { locked = true, repeating = true })

hl.bind("Print",        hl.dsp.exec_cmd("bash ~/.config/Scripts/full_screenshot.sh"),      { locked = true, repeating = false })
hl.bind("ALT + Print",  hl.dsp.exec_cmd("bash ~/.config/Scripts/partial_screenshot.sh"),   { locked = true, repeating = false })
hl.bind("CTRL + Print", hl.dsp.exec_cmd("bash ~/.config/Scripts/screen_recorder.sh"),      { locked = true, repeating = false })

hl.bind("ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("ALT + L", hl.dsp.exec_cmd("bash ~/.config/Scripts/random_wall_on_lockscr.sh"),                      { locked = false, repeating = false })
hl.bind("ALT + N", hl.dsp.exec_cmd("hyprctl reload && notify-send 'Hyprland' 'Config reloaded'"),            { locked = true, repeating = false })
hl.bind("ALT + O", hl.dsp.exec_cmd("systemctl poweroff"),                                                    { locked = true, repeating = false })
hl.bind("ALT + R", hl.dsp.exec_cmd("systemctl reboot"),                                                      { locked = true, repeating = false })
hl.bind("ALT + S", hl.dsp.exec_cmd("systemctl suspend ; bash ~/.config/Scripts/random_wall_on_lockscr.sh"),  { locked = true, repeating = false })
hl.bind("ALT + D", hl.dsp.exec_cmd("rfkill toggle all"),                                                     { locked = true, repeating = false })
hl.bind("ALT + E", hl.dsp.exec_cmd("rfkill toggle bluetooth"),                                               { locked = true, repeating = false })
hl.bind("ALT + Y", hl.dsp.exec_cmd("rfkill toggle wifi"),                                                    { locked = true, repeating = false })
hl.bind("ALT + K", hl.dsp.exec_cmd("pkill kdeconnect-app || kdeconnect-app"),                                { repeating = false })
hl.bind("ALT + G", hl.dsp.exec_cmd("pkill nwg-look || nwg-look"),                                            { repeating = false })
hl.bind("ALT + W", hl.dsp.exec_cmd("pkill rofi || bash ~/.config/Scripts/wallpaper_switcher.sh"),            { repeating = false })
hl.bind("ALT + Q", hl.dsp.exec_cmd("foot -c $HOME/.config/foot/foot_for_cava.ini --app-id cava -e cava"),    { repeating = false })
hl.bind("ALT + J", hl.dsp.exec_cmd("codium"),                                                                { repeating = false })
hl.bind("ALT + H", function()
  hl.timer(function()
    hl.dispatch(hl.dsp.dpms({ action = "disable" }))
  end, {timeout = 500, type = "oneshot"})
end)

hl.bind(mainMod .. "+ BracketRight", hl.dsp.layout("consume_or_expel next"))
hl.bind(mainMod .. "+ BracketLeft",  hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. "+ period",       hl.dsp.layout("expel"))
hl.bind(mainMod .. "+ comma",        hl.dsp.layout("consume"))
