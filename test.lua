local data

function fuel()
    for i=1,16 do
        turtle.select(i)
        turtle.getSelectedSlot()
        data = turtle.getItemDetail()
        if data then
            if data.name == "minecraft:coal" or data.name == "minecraft:charcoal" then
                turtle.refuel()
            end
        end
    end
    turtle.select(1)
end

fuel()