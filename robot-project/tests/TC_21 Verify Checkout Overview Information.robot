*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://www.saucedemo.com/
${BROWSER}         Chrome
${CHROMEDRIVER}    C:/Users/mully/Downloads/chromedriver-win64/chromedriver-win64/chromedriver.exe
${USERNAME}        standard_user
${PASSWORD}        secret_sauce
${FIRSTNAME}       DAVID
${LASTNAME}        MULI
${ZIPCODE}         37600
${PRODUCT}         Sauce Labs Backpack

*** Test Cases ***
TC_21 Verify Checkout Overview Information
    [Documentation]    Verify that all selected products are displayed correctly on the Checkout Overview page.

    Open Browser    ${URL}    ${BROWSER}    executable_path=${CHROMEDRIVER}

    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login-button

    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-backpack    10s
    Click Button    id:add-to-cart-sauce-labs-backpack

    Click Element    class:shopping_cart_link

    Wait Until Element Is Visible    id:checkout    10s
    Click Button    id:checkout

    Wait Until Element Is Visible    id:first-name    10s
    Input Text    id:first-name    ${FIRSTNAME}
    Input Text    id:last-name     ${LASTNAME}
    Input Text    id:postal-code   ${ZIPCODE}

    Click Button    id:continue

    Element Text Should Be    class:title    Checkout: Overview

    Page Should Contain    ${PRODUCT}

    Close Browser