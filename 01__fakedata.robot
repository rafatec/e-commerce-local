*** Settings ***
Library     Selenium2Library
Library     String

*** Variables ***
${name_locator}     //*[@id="details"]/div[2]/div[2]/div/div[1]/h3
${email_locator}    //*[@id="details"]/div[2]/div[2]/div/div[2]/dl[9]/dd
${tel_locator}      //*[@id="details"]/div[2]/div[2]/div/div[2]/dl[4]/dd
${cpf_locator}      //*[@id="details"]/div[2]/div[2]/div/div[2]/dl[2]/dd
${cep_locator}      //*[@id="details"]/div[2]/div[2]/div/div[1]/div

${name}
${email}
${tel}      63983397034
${cpf}
${password}     P4$$w0rd

*** Test Cases ***

Get Fake Data
    [Tags]  get_fake_data
    Open Browser    http://www.fakenamegenerator.com/gen-male-br-br.php   gc    chrome          http://192.168.3.113:4444/wd/hub
    ${name}=     Get Fake Data  ${name_locator}
    ${email}=     Get Fake Data  ${email_locator}
    ${cpf}=     Get Fake Data   ${cpf_locator}
    ${cep}=     Get Fake Data   ${cep_locator}
    ${cep}=     Get Substring   ${cep}  -9
    log  ${name}
    log  ${email}
    log  ${tel}
    log  ${cep}
    Set Global Variable     ${name}
    Set Global Variable     ${email}
    Set Global Variable     ${tel}
    Set Global Variable     ${cpf}
    Set Global Variable     ${password}
    Set Global Variable     ${cep}
    [Teardown]  Close Browser

*** Keywords ***
Get Fake Data
    [Arguments]     ${locator}
    ${element}=    Get Text   ${locator}
    ${filtered_element}=    Remove String   ${element}  This is a real email address. Click here to activate it!
    [Return]    ${filtered_element}

