*** Variables ***

&{dict_checkout_your_cart_page}
...     your_cart_text=//div[@class='header_secondary_container']//span[text()='Your Cart']
...     shopping_cart_number=//span[@class='shopping_cart_badge'][text()='2']
...     sauce_labs_backpack_qty=//div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//*[@class='cart_quantity']
...     sauce_labs_backpack_title=//div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//div[text()='${product_sauce_labs_backpack}[title]']
...     sauce_labs_backpack_price=//div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//*[text()='$' and text() = '${product_sauce_labs_backpack}[price]']
...     sauce_labs_backpack_rm_bt=id=remove-sauce-labs-backpack
...     sauce_labs_fleece_jacket_qty=//div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//*[@class='cart_quantity']
...     sauce_labs_fleece_jacket_title=//div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//div[text()='${product_sauce_labs_fleece_jacket}[title]']
...     sauce_labs_fleece_jacket_price=//div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//*[text()='$' and text() = '${product_sauce_labs_fleece_jacket}[price]']
...     sauce_labs_fleece_jacket_rm_bt=id=remove-sauce-labs-fleece-jacket
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
Verify product details is same inventory page (Sauce Labs Backpack)
    #step 3.3.1: Verify QTY is 1
    Wait Until Element Is Visible       ${dict_checkout_your_cart_page}[sauce_labs_backpack_qty]   
    Element Text Should Be              ${dict_checkout_your_cart_page}[sauce_labs_backpack_qty]                                   1
    #step 3.3.2: Verify title in Sauce Labs Backpack card
    Wait Until Element Is Visible       ${dict_checkout_your_cart_page}[sauce_labs_backpack_title]                  
    #step 3.3.3: Verify Price in Sauce Labs Backpack card 
    Wait Until Element Is Visible       ${dict_checkout_your_cart_page}[sauce_labs_backpack_price]                      
    #step 3.3.4: Verify Remove button in Sauce Labs Backpack card
    Page Should Contain Button          ${dict_checkout_your_cart_page}[sauce_labs_backpack_rm_bt]                                 Remove
    Screenshot

#step 3.4: Verify product details is same inventory page (Sauce Labs Fleece Jacket)
Verify product details is same inventory page (Sauce Labs Fleece Jacket)
    #step 3.4.1: Verify QTY is 1
    Wait Until Element Is Visible       ${dict_checkout_your_cart_page}[sauce_labs_fleece_jacket_qty]
    Element Text Should Be              ${dict_checkout_your_cart_page}[sauce_labs_fleece_jacket_qty]                              1
    #step 3.4.2: Verify title in Sauce Labs Fleece Jacket card 
    Wait Until Element Is Visible       ${dict_checkout_your_cart_page}[sauce_labs_fleece_jacket_title]                        
    #sstep 3.4.3: Verify Price in Sauce Labs Fleece Jacket card 
    Wait Until Element Is Visible       ${dict_checkout_your_cart_page}[sauce_labs_fleece_jacket_price]         
    #step 3.4.4: Verify Remove button in Sauce Labs Fleece Jacket card
    Page Should Contain Button          ${dict_checkout_your_cart_page}[sauce_labs_fleece_jacket_rm_bt]                            Remove
    Screenshot

Click Checkout Button
    Click Button                        ${dict_checkout_your_cart_page}[checkout_bt]