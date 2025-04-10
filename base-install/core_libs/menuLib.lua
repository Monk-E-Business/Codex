local menuLib = {}

--
function menuLib.createButton(menuTable, topLeft_XY, botRight_XY, text, color, activate, buttonType, reload)
    centerPos = {}
    -- Add button to the table of menu interactables for click detection
    if reload == nil then
        table.insert(menuTable, {buttonType, topLeft_XY, botRight_XY, activate, text, color})
    end
    -- Draw the colored box for the button
    paintutils.drawFilledBox(topLeft_XY[1], topLeft_XY[2], botRight_XY[1], botRight_XY[2], color)
    -- Calculate where in the box the text should go to be centered
    textLen = string.len(text)
    centerPos[1] = (topLeft_XY[1] + botRight_XY[1]) / 2
    centerPos[2] = (topLeft_XY[2] + botRight_XY[2]) / 2
    centerPos[1] = centerPos[1] - (textLen / 2)
    centerPos[1] = math.ceil(centerPos[1])
    centerPos[2] = math.ceil(centerPos[2])
    -- Center and print the text there
    term.setCursorPos(centerPos[1], centerPos[2])
    print(text)
    -- Insert Function Trigger Here
end

--
function menuLib.checkClick(x, y, menuTable)
    for menuCount = 1, #menuTable do
        if (x >= menuTable[menuCount][2][1] and y >= menuTable[menuCount][2][2]
            and x <= menuTable[menuCount][3][1] and y <= menuTable[menuCount][3][2]) then
            if menuTable[menuCount][1] == "Program" then
                shell.run(menuTable[menuCount][4]) 
                return "Program"
            elseif menuTable[menuCount][1] == "Function" then
                menuTable[menuCount][4]() 
                return "Function"
            else
                error("Invalid activation type: " .. menuTable[menuCount][4])
            end
        end
    end
end

--
function menuLib.exitMenu(x, y)
    if (x == 1 or x == 2) and y == 1 then
        return true 
    else
        return false 
    end
end

--
function menuLib.reload(menuTable)
    for menuCount = 1, #menuTable do
        menuLib.createButton(menuTable, menuTable[menuCount][2], menuTable[menuCount][3], menuTable[menuCount][5], 
        menuTable[menuCount][6], menuTable[menuCount][4], menuTable[menuCount][1], true)
    end
end

--
function menuLib.blankMenu(menuTable)
    term.setBackgroundColor(colors.black)
    term.clear()
    menuLib.createButton(menuTable, {1, 1}, {26, 1}, " ", colors.gray, menuLib.nothing, "Function")
    menuLib.createButton(menuTable, {1, 1}, {2, 1}, "<=", colors.red, menuLib.nothing, "Function")
end

--
function menuLib.nothing()
    -- Does nothing... what did you expect?
end


return menuLib