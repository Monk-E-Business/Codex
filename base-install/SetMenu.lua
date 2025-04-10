local menuLib = require("core_libs.menuLib")
local menuTable = {}
menuLib.blankMenu(menuTable)
menuLib.createButton(menuTable, {2, 9}, {25, 13}, "Settings WIP!", colors.blue, menuLib.nothing, "Function")
while true do
    local event, button, x, y = os.pullEvent("mouse_click")
    if button == 1 then 
        if menuLib.exitMenu(x, y) then 
            break
        else
            menuLib.checkClick(x, y, menuTable)
        end
    end
end