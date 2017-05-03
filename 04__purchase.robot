*** Settings ***

Library     Selenium2Library

Resource    purchase_keywords/keywords.robot

Suite Setup  Open Browser    https://cliente.americanas.com.br/s/    gc     chrome          http://192.168.3.113:4444/wd/hub
Suite Teardown  Close Browser

*** Test Cases ***

Login On Application
    Maximize Browser Window
    Login On Site

Add Item To Cart
    Go To Games Department
    #Witcher 3 locator
    Select Item From Products  //*[@id="root"]/div/div/div/div[3]/div/div[1]/div/div[2]/div[3]/div/div/div[2]/div[5]/section/a
    ${total_products}=  Get Total Products
    Should Be Equal As Integers     ${total_products}      1

Logout-Login Basket Should Contain 1 Item
    Logoff
    Wait Until Page Contains    Identificação
    Go To   https://cliente.americanas.com.br/
    Login On Site
    Wait Until Page Contains Element     //*[@id="h_minicart"]/a/span
    ${total_products}=  Get Total Products
    Should Be Equal As Integers     ${total_products}      1

Add Another Item To Cart
    Go To Games Department
    #Horizon Zero Dawn Locator
    Select Item From Products  //*[@id="root"]/div/div/div/div[3]/div/div[1]/div/div[2]/div[3]/div/div/div[2]/div[2]/section/a/div[2]/h1
    ${total_products}=  Get Total Products
    Should Be Equal As Integers     ${total_products}      2

Basket Should Contain 2 Items
    Go To   http://www.americanas.com.br/
    Mouse Over   //*[@id="h_minicart"]/a/span
    Wait Until Element Is Visible   //*[@id="crt-box"]/div/a[1]
    Click Element   //*[@id="crt-box"]/div/a[1]
    Wait Until Page Contains    2 produtos