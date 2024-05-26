*** Keywords ***

Add product to shopping cart in inventory page
    # check cart empty
    set_count_cart.Set Count Cart
    #step 2: Add product to shopping cart in inventory page
    inventory_page.Add item = ${Test_Data.step_02_verify_inventory_page.data_test.sauce_labs_backpack.title}               ${Test_Data.step_02_verify_inventory_page.data_test.sauce_labs_backpack.price}
    inventory_page.Add item = ${Test_Data.step_02_verify_inventory_page.data_test.sauce_labs_fleece_jacket.title}          ${Test_Data.step_02_verify_inventory_page.data_test.sauce_labs_fleece_jacket.price}
    # inventory_page.Add Sauce Labs Fleece Jacket 1 ea
    inventory_page.Click shopping cart
    # verify "Your Cart" page is show
    checkout_your_cart_page.Verify Your Cart page is show
