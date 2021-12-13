*** Settings ***
Suite Setup         Open Browser To Login Page
Suite Teardown      Close Browser
Test Setup          Go To Login Page
Test Template       Login With Valid Credentials Should Pass
Resource            resource.robot

*** Variables ***
${IMG_SRC}          /static/media/sauce-backpack-1200x1500.34e7aa42.jpg

*** Test Cases ***
Valid Credentials   standard_user   secret_sauce

*** Keywords ***
Login With Valid Credentials Should Pass
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Password  ${password}
    Submit Credentials
    Inventory Page Should Be Open
    Inventory Page Is Correct

Inventory Page Is Correct
    Page Should Contain Image   ${IMG_SRC}