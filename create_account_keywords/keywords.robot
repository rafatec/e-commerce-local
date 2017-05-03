*** Settings ***
Library     Selenium2Library

*** Variables ***
${name_locator}     //*[@id="app-container"]/div/div[2]/form/div[4]/div[1]/div/div/div/input
${email_locator}    //*[@id="app-container"]/div/div[2]/form/div[2]/div/div/div/span/input
${pass_locator}     //*[@id="app-container"]/div/div[2]/form/div[3]/div[1]/div/div/div/span/input
${confirm_pass_locator}     //*[@id="app-container"]/div/div[2]/form/div[3]/div[2]/div/div/div/span/input
${cpf_locator}      //*[@id="app-container"]/div/div[2]/form/div[4]/div[3]/div/div/div/span/input
${cep_locator}      //*[@id="app-container"]/div/div[2]/form/div[8]/div[2]/div/div/div/span/input
${number_locator}   //*[@id="app-container"]/div/div[2]/form/div[8]/div[3]/div[2]/div/div/div/input
${birth_locator}    //*[@id="app-container"]/div/div[2]/form/div[4]/div[4]/div/div/div/span/input
${tel_locator}      //*[@id="app-container"]/div/div[2]/form/div[5]/div[1]/div/div/div/span/input
${ref_locator}      //*[@id="app-container"]/div/div[2]/form/div[8]/div[3]/div[4]/div/div/div/span/input


*** Keywords ***
Open Browser To Page
    Open Browser    https://cliente.americanas.com.br/s/cadastro/pf/    gc  None            http://192.168.3.113:4444/wd/hub
    Maximize Browser Window

Fill Form
    [Arguments]  ${aname}   ${anemail}  ${atel}     ${acpf}     ${apass}    ${aconfirmpass}     ${acep}
    Input Text      ${email_locator}    ${anemail}
    Input Text      ${pass_locator}    ${apass}
    Input Text      ${confirm_pass_locator}    ${aconfirmpass}
    Input Text      ${name_locator}     ${aname}
    Click Element       //*[@id="app-container"]/div/div[2]/form/div[4]/div[2]/div/div[1]
    Input Text      ${cpf_locator}    ${acpf}
    Click Element At Coordinates      ${birth_locator}  -75   0
    Press Key     ${birth_locator}    08081980
    Input Text      ${tel_locator}    ${atel}
    Input Text      ${cep_locator}      ${acep}
    Wait Until Page Contains Element    ${number_locator}   15
    Input Text      ${number_locator}      102
    Input Text      ${ref_locator}      AM
    Click Button    //*[@id="app-container"]/div/div[2]/form/div[9]/div[2]/button