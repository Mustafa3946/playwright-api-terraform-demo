import { test, expect } from '@playwright/test';
import { getUser } from './apiClient';

test('@api should fetch user successfully', async () => {
  const user = await getUser(1);
  expect(user).toHaveProperty('id', 1);
  expect(user).toHaveProperty('username');
});

test('@api should throw error for invalid user', async () => {
  await expect(getUser(9999)).rejects.toThrow('Failed to fetch user');
});

