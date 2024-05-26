*** Variables ***

&{dict_inventory_page}
...     hamburger_button=//div[@class='primary_header']//button[@id='react-burger-menu-btn']
...     logo_swaglabs=//div[@class='primary_header']//div[text()='Swag Labs']
...     cart_button=//div[@class='primary_header']//a[@class='shopping_cart_link']
...     product_h1=//div[@class='header_secondary_container']//span[text()='Products']
...     dropdown=//div[@class='header_secondary_container' and .//span[text()='Products']]//span[@class='select_container']
...     product_card=//div[@id='inventory_container']//div[@class='inventory_item']
...     shopping_cart_bt=//a[@class='shopping_cart_link']


*** Keywords ***

Inventory Page Should Be Open
    # Varify default Inventory page "Swag Labs"
    # 1.4.1: Varify Navbar
    Wait Until Element Is Visible       ${dict_inventory_page}[hamburger_button]
    Wait Until Element Is Visible       ${dict_inventory_page}[logo_swaglabs]
    Wait Until Element Is Visible       ${dict_inventory_page}[cart_button]

    # 1.4.2: Varify Text "Products" is show next below a navbar and keep left
    Wait Until Element Is Visible       ${dict_inventory_page}[product_h1]

    # 1.4.3: Varify source data dropdown is show
    Wait Until Element Is Visible       ${dict_inventory_page}[dropdown]

    # 1.4.4: Varify Products card is show
    Wait Until Element Is Visible       ${dict_inventory_page}[product_card]

Add item = ${title}
    [Arguments]     ${price}
    #step 2.1.0: Get item to cart
    ${count_cart}           Run Keyword And Return Status    Page Should Contain Element    ${dict_set_count_cart_page}[shopping_cart]
    IF      ${count_cart}   
            ${count_of_cart}     Get Text           ${dict_set_count_cart_page}[shopping_cart]
    ELSE
            ${count_of_cart}     Set Variable       0
    END

    #step 2.1.1: Verify title in Sauce Labs Backpack card 
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${title}']]                    
    #step 2.1.2: Verify Price in Sauce Labs Backpack card
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${title}'] and .//div[@class='inventory_item_price'][text()='${price}']]            
    #step 2.1.3: Verify Add to cart button in Sauce Labs Backpack card
    Page Should Contain Button          //div[@class='inventory_item' and .//div[text()='${title}'] and .//div[@class='inventory_item_price'][text()='${price}']]//button[text()='Add to cart']
    #step 2.1.4: Click Add to cart button to choose item to shopping cart
    Click Button                        //div[@class='inventory_item' and .//div[text()='${title}'] and .//div[@class='inventory_item_price'][text()='${price}']]//button[text()='Add to cart']
    #step 2.1.5: Check increase cart when add item
    Wait Until Element Is Visible               ${dict_set_count_cart_page}[shopping_cart]
    ${last_count_of_cart}                       Get Text                            ${dict_set_count_cart_page}[shopping_cart]
    Should Be True    ${count_of_cart} + 1 == ${last_count_of_cart}
                                              

Click shopping cart
    Click Link                          ${dict_inventory_page}[shopping_cart_bt]    