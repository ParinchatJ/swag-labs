*** Keywords ***

Enter your Information in Your Information page 
    #step 4: Enter your Information in Checkout: Your Information page
    checkout_information_page.Input valid data in First name text field
    checkout_information_page.Input valid data in Last name text field
    checkout_information_page.Input valid data in Zip/Postal Code text field
    checkout_information_page.Click Continue button
    checkout_overview_page.Verify "Checkout: Overview" page is show