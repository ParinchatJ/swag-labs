*** Settings ***

Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           BuiltIn

# Variables
Variables        ${CURDIR}/../test_data/data.yaml

# Page
Resource          ../pages/index/open_browser.resource
Resource          ../pages/index/create_variable.resource
Resource          ../pages/index/set_count_cart.resource
Resource          ../pages/index/login_page.resource
Resource          ../pages/home/inventory_page.resource
Resource          ../pages/checkout/checkout_your_cart_page.resource
Resource          ../pages/checkout/checkout_information_page.resource
Resource          ../pages/checkout/checkout_overview_page.resource
Resource          ../pages/checkout/checkout_complete_page.resource

# Keyword
Resource          ../keywords/open_keyword.resource
Resource          ../keywords/login_keyword.resource
Resource          ../keywords/inventory_keyword.resource
Resource          ../keywords/yourcart_keyword.resource
Resource          ../keywords/information_keyword.resource
Resource          ../keywords/overview_keyword.resource



*** Variables ***

&{product_sauce_labs_backpack}              title=Sauce Labs Backpack         price=29.99     
&{product_sauce_labs_fleece_jacket}         title=Sauce Labs Fleece Jacket    price=49.99   
${tax}                                      8/100 