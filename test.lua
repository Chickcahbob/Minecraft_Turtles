local data

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

        print( "X: "..x.." ".."Y: "..y)

        if x % 2 == 1 and y % 2 == 0 and y < max_y then
            if placeSapling() then
                y = y + 1
            end
        end

        turtle.dig()
        turtle.forward()
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