import { test, expect } from '@playwright/test';
import { LoginPage } from '../pages/LoginPage';
import { users } from '../test-data/users';

test.describe('Login', () => {
  test('TC_01: Login with valid credentials', async ({ page }) => {
    const loginPage = new LoginPage(page);

    await loginPage.goto();
    await loginPage.login(users.standard.username, users.standard.password);

    // Expected outcome: the user lands on the inventory page
    await expect(page).toHaveURL(/inventory\.html/);
    await expect(page.getByTestId('title')).toHaveText('Products');
  });

  test('TC_05: Login with empty credentials', async ({ page }) => {
    const loginPage = new LoginPage(page);

    await loginPage.goto();
    await loginPage.login(users.empty.username, users.empty.password);

    // Expected outcome: an error is shown and login is denied
    await expect(loginPage.errorMessage).toBeVisible();
    await expect(loginPage.errorMessage).toContainText('Username is required');
    await expect(page).not.toHaveURL(/inventory\.html/);
    await expect(loginPage.loginButton).toBeVisible();
  });
});