*** Variables ***

&{dict_checkout_complete_page}
...     complete_text=//span[@class='title'][text()='Checkout: Complete!']
...     cart_number=//span[@class='shopping_cart_badge']
...     image=//div[@id='checkout_complete_container']//img[@class='pony_express']
...     text_h2=//div[@id='checkout_complete_container']//h2[text()='Thank you for your order!']
...     back_home_bt=id=back-to-products


*** Keywords ***

#step 6: Verify Checkout: Complete! page
Verify Checkout: Complete page
    #step 6.1: Varify Text "Checkout: Complete!" is show 
    Wait Until Element Is Visible           ${dict_checkout_complete_page}[complete_text]
    #step 6.2: Verify The shopping cart is Empty
    Element Should Not Be Visible           ${dict_checkout_complete_page}[cart_number]                                                       
    #step 6.3: Verify image is show
    Wait Until Element Is Visible           ${dict_checkout_complete_page}[image] 
    #step 6.4: Verify text "Thank you for your order!" is show in the middle page
    Wait Until Element Is Visible           ${dict_checkout_complete_page}[text_h2]                      
    #step 6.5: Verify "Back Home" button is show
    Page Should Contain Button              ${dict_checkout_complete_page}[back_home_bt]  
    Screenshot