*** Settings ***
Library           SeleniumLibrary
Library           String
Library           BuiltIn
Library           OperatingSystem

*** Variables ***
${SERVER}               https://www.saucedemo.com
${BROWSER}              gc
${VALID_USER}           standard_user
${PASSWORD}             secret_sauce   
${FIRSTNAME}            Parinchat
${LASTNAME}             Juntaworn
${ZIP}                  11000
&{product_sauce_labs_backpack}              title=Sauce Labs Backpack         price=29.99     
&{product_sauce_labs_fleece_jacket}         title=Sauce Labs Fleece Jacket    price=49.99   
${tax}                  8/100  

*** Test Cases ***
TC-001: Member buy 2 product success
    #Get Home path to use other mac
    ${home}             Get Environment Variable            HOME
    #step 0: Open website "https://www.saucedemo.com"
    Open Browser        ${SERVER}       ${BROWSER}      
    ...     options=binary_location="/${home}/Documents/Chrome/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing";add_experimental_option("detach", True)          
    ...     executable_path=/${home}/Documents/Chrome/chromedriver

    Maximize Browser Window
    # Set Selenium Speed      0.1s
    Login Page Should Be Open

    #step 1: Login page
    #step 1.1: Enter valid data in Username text field
    Valid Username
    #step 1.2: Enter valid data in Password text field 
    Input Password
    #step 1.3: Click Login button
    Click Button                        id=login-button
    #step 1.4: Varify default Inventory page "Swag Labs"
    Inventory Page Should Be Open
    #Check empty cart
    Set count cart 

    #step 2: Add product to shopping cart in inventory page
    #step 2.1: Add Sauce Labs Backpack 1 ea
    Add Sauce Labs Backpack 1 ea
    #step 2.1.5: Verify shopping cart is increase 1 item
    Set count cart 
    #step 2.2: Add Sauce Labs Fleece Jacket 1 ea
    Add Sauce Labs Fleece Jacket 1 ea
    #step 2.2.5: Verify shopping cart is increase 1 item
    Set count cart 

    #step 3: Check your product list in shopping cart
    #step 3.1: Click shopping cart
    Click Link                          //a[@class='shopping_cart_link']
    #step 3.2: Verify "Your Cart" page is show
    Verify Your Cart page is show
    #step 3.3: Verify product details is same inventory page (Sauce Labs Backpack)
    Verify product details is same inventory page (Sauce Labs Backpack)
    #step 3.4: Verify product details is same inventory page (Sauce Labs Fleece Jacket)
    Verify product details is same inventory page (Sauce Labs Fleece Jacket)
    #step 3.5: Click Checkout 
    Click Button                        id=checkout
    #step 3.6: Verify "Checkout: Your Information" page is show
    Verify Your Information page is show

    #step 4: Enter your Information in Checkout: Your Information page
    #step 4.1: Input valid data in First name text field
    Input valid data in First name text field
    #step 4.2: Input valid data in Last name text field
    Input valid data in Last name text field
    #step 4.3: Input valid data in Zip/Postal Code text field 
    Input valid data in Zip/Postal Code text field 
    #step 4.4: Click Continue button
    Click Element                       id=continue
    #step 4.5: Verify "Checkout: Overview" page is show
    Verify "Checkout: Overview" page is show

    #step 5: Re-check your product list before confirm checkout in Checkout: Overview page
    #step 5.1: Verify product details is same inventory page (Sauce Labs Backpack)
    Verify product details in overview is same inventory page (Sauce Labs Backpack) 
    #step 5.2: Verify product details is same inventory page (Sauce Labs Fleece Jacket)
    Verify product details in overview is same inventory page (Sauce Labs Fleece Jacket)
    #step 5.5: Verify Price Total
    Verify Price Total in overview
    #step 5.6: Click Finish
    Click Button                        id=finish

    #step 6: Verify Checkout: Complete! page
    Verify Checkout: Complete page

    Close Browser


*** Keywords ***

#* Set cart
Set count cart 
    ${count_cart}    Run Keyword And Return Status    Page Should Contain Element    //span[@class='shopping_cart_badge']
    IF    ${count_cart}
        ${count_of_cart}    Get Text    //span[@class='shopping_cart_badge']
    ELSE
        ${count_of_cart}     Set Variable    0
    END

    #! ต้องเช็คไหมว่ามัน +1 จริงไหมตามที่เราเพิ่มสินค้าไป
    

#* Login page keyword
Login Page Should Be Open
    # Verify this is a Login page
    #step 0.1: Verify Logo page is "Swag Labs" and position is middle and top page
    Wait Until Element Is Visible       //div[@class='login_logo']
    Element Text Should Be              //div[@class='login_logo']      Swag Labs
    #step 0.2: Verify Username text field is show
    Wait Until Element Is Visible       id=user-name
    #step 0.3: Verify Password text field is show
    Wait Until Element Is Visible       id=password
    #step 0.4: Verify Login button is show
    Page Should Contain Button          id=login-button

Valid Username
    #step 1.1: Enter valid data in Username text field
    Input Text                          id=user-name                    ${VALID_USER}
    #step 1.1.1: Varify Username have a value
    Element attribute Value Should Be     id=user-name                  value                   ${VALID_USER}
    #! ถ้าใช้ Textfield Value Should Be ไม่ได้ เพราะสมมุติกรอกแค่ user มันมีส่วนประกอบ user อยู่ใน ${VALID_USER} มันก็จะผ่าน ให้ใช่้ Element attribute Value Should Be หรือ Textfield Value Should Be

Input Password
    #step 1.2: Enter valid data in Password text field 
    Input Text                          id=password                     ${PASSWORD}
    #step 1.2.1: Varify Password have a value
    Element attribute Value Should Be     id=password                   value                   ${PASSWORD}

#* Inventory Page
Inventory Page Should Be Open
    # Varify default Inventory page "Swag Labs"
    # 1.4.1: Varify Navbar
    Wait Until Element Is Visible       //div[@class='primary_header']//button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible       //div[@class='primary_header']//div[@class='app_logo']
    Element Text Should Be              //div[@class='primary_header']//div[@class='app_logo']                  Swag Labs
    Wait Until Element Is Visible       //div[@class='primary_header']//a[@class='shopping_cart_link']

    # 1.4.2: Varify Text "Products" is show next below a navbar and keep left
    Wait Until Element Is Visible       //div[@class='header_secondary_container']//span[@class='title']
    Element Text Should Be              //div[@class='header_secondary_container']//span[@class='title']          Products

    # 1.4.3: Varify source data dropdown is show
    Wait Until Element Is Visible       //div[@class='header_secondary_container']//*[@class='select_container']

    # 1.4.4: Varify Products card is show
    Wait Until Element Is Visible       //div[@id='inventory_container']//div[@class='inventory_item']


Add Sauce Labs Backpack 1 ea
    #step 2.1.1: Verify title in Sauce Labs Backpack card 
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_backpack}[title]']]                        
    #step 2.1.2: Verify Price in Sauce Labs Backpack card
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_backpack}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_backpack}[price]']]           
    #step 2.1.3: Verify Add to cart button in Sauce Labs Backpack card
    Page Should Contain Button          //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_backpack}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_backpack}[price]']]//button[text()='Add to cart']
    #step 2.1.4: Click Add to cart button to choose item to shopping cart
    Click Button                        //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_backpack}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_backpack}[price]']]//button[text()='Add to cart'] 


Add Sauce Labs Fleece Jacket 1 ea
    #step 2.2.1: Verify title in Sauce Labs Fleece Jacket card
    Wait Until Element Is Visible      //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]                            
    #step 2.2.2: Verify Price in Sauce Labs Fleece Jacket card
    Wait Until Element Is Visible      //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_fleece_jacket}[price]']]
    #step 2.2.3: Verify Add to cart button in Sauce Labs Fleece Jacket card
    Page Should Contain Button          //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_fleece_jacket}[price]']]//button[text()='Add to cart']                             
    #step 2.2.4: Click Add to cart button to choose item to shopping cart
    Click Button                        //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_fleece_jacket}[price]']]//button[text()='Add to cart']                                                                                         #? นำ 2 ค่านี้มาเทียบกัน และควรจะเท่ากัน

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

#* Checkout: Your Information page
#step 4.1: Input valid data in First name text field
Input valid data in First name text field
    Input Text                           id=first-name                                  ${FIRSTNAME}
    #step 4.1.1: Varify First Name have a value
    Textfield Value Should Be             id=first-name                                  ${FIRSTNAME}

#step 4.2: Input valid data in Last name text field
Input valid data in Last name text field
    Input Text                           id=last-name                                   ${LASTNAME}
    #step 4.2.1: Varify Last Name have a value
    Textfield Value Should Be             id=last-name                                   ${LASTNAME}

#step 4.3: Input valid data in Zip/Postal Code text field 
Input valid data in Zip/Postal Code text field 
    Input Text                           id=postal-code                                 ${ZIP}
    #step 4.3.1: Varify Zip/Postal Code have a value
    Textfield Value Should Be             id=postal-code                                 ${ZIP}

#step 4.5: Verify "Checkout: Overview" page is show
Verify "Checkout: Overview" page is show
    #step 4.5.1: Varify Text "Checkout: Overview" is show
    Wait Until Element Is Visible        //div[@class='header_secondary_container']//span[@class='title']
    Element Text Should Be               //div[@class='header_secondary_container']//span[@class='title']                         Checkout: Overview
    #step 4.5.2: Verify product card that you choose is show = 2
    ${count}                             Get Element Count                              //div[@class='cart_item']                                              
    Should Be True                       ${count} == 2

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