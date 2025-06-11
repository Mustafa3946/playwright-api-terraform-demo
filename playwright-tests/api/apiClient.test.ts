// Path: playwright-tests/api/apiClient.test.ts
// Purpose: Playwright tests for validating the getUser API client utility.

import { test, expect } from '@playwright/test';
import { getUser } from './apiClient';

// Test that getUser fetches a user with the correct properties
test('@api should fetch user successfully', async () => {
  const user = await getUser(1);
  expect(user).toHaveProperty('id', 1);
  expect(user).toHaveProperty('username');
});

// Test that getUser throws an error for an invalid user ID
test('@api should throw error for invalid user', async () => {
  await expect(getUser(9999)).rejects.toThrow('Failed to fetch user');
});

