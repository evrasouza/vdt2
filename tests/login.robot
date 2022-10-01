*** Settings ***
Documentation     Login Tests

Resource        ../resources/main.resource

Test Setup       Start Test
Test Teardown    Finish Test

*** Test Cases ***
Deve validar o slogan da home page
    ${user}        Create Dictionary        email=papito@gmail.com    password=vaibrasil

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials

    User Logged In

Não deve logar com senha incorreta
    ${user}        Create Dictionary        email=papito@gmail.com    password=abc123

    Go To Login Page
    Fill Credentials        ${user}
    Submit Credentials
    
    Toast Message Should Be    Credenciais inválidas, tente novamente!

Deve exibir notificacao toaster se a senha nao for preenchida
    ${user}        Create Dictionary        email=everton@404.com.br    password=${EMPTY}

    Go to Login Page
    Fill Input Email    ${user}
    Submit Credentials

    Toast Message Should Be    Por favor, informe a sua senha secreta!

Deve exibir notificacao toaster se o email nao for preenchido
    ${user}        Create Dictionary        email=${EMPTY}    password=abc123

    Go to Login Page
    Fill Input Password    ${user}
    Submit Credentials

    Toast Message Should Be    Por favor, informe o seu email!

Deve exibir notificacao toaster se email e a senha nao forem preenchidos
    Go to Login Page
    Submit Credentials
    Toast Message Should Be    Por favor, informe suas credenciais!
