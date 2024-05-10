*** Variables ***

&{dict_checkout_information_page}
...     your_information_text=//div[@class='header_secondary_container']//span[text()='Checkout: Your Information']  
...     information_form=//div[@class='checkout_info_container']//div[@class='checkout_info'] 
...     first_name_input=id=first-name
...     last_name_input=id=last-name
...     postal_code_input=id=postal-code
...     continue_bt=id=continue


*** Keywords ***

#step 3.6: Verify "Checkout: Your Information" page is show
Verify Your Information page is show
    #step 3.6.1: Varify Text "Checkout: Your Information" is show
    Wait Until Element Is Visible        ${dict_checkout_information_page}[your_information_text]             
    #step 3.6.2: Verify Checkout information form is show 
    Page Should Contain Element          ${dict_checkout_information_page}[information_form] 
    Screenshot 

#step 4.1: Input valid data in First name text field
Input valid data in First name text field
    Input Text                                   ${dict_checkout_information_page}[first_name_input]               ${Data.${TEST_NAME}.information.first_name}
    #step 4.1.1: Varify First Name have a value
    Element attribute Value Should Be            ${dict_checkout_information_page}[first_name_input]               value                    ${Data.${TEST_NAME}.information.first_name}

#step 4.2: Input valid data in Last name text field
Input valid data in Last name text field
    Input Text                                   ${dict_checkout_information_page}[last_name_input]                ${Data.${TEST_NAME}.information.last_name}
    #step 4.2.1: Varify Last Name have a value
    Element attribute Value Should Be            ${dict_checkout_information_page}[last_name_input]                value                    ${Data.${TEST_NAME}.information.last_name}

#step 4.3: Input valid data in Zip/Postal Code text field 
Input valid data in Zip/Postal Code text field 
    Input Text                                   ${dict_checkout_information_page}[postal_code_input]              ${Data.${TEST_NAME}.information.zip}
    #step 4.3.1: Varify Zip/Postal Code have a value
    Element attribute Value Should Be            ${dict_checkout_information_page}[postal_code_input]              value                    ${Data.${TEST_NAME}.information.zip}
    Screenshot

Click Continue button
    Click Element                                ${dict_checkout_information_page}[continue_bt]