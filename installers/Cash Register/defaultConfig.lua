theme = { -- color scheme
    itemBG = colors.white,
    itemButt = colors.lightGray,
    catBG = colors.lightGray,
    catSel = colors.gray,
    text = colors.white,
    checkout = colors.gray,
    logo = colors.black,
    
    businessName = {  -- configure business name on register screen
        line1 = "",
        line2 = "Business",
        line3 = "Name",
        line4 = ""
    }
}

recieptConfig = { -- Reciept printing customisable bits
    name = "<business name>",
    msgLines = {
        "Thank you for shoppings",
        "at <business name>!",
    }
}

items = {
    {
        title = "Category 1",
        items = {"item 1", "item 2", "item 3"},
        prices = {500, 500, 1000}
    },

    {
        title = "Category 2",
        items = {"item 4", "item 5", "item 6"},
        prices = {1500, 2000, 2500}
    },

    {
        title = "Discounts",
        items = {"Y50 off", "2 for 1 drinks"},
        prices = {-50, -500}
    }
}