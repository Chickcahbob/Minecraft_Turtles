local block_exists, data

function getItem( index )
    turtle.select(index)
    turtle.getSelectedSlot()
    data = turtle.getItemDetail()
end

function placeSapling()
    for i=1,16 do
        getItem(i)
        if data then
            if string.find(data.name, "sapling") then
                turtle.up()
                turtle.placeDown()
                turtle.dig()
                turtle.forward()
                turtle.digDown()
                turtle.down()
                turtle.select(1)
                return true
            end
        end
    end
    turtle.select(1)

    return false
end

function chopLogs()

    block_exists, data = turtle.inspect()
    if block_exists then
        turtle.dig()
        if string.find( data.name, "log") then
            turtle.forward()
            for i = 1,4 do
                chopLogs()
                turtle.turnRight()
            end
        end
        turtle.back()
    end

    block_exists, data = turtle.inspectUp()
    if block_exists then
        turtle.digUp()
        turtle.up()
        chopLogs()
        turtle.down()
    end

end

function forward(x, y)
    
    saplingPlaced = false;

    block_exists, data = turtle.inspect()

    if block_exists then
        
        print( data.name )
        if string.find(data.name, "log") then

            chopLogs()

        else
            turtle.dig()
        end
    end

    if y % 3 == 2 and x % 3 == 1 then
        saplingPlaced = placeSapling()
    end

    if saplingPlaced == false then
        turtle.forward()
    end

end

function refuel()
    for i=1,16 do
        getItem(i)
        if data then
            if data.name == "minecraft:coal" or data.name == "minecraft:charcoal" then
                turtle.refuel()
            end
        end
    end
    turtle.select(1)
end

function travelPath( max_x, max_y)

    x = 1
    y = 1

    while( x < max_x and y < max_y ) do

        forward(x, y)
        y = y + 1

        if y == max_y and x < max_x - 1 then
            if x % 2 == 1 then
                y = 1
                turtle.turnRight()
                turtle.dig()
                turtle.forward()
                turtle.turnRight()
            else
                y = 1
                turtle.turnLeft()
                turtle.dig()
                turtle.forward()
                turtle.turnLeft()
            end
            x = x + 1
        end
        
    end


    if max_x % 2 == 0 then
        turtle.turnRight()
        turtle.turnRight()

        y = 1
        while( y < max_y ) do
            turtle.forward()
            y = y + 1
        end

    end

    turtle.turnRight()

    while( x > 1 ) do
        turtle.forward()
        x = x - 1
    end
    
    turtle.turnRight()

end

refuel()

travelPath( 13, 15 )