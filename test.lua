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

refuel()

placeSapling()