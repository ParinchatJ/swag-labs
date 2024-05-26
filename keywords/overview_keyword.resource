*** Keywords ***

Re-check your product list in Overview page
    #step 5: Re-check your product list before confirm checkout in Checkout: Overview page
    checkout_overview_page.Verify product details in overview is same inventory page        ${Test_Data.step_02_verify_inventory_page.data_test}
    checkout_overview_page.Verify Price Total in overview                                   ${Test_Data.step_02_verify_inventory_page.data_test}
    checkout_overview_page.Click Finish Button
    checkout_complete_page.Verify Checkout: Complete page