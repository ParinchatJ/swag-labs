*** Keywords ***

Re-check your product list in Overview page
    #step 5: Re-check your product list before confirm checkout in Checkout: Overview page
    checkout_overview_page.Verify product details in overview is same inventory page (Sauce Labs Backpack)
    checkout_overview_page.Verify product details in overview is same inventory page (Sauce Labs Fleece Jacket)
    checkout_overview_page.Verify Price Total in overview
    checkout_overview_page.Click Finish Button
    checkout_complete_page.Verify Checkout: Complete page