*** Settings ***
Documentation    Arquivo Principal do nosso projeto

Library          Browser

Resource        pages/login.resource
Resource        pages/dash.resource

*** Keywords ***
Do Login
    Go To Login Page
    Submit Credentials    papito@gmail.com    vaibrasil
    User Logged In

Start Test
    New Browser     headless=False    browser=${BROWSER}

Finish Test
    #Thinking Time
    Sleep                      1
    Take Screenshot