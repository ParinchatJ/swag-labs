*** Keywords ***

Open Browser saucedemo
    #Get Home path to use other mac
    ${home}             Get Environment Variable            HOME
    #step 0: Open website "https://www.saucedemo.com" on gc test
    Open Browser        ${SERVER}                           ${BROWSER}      
    ...     options=binary_location="/${home}/Documents/Chrome/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing";add_experimental_option("detach", True)          
    ...     executable_path=/${home}/Documents/Chrome/chromedriver

    Maximize Browser Window

Screenshot
    # Screenshot.Set Screenshot Directory    ./screenshot
    Capture Page Screenshot     TC_01_member_buy_success_{index}.png