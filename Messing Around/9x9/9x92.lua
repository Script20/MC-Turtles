-- Variables IGNORE --
slot = 1
local sslot = 1
local Stage = "Waiting"
local State = "ideling"
 
-- Display Setup --
term.clear()
term.setCursorPos(1,1)
 
print("Script's 9x9 House Building")
print("")
print("Slots 1-6 = Walls")
print("Slot  9   = Glass")
print("Slot  10  = Door")
print("Slot  16  = Ender Chest- Black Black Black")
print("")
print("Press any key to start")
io.read()
 
-- Util functions
 
function checkFuel()
    State = "checkFuel()"
    displayInfo()
    if(turtle.getFuelLevel() < 100) then
        turtle.select(getItemIndex("enderstorage:ender_chest"))
        turtle.digUp()
        turtle.placeUp()
        turtle.select(15)
        turtle.suckUp()
        turtle.refuel()
        turtle.dropUp()
        turtle.digUp()
        turtle.select(1)
    end
    return true
end
 
function getItemIndex(itemName)
    for slot = 1, slot, 1 do
        local item = turtle.getItemDetail(slot)
        if(item ~= nil) then
            if(item["name"] == itemName) then
                return slot
            end
        end
    end
end
 
function checkSlot()
    while turtle.getItemCount(sslot) < 3 do
        sslot = (sslot%16)+1
        turtle.select(sslot)
    end
end
 
function forwardPlace()
    checkSlot()
    State = "forwarPlace()"
    displayInfo()
    turtle.forward()
    turtle.placeDown()
end
 
function glassPlace()
    turtle.select(9)
    forwardPlace()
end
 
function cobblePlace()
    turtle.select(sslot)
    forwardPlace()
end
 
function turnRight()
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
end

function turnLeft()
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
end

-- Main Functions
 
function floor()
    checkSlot()
    Stage = "Building floor"
    displayInfo()
 
    for x=1, 6, 1 do
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
    end
    turtle.digDown()
    turtle.placeDown()
 
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
    
    for x=1, 6, 1 do
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
    end
    turtle.digDown()
    turtle.placeDown()
 
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
 
    for x=1, 6, 1 do
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
    end
    turtle.digDown()
    turtle.placeDown()
 
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
 
    for x=1, 6, 1 do
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
    end
    turtle.digDown()
    turtle.placeDown()
 
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
 
    for x=1, 6, 1 do
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
    end
    turtle.digDown()
    turtle.placeDown()
 
    turtle.turnRight()
    turtle.forward()
    turtle.turnRight()
 
    for x=1, 6, 1 do
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
    end
    turtle.digDown()
    turtle.placeDown()
 
    turtle.turnLeft()
    turtle.forward()
    turtle.turnLeft()
 
    for x=1, 6, 1 do
        turtle.digDown()
        turtle.placeDown()
        turtle.forward()
    end
    turtle.digDown()
    turtle.placeDown()
    
    turtle.turnRight()
    turtle.turnRight()
    for x=1, 8, 1 do
        turtle.forward()
    end 

    turtle.turnRight()
    for x=1, 7, 1 do
        turtle.forward()
    end 
    turtle.turnRight()
end
 
function wall1()
    checkSlot()
    Stage = "Building Walls"
    displayInfo()
    turtle.up()
    for x=1, 9, 1 do
        forwardPlace()
    end
    turtle.turnRight()
    for x=1, 3, 1 do
        for x=1, 8, 1 do
            forwardPlace()
        end
        if x < 3 then
            turtle.turnRight()
        end
    end
    turtle.turnRight()
end
 
function wall2()
    checkSlot()
    Stage = "Building Walls"
    displayInfo()
    turtle.up()
    for x=1, 9, 1 do
        if x > 1 then
            turtle.forward()
        end
        turtle.placeDown()
    end
    turtle.turnRight()
 
    for x=1, 3, 1 do
        for x=1, 8, 1 do
            forwardPlace()
        end
        if x < 3 then
            turtle.turnRight()
        end
    end
    turtle.turnRight()
end
 
function roof()
    checkSlot()
    Stage = "Building Roof"
    turtle.forward()
    turtle.turnRight()
    displayInfo()
 
    for x=1, 7, 1 do
        forwardPlace()
    end
 
    turtle.turnLeft()
 
    for x=1, 2, 1 do
        for x=1, 6, 1 do
            forwardPlace()
        end
        turtle.turnLeft()
    end
 
    for x=1, 5, 1 do
        forwardPlace()
    end
 
    turtle.turnLeft()
 
    for x=1, 2, 1 do
        glassPlace()
    end
 
    cobblePlace()
 
    for x=1, 2, 1 do
        glassPlace()
    end
 
    turtle.turnLeft()
    glassPlace()
 
    cobblePlace()
    for x=1, 2, 1 do
        turtle.select(9)
        glassPlace()
    end
 
    turtle.turnLeft()
    glassPlace()
    cobblePlace()
 
    for x=1, 2, 1 do
        glassPlace()
    end
 
    for x=1, 2, 1 do
        turtle.turnLeft()
        glassPlace()
        cobblePlace()
        glassPlace()
    end
 
    for x=1, 2, 1 do
        turtle.turnLeft()
        cobblePlace()
        glassPlace()
    end
 
    for x=1, 2, 1 do
        turtle.turnLeft()
        cobblePlace()
    end
end
 
function door()
    checkSlot()
    Stage = "Adding Door"
    displayInfo()
    turtle.turnRight()
    for x=1, 5, 1 do
        turtle.forward()
    end
    for x=1, 4, 1 do
        turtle.down()
    end
    turtle.turnLeft()
    turtle.turnLeft()
    turtle.dig()
    turtle.down()
    turtle.dig()
    turtle.select(10) -- Door Selection
    turtle.place()
end
 
function displayInfo()
    term.clear()
    term.setCursorPos(1,1)
    print("Program Started: ")
    print("")
    print('Current Stage: ' .. Stage)
    print('Current State: ' .. State)
end
 
-- Programing Running

term.clear()
term.setCursorPos(1,1)
print("Checking inventory...")
for i = 1, 11, 1 do
    turtle.select(i)
    data = turtle.getItemDetail(i)
    if turtle.getItemCount(i) > 0 then
        print(data)
        if i >= 1 and i <= 8 then
            if data.name == 'minecraft:cobblestone' then
                print("Slot " .. i .. " doesn't contain cobblestone")
                print("Slot " .. i .. " doesn't contain " .. data.name)
                return
            end
        end
        
        if i == 9 then
            if data.name == 'minecraft:glass' then
                return true 
            else
                print("Slot " .. i .. " doesn't contain glass")
                print("Slot " .. i .. " doesn't contain " .. data.name)
                return
            end
        end
 
        if i == 10 then
            if data.name == 'minecraft:oak_door' then
                return true 
            else
                print("Slot " .. i .. " doesn't contain door")
                print("Slot " .. i .. " doesn't contain " .. data.name)
                return
            end
        end
 
        if i == 11 then
            if data.name == 'enderstorage:ender_chest' then
                return true 
            else
                print("Slot " .. i .. " doesn't contain Ender Chest")
                print("Slot " .. i .. " doesn't contain " .. data.name)
                return
            end
        end
 
    else
        if i >= 1 and i <= 8 then
            print("Slot " .. i .. " doesn't contain cobblestone")
            else if i == 9 then 
            print("Slot " .. i .. " doesn't contain glass")
            else if i == 10 then
            print("Slot " .. i .. " doesn't contain door")
            else if i == 11 then 
            print("Slot " .. i .. " doesn't contain Ender Chest")
            end
            end 
            end 
            end 
        end 
end

checkFuel()
-- floor()
-- wall1()
checkSlot()
displayInfo()
-- for x=1, 4, 1 do
--     wall2()
--     checkSlot()
--     displayInfo()
-- end
roof()
--door()
term.clear()
term.setCursorPos(1,1)
print("9x9 Completed!")