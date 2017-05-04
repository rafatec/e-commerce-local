*** Settings ***
Library     Selenium2Library

Resource    login_keywords/keywords.robot

Test Setup  Open Browser    https://cliente.americanas.com.br/    gc    chrome          http://192.168.3.113:4444/wd/hub
Test Teardown  Close Browser
*** Variables ***


*** Test Cases ***

Valid Login
    [Tags]  valid_login
    Fill Info And Login  ${email}     ${password}
    Wait Until Page Contains    Não é você? Sair
    Location Should Contain    minhaconta.americanas

Invalid Login Wrong Pass
    [Tags]  inv-log_pass
    Fill Info And Login  ${email}     wrongpass
    Wait Until Page Contains    E-mail ou senha incorretos

Invalid Login Wrong Email
    [Tags]  inv-log_email
    Fill Info And Login  wrongemail@giropops.com      ${password}
    Wait Until Page Contains    E-mail ou senha incorretos

