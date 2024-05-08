*** Settings ***
Library           SeleniumLibrary

*** Keywords ***

#* Your Cart page
#step 3.2: Verify "Your Cart" page is show
Verify Your Cart page is show
    #step 3.2.1: Varify Text "Your Cart" is show
    Wait Until Element Is Visible       //div[@class='header_secondary_container']//span[@class='title']
    Element Text Should Be              //div[@class='header_secondary_container']//span[@class='title']              Your Cart
    #step 3.2.2: Verify 2 item is in the shopping cart
    Wait Until Element Is Visible              //span[@class='shopping_cart_badge'][text()='2']                                                                             #? เช็คว่ามี 2 ค่าอยู่ในตะกร้า
    #step 3.2.3: Verify product card that you choose is show = 2   
    ${count}                            Get Element Count                                                   //div[@class='cart_item']                                   #? เช็คว่า card item ขึ้นมา 2 อัน                                            
    Should Be True                      ${count} == 2

#step 3.3: Verify product details is same inventory page (Sauce Labs Backpack)
Verify product details is same inventory page (Sauce Labs Backpack)
    #step 3.3.1: Verify QTY is 1
    Wait Until Element Is Visible       //div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//*[@class='cart_quantity']
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//*[@class='cart_quantity']            1
    #step 3.3.2: Verify title in Sauce Labs Backpack card
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//div[@class='inventory_item_name']                                                 ${product_sauce_labs_backpack}[title]
    #step 3.3.3: Verify Price in Sauce Labs Backpack card 
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//div[@class='inventory_item_price']       $${product_sauce_labs_backpack}[price]                                 
    #step 3.3.4: Verify Remove button in Sauce Labs Backpack card
    Page Should Contain Button          id=remove-sauce-labs-backpack                                                       Remove

#step 3.4: Verify product details is same inventory page (Sauce Labs Fleece Jacket)
Verify product details is same inventory page (Sauce Labs Fleece Jacket)
    #step 3.4.1: Verify QTY is 1
    Wait Until Element Is Visible       //div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//*[@class='cart_quantity']
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//*[@class='cart_quantity']       1
    #step 3.4.2: Verify title in Sauce Labs Fleece Jacket card 
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//div[@class='inventory_item_name']                                            ${product_sauce_labs_fleece_jacket}[title]
    #sstep 3.4.3: Verify Price in Sauce Labs Fleece Jacket card 
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//div[@class='inventory_item_price']                     $${product_sauce_labs_fleece_jacket}[price]                               
    #step 3.4.4: Verify Remove button in Sauce Labs Fleece Jacket card
    Page Should Contain Button          id=remove-sauce-labs-fleece-jacket                                                  Remove

#step 3.6: Verify "Checkout: Your Information" page is show
Verify Your Information page is show
    #step 3.6.1: Varify Text "Checkout: Your Information" is show
    Wait Until Element Is Visible        //div[@class='header_secondary_container']//span[@class='title']
    Element Text Should Be               //div[@class='header_secondary_container']//span[@class='title']                         Checkout: Your Information
    #step 3.6.2: Verify Checkout information form is show 
    Page Should Contain Element          //div[@class='checkout_info_container']//div[@class='checkout_info']  
