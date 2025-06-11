// utils/helpers.ts
export function formatUsername(username: string): string {
  return username.trim().toLowerCase();
}
export function formatDate(date: Date): string {
  return date.toISOString().split('T')[0]; // This returns the date in 'YYYY-MM-DD' format
}