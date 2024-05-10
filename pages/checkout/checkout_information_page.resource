*** Keywords ***

#step 3.6: Verify "Checkout: Your Information" page is show
Verify Your Information page is show
    #step 3.6.1: Varify Text "Checkout: Your Information" is show
    Wait Until Element Is Visible        //div[@class='header_secondary_container']//span[text()='Checkout: Your Information']                  
    #step 3.6.2: Verify Checkout information form is show 
    Page Should Contain Element          //div[@class='checkout_info_container']//div[@class='checkout_info'] 
    Screenshot 

#step 4.1: Input valid data in First name text field
Input valid data in First name text field
    Input Text                           id=first-name                                  ${FIRSTNAME}
    #step 4.1.1: Varify First Name have a value
    Textfield Value Should Be            id=first-name                                  ${FIRSTNAME}

#step 4.2: Input valid data in Last name text field
Input valid data in Last name text field
    Input Text                           id=last-name                                   ${LASTNAME}
    #step 4.2.1: Varify Last Name have a value
    Textfield Value Should Be            id=last-name                                   ${LASTNAME}

#step 4.3: Input valid data in Zip/Postal Code text field 
Input valid data in Zip/Postal Code text field 
    Input Text                           id=postal-code                                 ${ZIP}
    #step 4.3.1: Varify Zip/Postal Code have a value
    Textfield Value Should Be            id=postal-code                                 ${ZIP}
    Screenshot

Click Continue button
    Click Element                       id=continue