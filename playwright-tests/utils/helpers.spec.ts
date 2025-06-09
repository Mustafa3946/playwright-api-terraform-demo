import { formatUsername } from './helpers';
import { test, expect } from '@playwright/test';

test('should trim whitespace and convert to lowercase', () => {
  expect(formatUsername('  TestUser  ')).toBe('testuser');
});

test('should handle empty string', () => {
  expect(formatUsername('')).toBe('');
});
