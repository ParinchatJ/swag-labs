*** Keywords ***

Login Page Should Be Open
    # Verify this is a Login page
    #step 0.1: Verify Logo page is "Swag Labs" and position is middle and top page
    Wait Until Element Is Visible       //div[@class='login_logo']
    Element Text Should Be              //div[@class='login_logo']      Swag Labs
    #step 0.2: Verify Username text field is show
    Wait Until Element Is Visible       id=user-name
    #step 0.3: Verify Password text field is show
    Wait Until Element Is Visible       id=password
    #step 0.4: Verify Login button is show
    Page Should Contain Button          id=login-button
    Screenshot

Valid Username
    #step 1.1: Enter valid data in Username text field
    Input Text                          id=user-name                    standard_user
    #step 1.1.1: Varify Username have a value
    Element attribute Value Should Be   id=user-name                    value                     standard_user
    #! ถ้าใช้ Textfield Value Should Be ไม่ได้ เพราะสมมุติกรอกแค่ user มันมีส่วนประกอบ user อยู่ใน ${VALID_USER} มันก็จะผ่าน ให้ใช่้ Element attribute Value Should Be หรือ Textfield Value Should Be
    Screenshot

Input Password
    #step 1.2: Enter valid data in Password text field 
    Input Text                          id=password                     secret_sauce
    #step 1.2.1: Varify Password have a value
    Element attribute Value Should Be   id=password                     value                   secret_sauce
    Screenshot

Click Login Button
    Click Button                        id=login-button