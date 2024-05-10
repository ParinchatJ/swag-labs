*** Keywords ***

Add product to shopping cart in inventory page
    # check cart empty
    set_count_cart.Set Count Cart
    #step 2: Add product to shopping cart in inventory page
    inventory_page.Add Sauce Labs Backpack 1 ea
    inventory_page.Add Sauce Labs Fleece Jacket 1 ea
    inventory_page.Click shopping cart
    # verify "Your Cart" page is show
    checkout_your_cart_page.Verify Your Cart page is show
