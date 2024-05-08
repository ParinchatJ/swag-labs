*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem


*** Variables ***

${SERVER}               https://www.saucedemo.com
${BROWSER}              gc 


*** Keywords ***

Open Browser with URL
    #Get Home path to use other mac
    ${home}             Get Environment Variable            HOME
    #step 0: Open website "https://www.saucedemo.com"
    Open Browser        ${SERVER}       ${BROWSER}      
    ...     options=binary_location="/${home}/Documents/Chrome/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing";add_experimental_option("detach", True)          
    ...     executable_path=/${home}/Documents/Chrome/chromedriver

    Maximize Browser Window