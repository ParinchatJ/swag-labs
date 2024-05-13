*** Keywords ***

Use TC unconstant
    # Create var to use TC dynamic (in any TC)
    ${test_data}    Set Variable     ${Data.${TEST_NAME}}
    Log    ${test_data}
    Set Test Variable    ${Test_Data}    ${test_data}