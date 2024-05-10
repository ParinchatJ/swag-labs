*** Settings ***
Resource            ${CURDIR}${/}..${/}config${/}import.resource
 

*** Test Cases ***

TC-001: Member buy 2 product success
    # step 0: open browser and verify login page
    Open Browser With URL
    # step 1: login with member and verify inventory page
    Member Login
    # step 2: Add product to shopping cart in inventory page and verify your cart page is show
    Add product to shopping cart in inventory page
    # step 3: Check your product list in shopping cart and verify your information page
    Checkout in your cart page
    #step 4: Enter your Information in Checkout: Your Information page and verify overview page
    Enter your Information in Your Information page
    #step 5: Re-check your product list before confirm checkout in Checkout: Overview page and #step 6: Verify Checkout: Complete! page
    Re-check your product list in Overview page
    

    Close Browser