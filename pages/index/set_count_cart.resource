*** Keywords ***

Set count cart 
        ${count_cart}           Run Keyword And Return Status    Page Should Contain Element    //span[@class='shopping_cart_badge']
        IF      ${count_cart}   
                ${count_of_cart}     Get Text           //span[@class='shopping_cart_badge']
                
        ELSE
                ${count_of_cart}     Set Variable       0
        END

        Screenshot

#  # Check increase cart when add item
#             Wait Until Element Is Visible               //span[@class='shopping_cart_badge']
#             ${last_count_of_cart}                       Get Text                            //span[@class='shopping_cart_badge']

#             Should Be True    ${count_of_cart} + 1 == ${last_count_of_cart}