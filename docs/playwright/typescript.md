# Playwright with TypeScript

## Setup

```bash
npm init playwright@latest
```

Choose TypeScript when the Playwright installer asks for the project language.

## Basic Test

```ts
import { test, expect } from '@playwright/test';

test('page has the expected title', async ({ page }) => {
	await page.goto('https://example.com');
	await expect(page).toHaveTitle(/Example Domain/);
});
```

## Recommended Practices

- Keep tests focused on one user behavior.
- Prefer accessible locators such as `getByRole` and `getByLabel`.
- Use web-first assertions instead of fixed delays.
- Store environment-specific values in configuration or environment variables.
- Run tests in parallel only when they do not share mutable state.

## Useful Commands

```bash
npx playwright test
npx playwright test --ui
npx playwright show-report
```
