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
                break
            end
        end
    end
    turtle.select(1)
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
        turtle.dig()
        turtle.forward()
        y = y + 1
        if y = max_y then
            y = 1
            turtle.turnRight()
            turtle.dig()
            turtle.forward()
            turtle.turnRight()
            x = x + 1
        end
        
    end

end

refuel()

travelPath( 15, 20 )
