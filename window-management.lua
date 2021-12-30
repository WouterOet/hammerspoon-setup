local This = {}

local MAX = 12
local HALF = MAX / 2
local THIRD = 4

hs.grid.setGrid(MAX .. 'x' .. MAX)
hs.grid.setMargins({5, 5})
hs.window.animationDuration = 0

function This.windowPosition(cell)
    print("Cell " .. cell.x .. " " .. cell.y .. " " .. cell.w .. " " .. cell.h)
    local window = hs.window.focusedWindow()
    if window then
        local screen = window:screen()
        hs.grid.set(window, cell, screen)
    end
end

function This.windowMoveLeft()
    This.windowPosition({x = 0, y = 0, w = HALF, h = MAX})
end

function This.windowMoveRight()
    This.windowPosition({x = HALF, y = 0, w = HALF, h = MAX})
end

function This.windowMaximize()
    local window = hs.window.focusedWindow()
    if window then
        window:maximize()
    end
end

function This.windowMoveLeftThird()
    This.windowOffset(0)
end

function This.windowMoveMidThird()
    This.windowOffset(THIRD)
end

function This.windowMoveRightThird()
    This.windowOffset(2 * THIRD)
end

function This.windowOffset(x)
    local cell = { x = x, y = 0, w = THIRD, h = MAX}
    This.windowPosition(cell)
end

return This;