*** Settings ***
Library     Selenium2Library

*** Variables ***

${login_button_locator}     //*[@id="app-container"]/div/div[2]/div/div/div[1]/div/form/button
${email_locator}    //*[@id="app-container"]/div/div[2]/div/div/div[1]/div/form/div[2]/div/input
${pass_locator}     //*[@id="app-container"]/div/div[2]/div/div/div[1]/div/form/div[3]/div/div/input

*** Keywords ***
Fill Info And Login
    [Arguments]     ${anemail}      ${apass}
    Input Text      ${email_locator}     ${anemail}
    Input Text      ${pass_locator}     ${apass}
    Click Element   ${login_button_locator}