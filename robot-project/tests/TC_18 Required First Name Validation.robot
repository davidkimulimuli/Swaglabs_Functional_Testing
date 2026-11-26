*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}             https://www.saucedemo.com/
${BROWSER}         Chrome
${CHROMEDRIVER}    C:/Users/mully/Downloads/chromedriver-win64/chromedriver-win64/chromedriver.exe
${USERNAME}        standard_user
${PASSWORD}        secret_sauce
${LASTNAME}        MULI
${ZIPCODE}         37600

*** Test Cases ***
TC_18 Required First Name Validation
    [Documentation]    Verify that First Name is a mandatory field during checkout.

    Open Browser    ${URL}    ${BROWSER}    executable_path=${CHROMEDRIVER}

    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}
    Click Button    id:login-button

    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-backpack    10s
    Click Button    id:add-to-cart-sauce-labs-backpack

    Click Element    class:shopping_cart_link

    Wait Until Element Is Visible    id:checkout    10s
    Click Button    id:checkout

    Wait Until Element Is Visible    id:last-name    10s

    Input Text    id:last-name     ${LASTNAME}
    Input Text    id:postal-code   ${ZIPCODE}

    Click Button    id:continue

    Element Should Contain    css:h3[data-test='error']    Error: First Name is required

    Close Browser