*** Settings ***
Documentation    Arquivo Principal do nosso projeto

Library          Browser

Resource        actions/AuthActions.robot
Resource        pages/dash.resource


*** Keywords ***
Do Login
    ${user}        Create Dictionary        email=papito@gmail.com    password=vaibrasil

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials

    User Logged In

Start Test
    New Browser     headless=False    browser=${BROWSER}

Finish Test
    #Thinking Time
    Sleep                      1
    Take Screenshot