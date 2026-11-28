# Swaglabs_Functional_Testing
Group 3 functional testing 

## Web application for testing
https://www.saucedemo.com/


# Group Members
- David Muli (GitHub:davidkimulimuli)
- Oskari Laukkanen (GitHub:Grayjays)

# Tools used
- Visual Studio Code (VS Code)
- Github
- Git Bash
- Python
- Playwright
- Robot framework
- Selenium Library

# Test Strategy
Application under test: Swag Labs, demo web shop provided by Sauce Labs (https://www.saucedemo.com) User logs in, browses small catalogue, fills a shopping cart and completes a simulated checkout. No real payment or orders processed, which makes the site safe for repeated automated testing.

Primary users: shoppers (logged-in customers), and built-in demo users (locked out, problem, performance glitch, error, visual) that are used for negative and exploratory testing.

Main functionality: login and logout, product list with sorting, product details, shopping cart, two-step checkout, and the burger menu.

Important user journeys: the happy-path purchase (login, add products, cart, checkout, order confirmation), product exploration, cart management, failed login, and session end.

Automation objective: verify the critical user journeys, cover positive and negative scenarios, build repeatable regression tests, and compare Playwright and Robot Framework for ease of use and maintainability.

Scope: the web UI in a Chromium-based browser: authentication, product list, product details, cart, checkout and menu.

Out of scope: performance, load and security testing, cross-browser testing beyond Chromium, external sites, real payments, and backend or API testing.

Test assumptions: the site and its demo users stay available during the project, `standard_user` is the reference for correct behaviour, and both team members know the basics of Git and programming.

Risks: application downtime, changes to the demo site or its data, tool configuration problems, and reduced availability of a team member.

Justification for automation: these scenarios cover the core purchase journey, are repeated in every regression cycle, and have stable locators (the site's `data-test` attributes), so automating them gives repeatable results at low maintenance cost.


# Test Cases

## Playwright Test Cases (Oskari Laukkanen)

- TC_01 - Login with valid credentials 
- TC_05 - Login with Empty Credentials
- TC_07 - Verify Display of the product inventory 
- TC_09 - Add Product to Shopping Cart

## Robot Framework Test cases (David Muli)

- TC_10 - Remove Product from Cart
- TC_16 - Verify Checkout Button works
- TC_18 - Required First Name Validation
- TC_21 - Verify Checkout Overview Information


# Playwright project (Oskari Laukkanen)

Folders: `tests/` (spec files), `pages/` (page objects), `test-data/` (users and products), and `playwright.config.ts`.

Test files: `login.spec.ts` (TC_01, TC_05) and `inventory.spec.ts` (TC_07, TC_09).

Fixed test data: user `standard_user` for all logged-in tests; TC_05 uses an empty username and password; TC_09 uses the Sauce Labs Backpack.

Result: all four tests pass, also when run three times in a row with `--repeat-each=3` (12 of 12 passed).

How to run:
```bash
cd playwright-project
npm install
npx playwright install chromium
npx playwright test
npx playwright show-report
```