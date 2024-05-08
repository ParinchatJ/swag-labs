*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           String

*** Variables ***

&{product_sauce_labs_backpack}              title=Sauce Labs Backpack         price=29.99     
&{product_sauce_labs_fleece_jacket}         title=Sauce Labs Fleece Jacket    price=49.99   
${tax}                  8/100 


*** Keywords ***

#* Overview page
#step 5.1: Verify product details is same inventory page (Sauce Labs Backpack)
Verify product details in overview is same inventory page (Sauce Labs Backpack) 
    #step 5.1.1: Verify QTY is 1
    Wait Until Element Is Visible      //div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//*[@class='cart_quantity']
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//*[@class='cart_quantity']            1
    #step 5.1.2: Verify title in Sauce Labs Backpack card / ต้องเช็คว่าเหมือนหน้าก่อนไหมด้วย
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//div[@class='inventory_item_name']                                                 ${product_sauce_labs_backpack}[title]
    #step 5.1.3: Verify Price in Sauce Labs Backpack card / ต้องเช็คว่าเหมือนหน้าก่อนไหมด้วย
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]//div[@class='inventory_item_price']       $${product_sauce_labs_backpack}[price]                                 

#step 5.2: Verify product details is same inventory page (Sauce Labs Fleece Jacket)
Verify product details in overview is same inventory page (Sauce Labs Fleece Jacket)
    #step 5.2.1: Verify QTY is 1
    Wait Until Element Is Visible       //div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//*[@class='cart_quantity']
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//*[@class='cart_quantity']       1
    #step 5.2.2: Verify title in Sauce Labs Fleece Jacket card / ต้องเช็คว่าเหมือนหน้าก่อนไหมด้วย
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//div[@class='inventory_item_name']                                            ${product_sauce_labs_fleece_jacket}[title]
    #step 5.2.3: Verify Price in Sauce Labs Fleece Jacket card / ต้องเช็คว่าเหมือนหน้าก่อนไหมด้วย
    Element Text Should Be              //div[@class='cart_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]//div[@class='inventory_item_price']  $${product_sauce_labs_fleece_jacket}[price]                               
#step 5.5: Verify Price Total
Verify Price Total in overview
    #step 5.5.1: Verify Item total price (if item price is same inventory page
        #To cal value price from every page (use User keyword)
    ${item_total}       evaluate             ${product_sauce_labs_backpack}[price] + ${product_sauce_labs_fleece_jacket}[price]
        #To check value that cal (item_total) is equal to element
    Page Should Contain Element             //div[@data-test='subtotal-label'][text()='Item total: $' and text()='${item_total}'] 

    #step 5.5.2: Verify Tax (same pattern item_total)
    ${tax_from_item_total}                  evaluate                        ${item_total} * ${tax}
    ${tax_from_item_total_format}           Format String                   {:.2f}              ${tax_from_item_total}
    Page Should Contain Element             //div[@data-test='tax-label'][text()='Tax: $' and text()='${tax_from_item_total_format}']       

    #step 5.5.3: Verify Total Price (Item total price + Tax) (same pattern item_total)
    ${total_with_tax}                       evaluate                        ${item_total} + ${tax_from_item_total_format}
    ${total_with_tax_format}                Format String                   {:.2f}              ${total_with_tax}
    Page Should Contain Element             //div[@data-test='total-label'][text()='Total: $' and text()='${total_with_tax_format}'] 
