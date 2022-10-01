*** Settings ***
Documentation     Login Tests

Resource        ../resources/main.resource

Test Setup       Start Test
Test Teardown    Finish Test

*** Test Cases ***
Deve validar o slogan da home page
    Go To Login Page
    Submit Credentials    papito@gmail.com    vaibrasil
    User Logged In

Não deve logar com senha incorreta
    Go To Login Page
    Submit Credentials         papito@gmail.com    abc123
    Toast Message Should Be    Credenciais inválidas, tente novamente!

#Deve exibir notificacao toaster se a senha nao for preenchida
Required Password
    Go to Login Page
    Submit Credentials         papito@gmail.com    ${EMPTY}
    Toast Message Should Be    Por favor, informe a sua senha secreta!

#Deve exibir notificacao toaster se o email nao for preenchido
Required Email
    Go to Login Page
    Submit Credentials         ${EMPTY}    abc123
    Toast Message Should Be    Por favor, informe o seu email!

#Deve exibir notificacao toaster se email e a senha nao forem preenchidos
Required Fields
    Go to Login Page
    Submit Credentials         ${EMPTY}    ${EMPTY}
    Toast Message Should Be    Por favor, informe suas credenciais!
