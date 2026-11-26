*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROMEDRIVER}    C:/Users/mully/Downloads/chromedriver-win64/chromedriver-win64/chromedriver.exe

*** Test Cases ***
TC_10 Remove Product From Cart
    [Documentation]    Verify that a user can remove a previously added product from the cart.

    Open Browser    https://www.saucedemo.com/    Chrome    executable_path=${CHROMEDRIVER}

    Input Text    id:user-name    standard_user
    Input Text    id:password    secret_sauce
    Click Button    id:login-button

    Click Button    id:add-to-cart-sauce-labs-backpack
    Click Element    class:shopping_cart_link

    Click Button    id:remove-sauce-labs-backpack

    Page Should Not Contain    Sauce Labs Backpack

    Close Browser



