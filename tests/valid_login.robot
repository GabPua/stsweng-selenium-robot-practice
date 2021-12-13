*** Settings ***
Suite Setup         Open Browser To Login Page
Suite Teardown      Close Browser
Test Setup          Go To Login Page
Test Template       Login With Valid Credentials Should Pass
Resource            resource.robot

*** Test Cases ***
Valid Credentials Set 1     standard_user               secret_sauce
Valid Credentials Set 2     problem_user                secret_sauce
Valid Credentials Set 3     performance_glitch_user     secret_sauce

*** Keywords ***
Login With Valid Credentials Should Pass
    [Arguments]     ${username}     ${password}
    Input Username  ${username}
    Input Password  ${password}
    Submit Credentials
    Inventory Page Should Be Open