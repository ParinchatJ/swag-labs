*** Keywords ***

Checkout in your cart page
    # step 3: Check your product list in shopping cart 
    checkout_your_cart_page.Verify product details is same inventory page = ${Test_Data.step_02_verify_inventory_page.data_test.sauce_labs_backpack.title}              ${Test_Data.step_02_verify_inventory_page.data_test.sauce_labs_backpack.price}                  id=remove-sauce-labs-backpack
    checkout_your_cart_page.Verify product details is same inventory page = ${Test_Data.step_02_verify_inventory_page.data_test.sauce_labs_fleece_jacket.title}         ${Test_Data.step_02_verify_inventory_page.data_test.sauce_labs_fleece_jacket.price}             id=remove-sauce-labs-fleece-jacket
    checkout_your_cart_page.Click Checkout Button
    # verify your information page
    checkout_information_page.Verify Your Information page is show