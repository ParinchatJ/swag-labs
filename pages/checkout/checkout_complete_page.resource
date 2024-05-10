*** Keywords ***

#step 6: Verify Checkout: Complete! page
Verify Checkout: Complete page
    #step 6.1: Varify Text "Checkout: Complete!" is show 
    Wait Until Element Is Visible           //span[@class='title'][text()='Checkout: Complete!']
    #step 6.2: Verify The shopping cart is Empty
    Element Should Not Be Visible           //span[@class='shopping_cart_badge']                                                        
    #step 6.3: Verify image is show
    Wait Until Element Is Visible           //div[@id='checkout_complete_container']//img[@class='pony_express']
    #step 6.4: Verify text "Thank you for your order!" is show in the middle page
    Wait Until Element Is Visible           //div[@id='checkout_complete_container']//h2[text()='Thank you for your order!']                     
    #step 6.5: Verify "Back Home" button is show
    Page Should Contain Button              id=back-to-products
    Screenshot