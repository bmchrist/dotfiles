-- Globals, since the included additional Lua files use them
hyper = {"ctrl", "cmd"}
hypershift = {"ctrl", "cmd", "shift"}

hs.window.animationDuration = 0 -- TODO not working?

-- --------
-- Wrapper for registering hotkeys including the ability to print documentation
-- --------
hotkeys = {}
function registerHotkey(description, ...)
  local hotkey = hs.hotkey.new(...)

  if hotkeys[hotkey.idx] then
    hs.alert.show("Duplicate registration for " .. hotkey.idx)
  else
    hotkeys[hotkey.idx] = description
    hotkey:enable()
  end
end

function displayHelp()
  local str = ""
  for k,v in pairs(hotkeys) do
    str = str .. k .. " " .. v .. "\n"
  end
  hs.alert.show(str, { textSize = "15" }, nil, nil, 7) -- TODO better display method
end
---- build posture reminder into this
registerHotkey("Locks the Computer", hyper, "escape", nil, hs.caffeinate.lockScreen) -- TODO annoying animation, music not paused but is muted
registerHotkey("Reload Hammerspoon Config", hyper, "r", nil, hs.reload)
registerHotkey("Display Help", hyper, "/", nil, displayHelp)
-- --------
-- End hotkey wrapper
-- --------

require("window-management")
require("vim")
require("mouse")
require("hcalendar")
require("cheatsheet")
