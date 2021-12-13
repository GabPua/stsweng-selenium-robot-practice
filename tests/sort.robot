*** Settings ***
Suite Setup         Open Browser To Login Page
Suite Teardown      Close Browser
Test Setup          Login With Valid Credentials
Test Template       Sort Should Pass
Resource            resource.robot

*** Variables ***
${USERNAME}         standard_user
${PASSWORD}         secret_sauce
${DROPDOWN}         css:*[data-test="product_sort_container"]

*** Test Cases ***
Sort Name (A to Z)          az      css:div.inventory_list > div:nth-child(1) > div.inventory_item_img > a#item_4_img_link
Sort Name (Z to A)          za      css:div.inventory_list > div:nth-child(1) > div.inventory_item_img > a#item_3_img_link
Sort Price (low to high)    lohi    css:div.inventory_list > div:nth-child(1) > div.inventory_item_img > a#item_2_img_link
Sort Price (high to low)    hilo    css:div.inventory_list > div:nth-child(1) > div.inventory_item_img > a#item_5_img_link

*** Keywords ***
Sort Should Pass
    [Arguments]                 ${sort_option}      ${first_img}
    Select From List By Value   ${DROPDOWN}         ${sort_option}
    First Image Is Correct      ${first_img}

First Image Is Correct
    [Arguments]                     ${first_img}
    Page Should Contain Element     ${first_img}

Login With Valid Credentials
    Go To Login Page
    Input Username  ${USERNAME}
    Input Password  ${PASSWORD}
    Submit Credentials