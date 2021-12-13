*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${SERVER}           www.saucedemo.com
${BROWSER}          Chrome
${DELAY}            0  
${LOGIN URL}        https://${SERVER}/
${INVENTORY URL}    https://${SERVER}/inventory.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be    ${LOGIN URL}

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    user-name    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    login-button

Inventory Page Should Be Open
    Location Should Be    ${INVENTORY URL}