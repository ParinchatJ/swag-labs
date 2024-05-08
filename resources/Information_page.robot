*** Settings ***
Library           SeleniumLibrary


*** Variables ***

${FIRSTNAME}            Parinchat
${LASTNAME}             Juntaworn
${ZIP}                  11000

*** Keywords ***

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
