-- ------------
-- Snap windows to top, left, bottom, right halves of the current screen
-- ------------
registerHotkey("Toogle screens on and off", hyper, '`', function() toggleBrightness() end)
-- TODO deal with: maximize, move to other monitor, maximize (right now the last command will revert)
local previousBrightness = nil

function toggleBrightness()
  current = hs.brightness.get()
  if current == 0 then
    if previousBrightness then
      hs.brightness.set(previousBrightness)
    else
      hs.brightness.set(50)
    end
  else
    previousBrightness = current
    hs.brightness.set(0)
  end

  local id = window:id()
  if previousSizes[id] == nil then
    previousSizes[id] = window:frame()
    window:maximize()
  else
    window:setFrame(previousSizes[id])
    clearMaximize(window)
  end

  return window
end
