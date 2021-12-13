*** Settings ***
Suite Setup         Open Browser To Login Page
Suite Teardown      Close Browser
Test Setup          Go To Login Page
Test Template       Login With Problem User Should Fail
Resource            resource.robot

*** Variables ***
${IMG_SRC}          /static/media/sauce-backpack-1200x1500.34e7aa42.jpg

*** Test Cases ***
Valid Credentials   problem_user   secret_sauce

*** Keywords ***
Login With Problem User Should Fail
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Password  ${password}
    Submit Credentials
    Inventory Page Should Be Open
    Inventory Page Is Incorrect

Inventory Page Is Incorrect
    Page Should Not Contain Image   ${IMG_SRC}