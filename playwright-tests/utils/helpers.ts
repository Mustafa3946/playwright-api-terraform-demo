// playwright-tests/utils/helpers.ts
// Purpose: Utility functions for formatting usernames and dates.

/**
 * Formats a username by trimming whitespace and converting to lowercase.
 * @param username - The username string to format.
 * @returns The formatted username.
 */
export function formatUsername(username: string): string {
  return username.trim().toLowerCase();
}

/**
 * Formats a Date object as a string in 'YYYY-MM-DD' format.
 * @param date - The Date object to format.
 * @returns The formatted date string.
 */
export function formatDate(date: Date): string {
  return date.toISOString().split('T')[0];
}