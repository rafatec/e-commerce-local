*** Settings ***
Library     Selenium2Library

Resource    ../login_keywords/keywords.robot

*** Variables ***

${login_button_locator}     //*[@id="app-container"]/div/div[2]/div/div/div[1]/div/form/button
${email_locator}    //*[@id="app-container"]/div/div[2]/div/div/div[1]/div/form/div[2]/div/input
${pass_locator}     //*[@id="app-container"]/div/div[2]/div/div/div[1]/div/form/div[3]/div/div/input

*** Keywords ***
Login On Site
    Fill Info And Login  ThiagoSouzaLima@dayrep.com   P4$$w0rd
    Wait Until Page Contains    Minha conta     10
    Location Should Contain    minhaconta.americanas

Logoff
    Mouse Over  //*[@id="h_user"]/span[1]/div
    Wait Until Element Is Visible   //*[@id="h_user"]/span[2]/div/ul/li[3]/a
    Click Element   //*[@id="h_user"]/span[2]/div/ul/li[3]/a

Go To Games Department
    Mouse Over  //*[@id="h_menu"]/div/div/a/div[2]
    Wait Until Element Is Visible   //*[@id="h_menu"]/div/div/div/div/div[1]/ul/li[9]/span
    Mouse Over  //*[@id="h_menu"]/div/div/div/div/div[1]/ul/li[9]/span
    Wait Until Element Is Visible   //*[@id="h_menu"]/div/div/div/div/div[1]/ul/li[9]/div/ul[1]/li[3]/div/ul/li[5]/div/ul/li[3]/a
    Click Link   //*[@id="h_menu"]/div/div/div/div/div[1]/ul/li[9]/div/ul[1]/li[3]/div/ul/li[5]/div/ul/li[3]/a
    Wait Until Page Contains    Jogos Playstation 4     10
    Location Should Be  http://www.americanas.com.br/categoria/356437

Select Item From Products
    [Arguments]  ${item_locator}
    Click Element   ${item_locator}
    Wait Until Page Contains Element    //*[@id="bt-buy-product"]
    Click Element   //*[@id="bt-buy-product"]
    Wait Until Page Contains    Minha cesta
    Go To   http://www.americanas.com.br/
    Wait Until Page Contains Element    //*[@id="h_minicart"]/a/span


Get Total Products
    ${product_qtt}=     Get Text   //*[@id="h_minicart"]/a/span
    [Return]  ${product_qtt}