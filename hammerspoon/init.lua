-- Gloabs, since the included additional Lua files use them
hyper = {"ctrl", "cmd"}
hypershift = {"ctrl", "cmd", "shift"}

hs.window.animationDuration = 0 -- TODO not working?

-- TODO hotkey binder that documents useage for display and warns if re-used combo

-- TODO: document what these do
require("window-management")
require("vim")
require("mouse")

require("hcalendar") -- TODO: customize
require("cheatsheet")

hotkeys = {}
function register_hotkey(description, ...)
  local hotkey = hs.hotkey.new(...)

  --hs.alert.show(hotkey.idx)

  if hotkeys[hotkey.idx] then
    hs.alert.show("Duplicate registration for " .. hotkey.idx)
  else
    hotkeys[hotkey.idx] = description
    hotkey:enable()
  end
end
---- build posture reminder into this
register_hotkey("Locks the Computer", hyper, "escape", nil, hs.caffeinate.lockScreen) -- TODO annoying animation, music not paused but is muted
register_hotkey("Reload Hammerspoon Config", hyper, "r", nil, hs.reload)
