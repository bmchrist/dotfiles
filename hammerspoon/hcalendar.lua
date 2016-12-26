hcalbgcolor = {red=0,blue=0,green=0,alpha=0.4}
hcaltitlecolor = {red=1,blue=1,green=1,alpha=0.5}
offdaycolor = {red=255/255,blue=120/255,green=120/255,alpha=1}
hcaltodaycolor = {red=1,blue=1,green=1,alpha=0.2}
midlinecolor = {red=1,blue=1,green=1,alpha=0.5}
midlinetodaycolor = {red=0,blue=1,green=186/255,alpha=0.8}
midlineoffcolor = {red=1,blue=119/255,green=119/255,alpha=0.5}
weeknames = {"Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"}

HCalendar = {}
HCalendar.__index = HCalendar

function HCalendar.create(screen)
  local hcal = {}
  setmetatable(hcal, HCalendar)

  hcal.topleft = {screen:frame().x + 40, 658}

  hcal.titlewh = {180,32}
  hcal.daywh = {23.43,24}

  hcal:update()

  return hcal
end

function HCalendar:update()
  local currentmonth = os.date("%m")
  local currentyear = os.date("%Y")
  local firstdayofnextmonth = os.time{year=currentyear, month=currentmonth+1, day=1}
  self.maxdayofcurrentmonth = os.date("*t", firstdayofnextmonth-24*60*60).day

  self:buildTitle()
  self:buildDates()
  self:buildBackground()
  self:highlightWeekends()
  self:selectToday()
end

function HCalendar:buildTitle()
  if self.hcaltitle then
  else
    local styledtitle = hs.styledtext.new("init",{font={size=18},color=hcaltitlecolor,paragraphStyle={alignment="left"}})
    local title_rect = hs.geometry.rect(self.topleft[1]+10,self.topleft[2]+15,self.titlewh[1],self.titlewh[2])
    self.hcaltitle = hs.drawing.text(title_rect,styledtitle)
    self.hcaltitle:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    self.hcaltitle:setLevel(hs.drawing.windowLevels.desktopIcon)
    self.hcaltitle:show()
  end

  local titlestr = os.date("%B %Y")
  self.hcaltitle:setText(titlestr)
end

function HCalendar:updateTitle()
end

function HCalendar:buildDates()
  local styledcaltext = hs.styledtext.new("init",{font={name="Courier-Bold",size=13},paragraphStyle={lineSpacing=8.0}})
  local caltextrect = hs.geometry.rect(self.topleft[1]+10,self.topleft[2]+15+self.titlewh[2],self.daywh[1]*self.maxdayofcurrentmonth,43)

  if self.hcaltextdraw then
  else
    self.hcaltextdraw = hs.drawing.text(caltextrect,styledcaltext)
    self.hcaltextdraw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    self.hcaltextdraw:setLevel(hs.drawing.windowLevels.desktopIcon)
    self.hcaltextdraw:show()
  end

  weekdayup = ""
  daydown = ""
  offday = {}

  local currentyear = os.date("%Y")
  local currentmonth = os.date("%m")

  for i=1,self.maxdayofcurrentmonth do
    local weekdayofquery = os.date("*t", os.time{year=currentyear, month=currentmonth, day=i}).wday
    local weekstr = weeknames[weekdayofquery]
    weekdayup = weekdayup .. weekstr .. ' '
    daydown = daydown .. string.format('%2s',i)..' '
    if weekstr == 'Sa' or weekstr == 'Su' then
      table.insert(offday,{i,weekstr..'\n'..string.format('%2s',i)})
    end
  end

  local caltext = weekdayup..'\n'..daydown
  self.hcaltextdraw:setText(caltext)
end

function HCalendar:buildBackground()
  local midlinerect = hs.geometry.rect(self.topleft[1]+10,self.topleft[2]+15+self.titlewh[2]+20,self.daywh[1]*self.maxdayofcurrentmonth-3,4)

  if self.midlinedraw then
    self.midlinedraw:setFrame(midlinerect)
  else
    self.midlinedraw = hs.drawing.rectangle(midlinerect)
    self.midlinedraw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    self.midlinedraw:setLevel(hs.drawing.windowLevels.desktopIcon)
    self.midlinedraw:setFillColor(midlinecolor)
    self.midlinedraw:setStroke(false)
    self.midlinedraw:show()
  end

  local hcalbgrect = hs.geometry.rect(self.topleft[1],self.topleft[2],self.daywh[1]*self.maxdayofcurrentmonth+20-3,102)
  if self.hcalbg then
    self.hcalbg:setFrame(hcalbgrect)
  else
    self.hcalbg = hs.drawing.rectangle(hcalbgrect)
    self.hcalbg:setFillColor(hcalbgcolor)
    self.hcalbg:setStroke(false)
    self.hcalbg:setRoundedRectRadii(10,10)
    self.hcalbg:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    self.hcalbg:setLevel(hs.drawing.windowLevels.desktopIcon)
    self.hcalbg:show()
  end
end

function HCalendar:highlightWeekends()
  -- TODO see if something is only needed on initial create
  if self.offday_holder and #self.offday_holder > 0 then
    for i=1,#self.offday_holder do
      self.offday_holder[i]:delete()
      self.offdaymidline_holder[i]:delete()
    end
  end

  self.offday_holder = {}
  self.offdaymidline_holder = {}
  for i=1,#offday do
    local offdayrect = hs.geometry.rect(self.topleft[1]+10+self.daywh[1]*(offday[i][1]-1),self.topleft[2]+15+self.titlewh[2],self.daywh[1],43)
    local offdaytext = hs.styledtext.new(offday[i][2],{font={name="Courier-Bold",size=13},color=offdaycolor,paragraphStyle={lineSpacing=8.0}})
    table.insert(self.offday_holder,hs.drawing.text(offdayrect,offdaytext))
    self.offday_holder[i]:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    self.offday_holder[i]:setLevel(hs.drawing.windowLevels.desktopIcon)
    self.offday_holder[i]:show()
    self.offdaymidlinerect = hs.geometry.rect(self.topleft[1]+10+self.daywh[1]*(offday[i][1]-1)-3,self.topleft[2]+15+self.titlewh[2]+20,self.daywh[1],4)
    table.insert(self.offdaymidline_holder,hs.drawing.rectangle(self.offdaymidlinerect))
    self.offdaymidline_holder[i]:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    self.offdaymidline_holder[i]:setLevel(hs.drawing.windowLevels.desktopIcon)
    self.offdaymidline_holder[i]:setFillColor(midlineoffcolor)
    self.offdaymidline_holder[i]:setStroke(false)
    self.offdaymidline_holder[i]:show()
  end
end

function HCalendar:selectToday()
  local today = math.tointeger(os.date("%d"))
  local todayrect = hs.geometry.rect(self.topleft[1]+10+self.daywh[1]*(today-1)-3,self.topleft[2]+15+self.titlewh[2],self.daywh[1],43)
  if not self.todaydraw then
    self.todaydraw = hs.drawing.rectangle(todayrect)
    self.todaydraw:setFillColor(hcaltodaycolor)
    self.todaydraw:setStroke(false)
    self.todaydraw:setRoundedRectRadii(3,3)
    self.todaydraw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    self.todaydraw:setLevel(hs.drawing.windowLevels.desktopIcon)
    self.todaydraw:show()
  else
    self.todaydraw:setFrame(todayrect)
  end

  local todaymidlinerect = hs.geometry.rect(self.topleft[1]+10+self.daywh[1]*(today-1)-3,self.topleft[2]+15+self.titlewh[2]+20,self.daywh[1],4)
  -- Don't know why the draw order is not correct
  if self.todaymidlinedraw then
    self.todaymidlinedraw:delete()
    self.todaymidlinedraw=nil
  end
  self.todaymidlinedraw = hs.drawing.rectangle(todaymidlinerect)
  self.todaymidlinedraw:setFillColor(midlinetodaycolor)
  self.todaymidlinedraw:setStroke(false)
  self.todaymidlinedraw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
  self.todaymidlinedraw:setLevel(hs.drawing.windowLevels.desktopIcon)
  self.todaymidlinedraw:show()
end

-- TODO: reset when screens change
local calendars = {}
for k,screen in pairs(hs.screen.allScreens()) do
  calendars[k] = HCalendar.create(screen)
end

hcaltimer = hs.timer.doEvery(1800, function()
  for k,calendar in pairs(calendars) do
    calendar:update()
  end
end)
