*** Variables ***

&{dict_login_page}
...     login_logo=//div[@class='login_container']//div[text()='Swag Labs']
...     user_name_input=id=user-name
...     password_input=id=password
...     login_button=id=login-button


*** Keywords ***

Login Page Should Be Open
    # Verify this is a Login page
    #step 0.1: Verify Logo page is "Swag Labs" and position is middle and top page
    Wait Until Element Is Visible       ${dict_login_page}[login_logo]
    #step 0.2: Verify Username text field is show
    Wait Until Element Is Visible       ${dict_login_page}[user_name_input]
    #step 0.3: Verify Password text field is show
    Wait Until Element Is Visible       ${dict_login_page}[password_input]
    #step 0.4: Verify Login button is show
    Page Should Contain Button          ${dict_login_page}[login_button]
    Screenshot

Valid Username
    #step 1.1: Enter valid data in Username text field
    Input Text                          ${dict_login_page}[user_name_input]                    ${Data.${TEST_NAME}.user.user_name}
    #step 1.1.1: Varify Username have a value
    Element attribute Value Should Be   ${dict_login_page}[user_name_input]                    value                     ${Data.${TEST_NAME}.user.user_name}
    #! ถ้าใช้ Textfield Value Should Be ไม่ได้ เพราะสมมุติกรอกแค่ user มันมีส่วนประกอบ user อยู่ใน ${VALID_USER} มันก็จะผ่าน ให้ใช่้ Element attribute Value Should Be หรือ Textfield Value Should Be
    Screenshot

Input Password
    #step 1.2: Enter valid data in Password text field 
    Input Text                          ${dict_login_page}[password_input]                     ${Data.${TEST_NAME}.user.pwd}
    #step 1.2.1: Varify Password have a value
    Element attribute Value Should Be   ${dict_login_page}[password_input]                     value                   ${Data.${TEST_NAME}.user.pwd}
    Screenshot

Click Login Button
    Click Button                        ${dict_login_page}[login_button]