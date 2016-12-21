-- ------------
-- Snap windows to top, left, bottom, right halves of the current screen
-- ------------
hs.hotkey.bind(hyper, 'l', function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)
hs.hotkey.bind(hyper, 'h', function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
-- TODO:
--hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():moveToUnit(hs.layout.bottom50) end)
--hs.hotkey.bind(hyper, 'k', function() hs.window.focusedWindow():moveToUnit(hs.layout.top50) end)

-- ------------
-- Move screens between monitors. "Next" and "Previous" loop back around at end
-- ------------
hs.hotkey.bind(hyper, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(hyper, 'P', hs.grid.pushWindowPrevScreen)

-- ------------
-- Toggle maximizing a screen (not fullscreen)
-- toggleMaximize adapted from https://github.com/gwww/dotfiles/blob/master/_hammerspoon/init.lua
-- ------------
hs.hotkey.bind(hyper, 'space', function() toggleMaximize(hs.window.focusedWindow()) end)
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
hs.hotkey.bind(hyper, '.', hs.hints.windowHints)

-- ------------
-- Grid based movement and resizing
-- ------------
hs.grid.setGrid("4x3")
-- TODO: add a grid size changer
hs.hotkey.bind(hyper, 'g', hs.grid.show)
hs.hotkey.bind(hyper, 'Left', hs.grid.pushWindowLeft)
hs.hotkey.bind(hyper, 'Right', hs.grid.pushWindowRight)
hs.hotkey.bind(hyper, 'Up', hs.grid.pushWindowUp)
hs.hotkey.bind(hyper, 'Down', hs.grid.pushWindowDown)
hs.hotkey.bind(hypershift, 'Left', hs.grid.resizeWindowThinner)
hs.hotkey.bind(hypershift, 'Right', hs.grid.resizeWindowWider)
hs.hotkey.bind(hypershift, 'Up', hs.grid.resizeWindowTaller)
hs.hotkey.bind(hypershift, 'Down', hs.grid.resizeWindowShorter)


-- ------------
-- Basic layouts.
-- ------------
-- Comms based layout
-- TODO take into account single monitor setup
hs.hotkey.bind(hyper, '1', function()
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
hs.hotkey.bind(hyper, '2', function()
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
