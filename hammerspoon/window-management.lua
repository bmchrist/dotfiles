-- Note: if accessibility or something that uses that API is turned on, apps will start to behave oddly
-- restart app after turning off anything that uses accessibility api to fix
--
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
registerHotkey("Move the window to the next screen", hyper, 'N', function()
  clearMaximize(hs.window.focusedWindow())
  hs.grid.pushWindowNextScreen()
end )
registerHotkey("Move the window to the previous screen", hyper, 'P', function()
  clearMaximize(hs.window.focusedWindow())
  hs.grid.pushWindowPrevScreen()
end)

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
    clearMaximize(window)
  end

  return window
end

-- Need to rethink this, but for now just dealing with annoyances of moving a maximized window to a
-- new screen, toggling size and having it go back to the other screen
function clearMaximize(window)
  local id = window:id()
  previousSizes[id] = nil
end

-- ------------
-- Window hints for easily jumping between open windows
-- ------------
registerHotkey("Show window hints for window switching", hyper, '.', hs.hints.windowHints)

-- ------------
-- Grid based movement and resizing
-- ------------
hs.grid.setGrid("5x4")
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
registerHotkey("Set window layout - Comms", hyper, '9', function()
  hs.appfinder.appFromName("iTerm2"):mainWindow():setFullScreen(false)
  hs.timer.doAfter(1, function() -- delay is to allow un-fullscreen to finish
    hs.layout.apply({
      { "iTerm2", nil, "Color LCD", hs.layout.maximized, nil, nil },
      { "Spotify", nil, "Color LCD", hs.layout.left50, nil, nil },
      { "Todoist", nil, "Color LCD", hs.layout.right50, nil, nil },
      { "Firefox", nil, "Thunderbolt Display", hs.layout.left50, nil, nil },
      { "Slack", nil, "Thunderbolt Display", hs.layout.right50, nil, nil }
    })
    hs.appfinder.appFromName("iTerm2"):mainWindow():setFullScreen(true)
  end )
end)
-- Dev based layout
registerHotkey("Set window layout - Dev", hyper, '8', function()
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

local screenOne = hs.screen.primaryScreen()
local screenTwo = screenOne:next()

-- ------------
-- Arrange Chrome windows by profile, plus Claude and Notion placement
-- Chrome includes the profile name in window titles: "Page - ProfileName - Google Chrome"
-- ------------
local function arrangeChromeByProfile()
  local chrome = hs.application.get("Google Chrome")
  if chrome then
    for _, win in ipairs(chrome:allWindows()) do
      local title = win:title() or ""
      if title:find("Ben %(Work%)$") then
        -- Middle third, top half of screen one
        win:moveToScreen(screenOne)
        win:moveToUnit('[33,0,66,50]')
      elseif title:find("Ben %(Personal%)$") then
        -- Left half of screen two
        win:moveToScreen(screenTwo)
        win:moveToUnit('[0,0,50,100]')
      end
    end
  end

end
registerHotkey("Arrange Chrome windows by profile", hyper, 'c', arrangeChromeByProfile)
registerHotkey("Set window layout - HS/Etc Combo", hyper, '1', function()
  arrangeChromeByProfile()
  hs.layout.apply({
    -- Right third, full height
    { "iTerm2", nil, screenOne, '[66,0,100,100]', nil, nil },
    -- Middle third, bottom half
    { "Todoist", nil, screenOne, '[33,50,66,100]', nil, nil },
    -- Left third, from 33% to 66% height
    { "Discord", nil, screenOne, '[0,15,33,66]', nil, nil },
    -- Left third, from 66% to 100% height
    { "Messages", nil, screenOne, '[0,66,33,100]', nil, nil },
    -- Top-right corner of screen two
    { "Notion", nil, screenTwo, '[50,0,100,50]', nil, nil },
    { "Proton Mail", nil, screenTwo, '[50,0,100,50]', nil, nil },
    -- Bottom-right corner of screen two
    { "Claude", nil, screenTwo, '[50,50,100,100]', nil, nil },
  })
end)
