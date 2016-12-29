-- ------------
-- Snap windows to top, left, bottom, right halves of the current screen
-- ------------
registerHotkey("Snap window right", hyper, 'l', function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)
registerHotkey("Snap window left", hyper, 'h', function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
-- TODO:
--hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():moveToUnit(hs.layout.bottom50) end)
--hs.hotkey.bind(hyper, 'k', function() hs.window.focusedWindow():moveToUnit(hs.layout.top50) end)

-- ------------
-- Move screens between monitors. "Next" and "Previous" loop back around at end
-- ------------
registerHotkey("Move the window to the next screen", hyper, 'N', hs.grid.pushWindowNextScreen)
registerHotkey("Move the window to the previous screen", hyper, 'P', hs.grid.pushWindowPrevScreen)

-- ------------
-- Toggle maximizing a screen (not fullscreen)
-- toggleMaximize adapted from https://github.com/gwww/dotfiles/blob/master/_hammerspoon/init.lua
-- ------------
registerHotkey("Maximize the window", hyper, 'space', function() toggleMaximize(hs.window.focusedWindow()) end)
-- TODO deal with: maximize, move to other monitor, maximize (right now the last command will revert)
local previousSizes = {}
function toggleMaximize(window)
  if not window then
    return indow
  end

  local id = window:id()
  if previousSizes[id] == nil then
    previousSizes[id] = window:frame()
    window:maximize()
  else
    window:setFrame(previousSizes[id])
    previousSizes[id] = nil
  end

  return window
end

-- ------------
-- Window hints for easily jumping between open windows
-- ------------
registerHotkey("Show window hints for window switching", hyper, '.', hs.hints.windowHints)

-- ------------
-- Grid based movement and resizing
-- ------------
hs.grid.setGrid("4x3")
-- TODO: add a grid size changer
registerHotkey("Show grid", hyper, 'g', hs.grid.show)
registerHotkey("Move window left", hyper, 'Left', hs.grid.pushWindowLeft)
registerHotkey("Move window right", hyper, 'Right', hs.grid.pushWindowRight)
registerHotkey("Move window up", hyper, 'Up', hs.grid.pushWindowUp)
registerHotkey("Move window down", hyper, 'Down', hs.grid.pushWindowDown)
registerHotkey("Resize window thinner", hypershift, 'Left', hs.grid.resizeWindowThinner)
registerHotkey("Resize window wider", hypershift, 'Right', hs.grid.resizeWindowWider)
registerHotkey("Reize window taller", hypershift, 'Up', hs.grid.resizeWindowTaller)
registerHotkey("Reize window shorter", hypershift, 'Down', hs.grid.resizeWindowShorter)


-- ------------
-- Basic layouts.
-- ------------
-- Comms based layout
-- TODO take into account single monitor setup
registerHotkey("Set window layout - Comms", hyper, '1', function()
  hs.appfinder.appFromName("iTerm2"):mainWindow():setFullScreen(false)
  hs.timer.doAfter(1, function() -- delay is to allow un-fullscreen to finish
    hs.layout.apply({
      { "iTerm2", nil, "Color LCD", hs.layout.maximized, nil, nil }, -- todo fullscreen
      { "Spotify", nil, "Color LCD", hs.layout.maximized, nil, nil },
      { "Firefox", nil, "Thunderbolt Display", hs.layout.left50, nil, nil },
      { "Slack", nil, "Thunderbolt Display", hs.layout.right50, nil, nil }
    })
    hs.appfinder.appFromName("iTerm2"):mainWindow():setFullScreen(true)
  end )
end)
-- Dev based layout
registerHotkey("Set window layout - Dev", hyper, '2', function()
  hs.appfinder.appFromName("iTerm2"):mainWindow():setFullScreen(false)
  hs.timer.doAfter(1, function() -- delay is to allow un-fullscreen to finish
    hs.layout.apply({
      { "iTerm2", nil, "Thunderbolt Display", hs.layout.maximized, nil, nil },
      { "Spotify", nil, "Color LCD", hs.layout.maximized, nil, nil },
      { "Firefox", nil, "Color LCD", hs.layout.maximized, nil, nil },
      { "Slack", nil, "Color LCD", hs.layout.maximized, nil, nil }
    })
    hs.appfinder.appFromName("iTerm2"):mainWindow():setFullScreen(true)
  end )
end)
