local This = {}

-- Global Variable for Hyper Mode
-- Note: This actually programs Hyper Mode to the usage of F17 rather than F18. The F18 key is later used
-- to be able to switch Hyper mode on and off. At first I thought this was a typo from the original example,
-- but turning this into F18 causes the Hyper Mode to be extremely jittery (i.e. it gets turned on and off almost
-- immediately at every keypress)
local log = require'hs.logger'.new('hyper','info')

This.hyperMode = hs.hotkey.modal.new({}, 'F17')
-- This.hyperMode:entered = function()
--     log.i("Enter Model")
-- end
-- This.hyperMode:exited = function()
--     log.i("Exit Model")
-- end

function This.bindKey(key, handler)
   This.hyperMode:bind({}, key, function()
	 handler()
	 log.i("Done with handler for " .. key)
   end)
end

function This.pauzedBindKey(key, handler)
    This.hyperMode:bind({}, key, function()
        exitHyperMode()
        handler()
        enterHyperMode()
    end)
end

function This.bindShiftKey(key, handler)
   This.hyperMode:bind({'shift'}, key, function()
	 handler()
   end)
end

function This.bindKeyWithModifiers(key, mods, handler)
   This.hyperMode:bind(mods, key, function()
	 handler()
   end)
end

-- Enter Hyper Mode when F18 (Hyper) is pressed
function enterHyperMode()
   This.hyperMode:enter()
   log.i("enter")
end

-- Leave Hyper Mode when F18 (Hyper) is pressed
function exitHyperMode()
   log.i("exit 1")
   This.hyperMode:exit()                       
   log.i("exit 2")
end

function This.install(hotKey)
  hs.hotkey.bind({},                        hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"shift"},                 hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"ctrl"},                  hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"ctrl", "shift"},         hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd"},                   hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd", "shift"},          hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd", "ctrl"},           hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"cmd", "ctrl", "shift"},  hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt"},                   hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "shift"},          hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "ctrl"},           hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "ctrl", "shift"},  hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "cmd"},            hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "shift"},   hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "ctrl"},    hotKey, enterHyperMode, exitHyperMode)
  hs.hotkey.bind({"alt", "cmd", "shift", "ctrl"}, hotKey, enterHyperMode, exitHyperMode)
end


return This