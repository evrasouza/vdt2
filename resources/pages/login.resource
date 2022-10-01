*** Settings ***
Documentation    Login Page

Library    Browser

*** Variables ***
${INPUT_EMAIL}    css=input[name=email]
${INPUT_PASS}     css=input[name=password]

*** Keywords ***
Go To Login Page
    New Page        https://trade-sticker-dev.vercel.app/

Fill Credentials        
    [Arguments]             ${user}
    Fill Input Email        ${user}
    Fill Input Password     ${user}

Fill Input Email
    [Arguments]     ${user}
    Fill Text       ${INPUT_EMAIL}      ${user}[email]

Fill Input Password
    [Arguments]     ${user}    
    Fill Text       ${INPUT_PASS}       ${user}[password]

Submit Credentials
    Click              css=.submit-button >> text=Entrar

Submit Credentials
    [Arguments]      ${email}        ${password}
    Fill Text        css=input[name=email]        ${email}
    Fill Text        css=input[name=password]     ${password}
    Click            css=button >> text=Entrar

Toast Message Should Be
    [Arguments]    ${expected_message}
    ${locator}
    ...            Set Variable
    ...            css=.Toastify__toast-body div >> text=${expected_message}

    Wait For Elements State    ${locator}    visible    1

