local menuLib = require("core_libs.menuLib")
local menuTable = {}
term.clear()
menuLib.createButton(menuTable, {1, 1}, {26, 1}, "CODEX              v0.1", colors.gray, menuLib.nothing, "Function")
menuLib.createButton(menuTable, {2, 3}, {25, 7}, "Applications", colors.red, "AppMenu", "Program")
menuLib.createButton(menuTable, {2, 9}, {25, 13}, "App Library", colors.green, "LibMenu", "Program")
menuLib.createButton(menuTable, {2, 15}, {25, 19}, "Settings", colors.blue, "SetMenu", "Program")
while true do
    local event, button, x, y = os.pullEvent("mouse_click")
    if button == 1 then
        if menuLib.checkClick(x, y, menuTable) == "Program" then
            menuLib.reload(menuTable)
        end
    end
end