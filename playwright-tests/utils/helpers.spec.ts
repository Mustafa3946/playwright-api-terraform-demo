// playwright-tests/utils/helpers.spec.ts
// Purpose: Unit tests for helper utility functions (formatUsername, formatDate).

import { formatUsername, formatDate } from './helpers';
import { test, expect } from '@playwright/test';

// Test that formatUsername trims whitespace and converts to lowercase
test('@utils should trim whitespace and convert to lowercase', () => {
  expect(formatUsername('  TestUser  ')).toBe('testuser');
});

// Test that formatUsername handles empty string
test('@utils should handle empty string', () => {
  expect(formatUsername('')).toBe('');
});

// Test that formatDate returns expected date string
test('formatDate returns expected date string', () => {
  expect(formatDate(new Date('2023-01-01'))).toBe('2023-01-01');
});
