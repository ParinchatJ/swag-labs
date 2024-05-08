*** Settings ***
Library           SeleniumLibrary


*** Keywords ***

#* Complete page
#step 6: Verify Checkout: Complete! page
Verify Checkout: Complete page
    #step 6.1: Varify Text "Checkout: Complete!" is show 
    Wait Until Element Is Visible       //div[@class='header_secondary_container']//span[@class='title']
    Element Text Should Be              //div[@class='header_secondary_container']//span[@class='title']                Checkout: Complete!
    #step 6.2: Verify The shopping cart is Empty
    Element Should Not Be Visible       //span[@class='shopping_cart_badge']                                            #? เช็คว่า span tag ไม่ขึ้น = ไม่มีสินค้าอยู่ในตะกร้า                                    
    #step 6.3: Verify image is show
    Wait Until Element Is Visible      //div[@id='checkout_complete_container']//img[@class='pony_express']
    Page Should Contain Image           //div[@id='checkout_complete_container']//img[@class='pony_express']
    #step 6.4: Verify text "Thank you for your order!" is show in the middle page
    Element Text Should Be              //div[@id='checkout_complete_container']//h2[@class='complete-header']                      Thank you for your order!
    #step 6.5: Verify "Back Home" button is show
    Page Should Contain Button          id=back-to-products