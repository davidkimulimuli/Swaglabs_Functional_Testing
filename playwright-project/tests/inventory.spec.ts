import { test, expect } from '@playwright/test';
import { LoginPage } from '../pages/LoginPage';
import { InventoryPage } from '../pages/InventoryPage';
import { users } from '../test-data/users';
import { allProducts, backpack } from '../test-data/products';

test.describe('Inventory', () => {
     test.beforeEach(async ({ page }) => {
    const loginPage = new LoginPage(page);
    await loginPage.goto();
    await loginPage.login(users.standard.username, users.standard.password);
    await expect(page).toHaveURL(/inventory\.html/);
  });
   test('TC_07: All products are displayed', async ({ page }) => {
    const inventory = new InventoryPage(page);

    await expect(inventory.items).toHaveCount(allProducts.length);
     await expect(inventory.itemNames).toHaveText(allProducts.map((p) => p.name));
    await expect(inventory.itemPrices).toHaveText(allProducts.map((p) => p.price));
       for (const item of await inventory.items.all()) {
      await expect(item.locator('img')).toBeVisible();
      await expect(item.getByTestId('inventory-item-desc')).not.toBeEmpty();
    }
  });
   test('TC_09: Add product to shopping cart', async ({ page }) => {
    const inventory = new InventoryPage(page);

    await expect(inventory.cartBadge).toHaveCount(0); // cart starts empty
    await inventory.addToCart(backpack.slug);
   await expect(inventory.cartBadge).toHaveText('1');
    await expect(inventory.removeButton(backpack.slug)).toBeVisible();
    await expect(inventory.addToCartButton(backpack.slug)).toHaveCount(0);
  });
});