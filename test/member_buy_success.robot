*** Settings ***
Library           SeleniumLibrary
Resource          ../resources/Set_cart.robot
Resource          ../resources/Login_page.robot
Resource          ../resources/Generic.robot
Resource          ../resources/Inventory_page.robot
Resource          ../resources/Your_cart_page.robot
Resource          ../resources/Information_page.robot
Resource          ../resources/Overview_page.robot
Resource          ../resources/Complete_page.robot
 

*** Test Cases ***
TC-001: Member buy 2 product success
    Open Browser with URL
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