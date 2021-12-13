*** Settings ***
Suite Setup         Open Browser To Login Page
Suite Teardown      Close Browser
Test Setup          Go To Login Page
Test Template       Login With Invalid Credentials Should Fail
Resource            resource.robot

*** Variables ***
${ERROR}            css:*[data-test="error"]
${ERROR_MSG}        Epic sadface: Username and password do not match any user in this service
${ERROR_ICON1}      css:.form_group:nth-child(1) > .svg-inline--fa
${ERROR_ICON2}      css:.form_group:nth-child(2) > .svg-inline--fa

*** Test Cases ***
Invalid Credentials   standard_user     secret_salsa

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Password  ${password}
    Submit Credentials
    Error Message Is Displayed
    Error Icons Are Displayed
    
Error Message Is Displayed
    Page Should Contain Element     ${ERROR}
    Element Text Should Be          ${ERROR}    ${ERROR_MSG}

Error Icons Are Displayed
    Page Should Contain Element     ${ERROR_ICON1}
    Page Should Contain Element     ${ERROR_ICON2}