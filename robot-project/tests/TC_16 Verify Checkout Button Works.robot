*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://www.saucedemo.com/
${BROWSER}         Chrome
${CHROMEDRIVER}    C:/Users/mully/Downloads/chromedriver-win64/chromedriver-win64/chromedriver.exe
${USERNAME}        standard_user
${PASSWORD}        secret_sauce

*** Test Cases ***
TC_16 Verify Checkout Button Works
    [Documentation]    Verify that the Checkout button redirects the user to the Checkout: Your Information page.

    Open Browser    ${URL}    ${BROWSER}    executable_path=${CHROMEDRIVER}

    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password    ${PASSWORD}
    Click Button    id:login-button

    Click Button    id:add-to-cart-sauce-labs-backpack

    Click Element    class:shopping_cart_link

    Click Button    id:checkout

    Element Text Should Be    class:title    Checkout: Your Information

    Close Browser


    