function card(control)
    turtle.select(1)
    if control == "take" then
        if turtle.suck() == true then
            return("completed")
    elseif control == "return" then
        if turtle.drop() == true then
            return("errored")
        end
    end
end

