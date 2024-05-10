*** Variables ***

&{dict_inventory_page}
...     hamburger_button=//div[@class='primary_header']//button[@id='react-burger-menu-btn']
...     logo_swaglabs=//div[@class='primary_header']//div[text()='Swag Labs']
...     cart_button=//div[@class='primary_header']//a[@class='shopping_cart_link']
...     product_h1=//div[@class='header_secondary_container']//span[text()='Products']
...     dropdown=//div[@class='header_secondary_container' and .//span[text()='Products']]//span[@class='select_container']
...     product_card=//div[@id='inventory_container']//div[@class='inventory_item']
...     sauce_labs_backpack_title=//div[@class='inventory_item' and .//div[text()='${product_sauce_labs_backpack}[title]']] 
...     sauce_labs_backpack_price=//div[@class='inventory_item' and .//div[text()='${product_sauce_labs_backpack}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_backpack}[price]']] 
...     sauce_labs_backpack_add_cart_bt=//div[@class='inventory_item' and .//div[text()='${product_sauce_labs_backpack}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_backpack}[price]']]//button[text()='Add to cart']
...     sauce_labs_fleece_jacket_title=//div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]  
...     sauce_labs_fleece_jacket_price=//div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_fleece_jacket}[price]']]
...     sauce_labs_fleece_jacket_add_cart_bt=//div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_fleece_jacket}[price]']]//button[text()='Add to cart']
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


Add Sauce Labs Backpack 1 ea
    #step 2.1.1: Verify title in Sauce Labs Backpack card 
    Wait Until Element Is Visible       ${dict_inventory_page}[sauce_labs_backpack_title]                     
    #step 2.1.2: Verify Price in Sauce Labs Backpack card
    Wait Until Element Is Visible       ${dict_inventory_page}[sauce_labs_backpack_price]               
    #step 2.1.3: Verify Add to cart button in Sauce Labs Backpack card
    Page Should Contain Button          ${dict_inventory_page}[sauce_labs_backpack_add_cart_bt] 
    #step 2.1.4: Click Add to cart button to choose item to shopping cart
    Click Button                        ${dict_inventory_page}[sauce_labs_backpack_add_cart_bt] 


Add Sauce Labs Fleece Jacket 1 ea
    #step 2.2.1: Verify title in Sauce Labs Fleece Jacket card
    Wait Until Element Is Visible       ${dict_inventory_page}[sauce_labs_fleece_jacket_title]                             
    #step 2.2.2: Verify Price in Sauce Labs Fleece Jacket card
    Wait Until Element Is Visible       ${dict_inventory_page}[sauce_labs_fleece_jacket_price]
    #step 2.2.3: Verify Add to cart button in Sauce Labs Fleece Jacket card
    Page Should Contain Button          ${dict_inventory_page}[sauce_labs_fleece_jacket_add_cart_bt]                      
    #step 2.2.4: Click Add to cart button to choose item to shopping cart
    Click Button                        ${dict_inventory_page}[sauce_labs_fleece_jacket_add_cart_bt]                                              

Click shopping cart
    Click Link                          ${dict_inventory_page}[shopping_cart_bt]    