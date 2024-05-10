*** Keywords ***

Inventory Page Should Be Open
    # Varify default Inventory page "Swag Labs"
    # 1.4.1: Varify Navbar
    #! ควรแยก Verify navbar และแยกไปตรวจทุกหน้า ?
    Wait Until Element Is Visible       //div[@class='primary_header']//button[@id='react-burger-menu-btn']
    Wait Until Element Is Visible       //div[@class='primary_header']//div[text()='Swag Labs']
    Wait Until Element Is Visible       //div[@class='primary_header']//a[@class='shopping_cart_link']

    # 1.4.2: Varify Text "Products" is show next below a navbar and keep left
    Wait Until Element Is Visible       //div[@class='header_secondary_container']//span[text()='Products']

    # 1.4.3: Varify source data dropdown is show
    Wait Until Element Is Visible       //div[@class='header_secondary_container' and .//span[text()='Products']]//span[@class='select_container']

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
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]']]                            
    #step 2.2.2: Verify Price in Sauce Labs Fleece Jacket card
    Wait Until Element Is Visible       //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_fleece_jacket}[price]']]
    #step 2.2.3: Verify Add to cart button in Sauce Labs Fleece Jacket card
    Page Should Contain Button          //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_fleece_jacket}[price]']]//button[text()='Add to cart']                             
    #step 2.2.4: Click Add to cart button to choose item to shopping cart
    Click Button                        //div[@class='inventory_item' and .//div[text()='${product_sauce_labs_fleece_jacket}[title]'] and .//div[@class='inventory_item_price'][text()='${product_sauce_labs_fleece_jacket}[price]']]//button[text()='Add to cart']                                                                                         

Click shopping cart
    Click Link                          //a[@class='shopping_cart_link']