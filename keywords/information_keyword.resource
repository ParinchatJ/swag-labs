*** Keywords ***

Enter your Information in Your Information page 
    #step 4: Enter your Information in Checkout: Your Information page
    checkout_information_page.Input infprmation field       ${Test_Data.step_04_verify_information_page.input_data}         ${Test_Data.step_04_verify_information_page.expected_data}
    checkout_information_page.Click Continue button
    checkout_overview_page.Verify "Checkout: Overview" page is show