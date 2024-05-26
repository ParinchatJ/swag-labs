*** Keywords ***

Member Login
    #step 0: Open website "https://www.saucedemo.com" and verify
    login_page.Login Page Should Be Open
    #step 1: Login page and verify inventory page
    login_page.Login member         ${Test_Data.step_01_login.input_data}          ${Test_Data.step_01_login.expected_data}
    inventory_page.Inventory Page Should Be Open