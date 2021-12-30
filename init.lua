local hyper = require('hyper')
local window = require("window-management")

hyper.install('F18')

-- Quick Reloading of Hammerspoon
hyper.bindKey('r', hs.reload)

hyper.bindKey("t", function()
	local time = os.date("%A, %d %B %Y, %H:%M")
	hs.alert.show(time)
end)

hyper.bindShiftKey("t", function()
	local time = os.date("%Y%m%d")
	hs.alert.show(time)
end)

hyper.bindKey("a", function()
	hs.spotify.previous()
end)
hyper.bindKey("s", function()
	hs.spotify.playpause()
end)
hyper.bindKey("d", function()
	hs.spotify.next()
end)
hyper.bindKey("f", function()
	local message = hs.spotify.getCurrentArtist() .. ": " .. hs.spotify.getCurrentTrack()
	local success, object, descriptor = hs.osascript.applescript("tell application \"Spotify\" to artwork url of the current track")
	if success then
	    hs.alert.showWithImage(message, hs.image.imageFromURL(object):setSize({h = 200, w = 200}))
    else
	    hs.alert.show(message)
	end
end)

hyper.bindKey('left', window.windowMoveLeft)
hyper.bindKey('right', window.windowMoveRight)
hyper.bindKey('up', window.windowMaximize)
hyper.bindShiftKey('left', window.windowMoveLeftThird)
hyper.bindShiftKey('up', window.windowMoveMidThird)
hyper.bindShiftKey('right', window.windowMoveRightThird)

hyper.pauzedBindKey('m', function()
    hs.eventtap.keyStrokes("emailaddress")
end)

