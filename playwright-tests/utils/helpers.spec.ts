import { formatUsername } from './helpers';
import { test, expect } from '@playwright/test';

test('@utils should trim whitespace and convert to lowercase', () => {
  expect(formatUsername('  TestUser  ')).toBe('testuser');
});

test('@utils should handle empty string', () => {
  expect(formatUsername('')).toBe('');
});
