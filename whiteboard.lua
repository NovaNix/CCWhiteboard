term.clear()

term.setCursorPos(1, 1)
term.setTextColor(colors.yellow)
print("CCWhiteboard")
print("https://github.com/NovaNix/CCWhiteboard")

-- Setup the Color Palette Monitor

local palette = peripheral.wrap("top")
term.redirect(palette)

boardPalette = {colors.black, colors.red, colors.blue, colors.green, colors.white}

paintutils.drawLine(1,1,7,1,boardPalette[1])
paintutils.drawLine(1,2,7,2,boardPalette[2])
paintutils.drawLine(1,3,7,3,boardPalette[3])
paintutils.drawLine(1,4,7,4,boardPalette[4])
paintutils.drawLine(1,5,7,5,boardPalette[5])

paintutils.drawLine(1,1,1,5,boardPalette[1])

-- Setup the Whiteboard Monitor

local board = peripheral.wrap("left")
term.redirect(board)

board.setCursorPos(1,1)

board.setTextScale(1)

board.setBackgroundColor(colors.white)
board.setTextColor(colors.black)
board.clear()

board.write("Draw Something!")

local currentColor = boardPalette[1]

-- Allow drawing

while true do
    local event, side, x, y = os.pullEvent("monitor_touch")
    if side == "top" then
        currentColor = boardPalette[y]
        term.redirect(palette)
        paintutils.drawLine(1,1,1,5,currentColor)
    else
        term.redirect(board)
        paintutils.drawPixel(x,y,currentColor)
    end
end