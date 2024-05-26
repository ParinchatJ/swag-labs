*** Variables ***

&{dict_checkout_your_cart_page}
...     your_cart_text=//div[@class='header_secondary_container']//span[text()='Your Cart']
...     shopping_cart_number=//span[@class='shopping_cart_badge'][text()='2']
...     checkout_bt=id=checkout


*** Keywords ***

#step 3.2: Verify "Your Cart" page is show
Verify Your Cart page is show
    #step 3.2.1: Varify Text "Your Cart" is show
    Wait Until Element Is Visible       ${dict_checkout_your_cart_page}[your_cart_text]
    #step 3.2.2: Verify 2 item is in the shopping cart
    Wait Until Element Is Visible       ${dict_checkout_your_cart_page}[shopping_cart_number]                                                                            
    #!step 3.2.3: Verify product card that you choose is show = 2   

#step 3.3: Verify product details is same inventory page (Sauce Labs Backpack)
Verify product details is same inventory page = ${title}
    [Arguments]        ${price}         ${remove_bt}
    #step 3.3.1: Verify QTY is 1
    Wait Until Element Is Visible       //div[@class='cart_item' and .//div[text()='${title}']]//*[@class='cart_quantity']  
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${title}']]//*[@class='cart_quantity']                              1
    #step 3.3.2: Verify title in Sauce Labs Backpack card
    Wait Until Element Is Visible       //div[@class='cart_item' and .//div[text()='${title}']]             
    #step 3.3.3: Verify Price in Sauce Labs Backpack card 
    Wait Until Element Is Visible       //div[@class='cart_item' and .//div[text()='${title}']]//*[text()='$' and text() = '${price}']                      
    #step 3.3.4: Verify Remove button in Sauce Labs Backpack card
    Page Should Contain Button          ${remove_bt}                                Remove
    Screenshot

Click Checkout Button
    Click Button                        ${dict_checkout_your_cart_page}[checkout_bt]