
turtle.refuel()
turtle.forward()

local data

function fuel()
    for i=0,15 do
        turtle.select(i)
        turtle.getSelectedSlot()
        data = turtle.getItemDetail()
        if data then
            print( "Item name: ", data.name)
        end
        
    end
    turtle.select(0)
end