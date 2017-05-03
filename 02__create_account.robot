*** Settings ***
Library     Selenium2Library
Library     String

Resource    create_account_keywords/keywords.robot

Test Setup  Open Browser To Page
Test Teardown  Close Browser

*** Variables ***


*** Test Cases ***

Create Valid Account
    [Tags]  valid_ac
    Fill Form   ${name}     ${email}    ${tel}      ${cpf}      ${password}     ${password}     ${cep}
    Wait Until Page Contains    Não é você? Sair
    Location Should Contain    minhaconta.americanas

Dont Create Account Missing Fields
    [Tags]    missing-fields
    Fill Form   ${name}     ${email}    ${EMPTY}      ${cpf}      ${password}     ${password}       ${cep}
    Wait Until Page Contains    Campo obrigatório

Dont Create Account Different Pass
    [Tags]  diff-pass
    Fill Form   ${name}     ${email}    ${tel}      ${cpf}      123456     654321       ${cep}
    Wait Until Page Contains    Senha não confere

Dont Create Account Invalid Tel
    [Tags]  inv-tel
    Fill Form   ${name}     somerandomemail@it.com    987461      ${cpf}      ${password}     ${password}     ${cep}
    Wait Until Page Contains    Número inválido do telefone principal

Dont Create Account Invalid CPF
    [Tags]  inv-cpf
    Fill Form   ${name}     ${email}    ${tel}      12345678998      ${password}     ${password}        ${cep}
    Wait Until Page Contains    CPF inválido

Dont Create Account Invalid CEP
    [Tags]  inv-cep
    Run Keyword And Expect Error    *   Fill Form   ${name}     ${email}    ${tel}      ${cpf}      ${password}     ${password}        11111111
    Wait Until Page Contains    Não encontramos o CEP desejado. Por favor verifique os dados informados e tente novamente.

Show Weak Pass
    [Tags]  weak-pass
    Fill Form   ${EMPTY}     ${email}    ${tel}      ${cpf}      ${password}     ${password}     ${cep}
    Page Should Contain    fraca

Show Regular Pass
    [Tags]  reg-pass
    Fill Form   ${EMPTY}     ${email}    ${tel}      ${cpf}      s0m3r3gularp4ss     s0m3r3gularp4ss     ${cep}
    Page Should Contain    regular

Show Strong Pass
    [Tags]  strong-pass
    Fill Form   ${EMPTY}     ${email}    ${tel}      ${cpf}      r3ally$tr0ngP4$$w0rdx     r3ally$tr0ngP4$$w0rdx     ${cep}
    Page Should Contain    forte