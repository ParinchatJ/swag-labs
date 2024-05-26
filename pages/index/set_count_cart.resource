*** Variables ***

&{dict_set_count_cart_page}
...     shopping_cart=//span[@class='shopping_cart_badge']

*** Keywords ***

Set count cart 
        ${count_cart}           Run Keyword And Return Status    Page Should Contain Element    ${dict_set_count_cart_page}[shopping_cart]
        IF      ${count_cart}   
                ${count_of_cart}     Get Text           ${dict_set_count_cart_page}[shopping_cart]
                
        ELSE
                ${count_of_cart}     Set Variable       0
        END

# Check increase cart when add item
Verify Cart plus one item                           
        Wait Until Element Is Visible               ${dict_set_count_cart_page}[shopping_cart]
        ${last_count_of_cart}                       Get Text                            ${dict_set_count_cart_page}[shopping_cart]

        Should Be True    ${count_of_cart} + 1 == ${last_count_of_cart}
