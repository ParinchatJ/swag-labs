*** Keywords ***

Member Login
    #step 0: Open website "https://www.saucedemo.com" and verify
    login_page.Login Page Should Be Open
    #step 1: Login page and verify inventory page
    login_page.Valid Username
    login_page.Input Password
    login_page.Click Login Button
    inventory_page.Inventory Page Should Be Open