*** Keywords ***

Checkout in your cart page
    # step 3: Check your product list in shopping cart 
    checkout_your_cart_page.Verify product details is same inventory page (Sauce Labs Fleece Jacket)
    checkout_your_cart_page.Verify product details is same inventory page (Sauce Labs Backpack)
    checkout_your_cart_page.Click Checkout Button
    # verify your information page
    checkout_information_page.Verify Your Information page is show