// playwright-tests/utils/helpers.spec.ts
import { formatUsername, formatDate } from './helpers'; // Add formatDate here
import { test, expect } from '@playwright/test';

test('@utils should trim whitespace and convert to lowercase', () => {
  expect(formatUsername('  TestUser  ')).toBe('testuser');
});

test('@utils should handle empty string', () => {
  expect(formatUsername('')).toBe('');
});

test('formatDate returns expected date string', () => {
  expect(formatDate(new Date('2023-01-01'))).toBe('2023-01-01');
});
